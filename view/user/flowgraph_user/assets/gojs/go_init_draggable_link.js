function init() {
    if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
    var $ = go.GraphObject.make;  // for conciseness in defining templates

    myDiagram =
      $(go.Diagram, "myDiagramDiv",  // must name or refer to the DIV HTML element
      {
        // "LinkDrawn": showLinkLabel,  // this DiagramEvent listener is defined below
        // "LinkRelinked": showLinkLabel,
        grid: $(go.Panel, "Grid",
          $(go.Shape, "LineH", { stroke: "lightgray", strokeWidth: 0.5 }),
          $(go.Shape, "LineH", { stroke: "gray", strokeWidth: 0.5, interval: 10 }),
          $(go.Shape, "LineV", { stroke: "lightgray", strokeWidth: 0.5 }),
          $(go.Shape, "LineV", { stroke: "gray", strokeWidth: 0.5, interval: 10 })
          ),
          allowDrop: true,  // must be true to accept drops from the Palette
          "draggingTool.dragsLink": true,
          "draggingTool.isGridSnapEnabled": true,
          "linkingTool.isUnconnectedLinkValid": true,
          "linkingTool.portGravity": 20,
          "relinkingTool.isUnconnectedLinkValid": true,
          "relinkingTool.portGravity": 20,
          "relinkingTool.fromHandleArchetype":
          $(go.Shape, "Diamond", { segmentIndex: 0, cursor: "pointer", desiredSize: new go.Size(8, 8), fill: "tomato", stroke: "darkred" }),
          "relinkingTool.toHandleArchetype":
          $(go.Shape, "Diamond", { segmentIndex: -1, cursor: "pointer", desiredSize: new go.Size(8, 8), fill: "darkred", stroke: "tomato" }),
          "linkReshapingTool.handleArchetype":
          $(go.Shape, "Diamond", { desiredSize: new go.Size(7, 7), fill: "lightblue", stroke: "deepskyblue" }),
          rotatingTool: $(TopRotatingTool),  // defined below
          "rotatingTool.snapAngleMultiple": 15,
          "rotatingTool.snapAngleEpsilon": 15,
          // "animationManager.isEnabled": false,
          "undoManager.isEnabled": true
        });

    // when the document is modified, add a "*" to the title and enable the "Save" button
    myDiagram.addDiagramListener("Modified", function(e) {
      var button = document.getElementById("SaveButton");
      if (button && myDiagram.isModified) button.disabled = false;
      var idx = document.title.indexOf("*");
      if (myDiagram.isModified) {
        if (idx < 0) document.title += "*";
      } else {
        if (idx >= 0) document.title = document.title.substr(0, idx);
      }
    });

    // Define a function for creating a "port" that is normally transparent.
    // The "name" is used as the GraphObject.portId, the "spot" is used to control how links connect
    // and where the port is positioned on the node, and the boolean "output" and "input" arguments
    // control whether the user can draw links from or to the port.
    function makePort(name, spot, output, input) {
      // the port is basically just a small transparent square
      return $(go.Shape, "Circle",
      {
                  fill: null,  // not seen, by default; set to a translucent gray by showSmallPorts, defined below
                  stroke: null,
                  desiredSize: new go.Size(7, 7),
                  alignment: spot,  // align the port on the main Shape
                  alignmentFocus: spot,  // just inside the Shape
                  portId: name,  // declare this object to be a "port"
                  fromSpot: spot, toSpot: spot,  // declare where links may connect at this port
                  fromLinkable: output, toLinkable: input,  // declare whether the user may draw links to/from here
                  cursor: "pointer"  // show a different cursor to indicate potential link point
                });
    }

    var nodeSelectionAdornmentTemplate =
    $(go.Adornment, "Auto",
      $(go.Shape, { fill: null, stroke: "deepskyblue", strokeWidth: 1.5, strokeDashArray: [4, 2] }),
      $(go.Placeholder)
      );

    var nodeResizeAdornmentTemplate =
    $(go.Adornment, "Spot",
      { locationSpot: go.Spot.Right },
      $(go.Placeholder),
      $(go.Shape, { alignment: go.Spot.TopLeft, cursor: "nw-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),
      $(go.Shape, { alignment: go.Spot.Top, cursor: "n-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),
      $(go.Shape, { alignment: go.Spot.TopRight, cursor: "ne-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),

      $(go.Shape, { alignment: go.Spot.Left, cursor: "w-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),
      $(go.Shape, { alignment: go.Spot.Right, cursor: "e-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),

      $(go.Shape, { alignment: go.Spot.BottomLeft, cursor: "se-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),
      $(go.Shape, { alignment: go.Spot.Bottom, cursor: "s-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" }),
      $(go.Shape, { alignment: go.Spot.BottomRight, cursor: "sw-resize", desiredSize: new go.Size(6, 6), fill: "lightblue", stroke: "deepskyblue" })
      );

    var nodeRotateAdornmentTemplate =
    $(go.Adornment,
      { locationSpot: go.Spot.Center, locationObjectName: "CIRCLE" },
      $(go.Shape, "Circle", { name: "CIRCLE", cursor: "pointer", desiredSize: new go.Size(7, 7), fill: "lightblue", stroke: "deepskyblue" }),
      $(go.Shape, { geometryString: "M3.5 7 L3.5 30", isGeometryPositioned: true, stroke: "deepskyblue", strokeWidth: 1.5, strokeDashArray: [4, 2] })
      );

    myDiagram.nodeTemplate =
    $(go.Node, "Spot",
      { locationSpot: go.Spot.Center },
      new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
      { selectable: true, selectionAdornmentTemplate: nodeSelectionAdornmentTemplate },
      { resizable: true, resizeObjectName: "PANEL", resizeAdornmentTemplate: nodeResizeAdornmentTemplate },
      { rotatable: true, rotateAdornmentTemplate: nodeRotateAdornmentTemplate },
      new go.Binding("angle").makeTwoWay(),
        // the main object is a Panel that surrounds a TextBlock with a Shape
        $(go.Panel, "Auto",
          { name: "PANEL" },
          new go.Binding("desiredSize", "size", go.Size.parse).makeTwoWay(go.Size.stringify),
          $(go.Shape, "Rectangle",  // default figure
          {
              portId: "", // the default port: if no spot on link data, use closest side
              fromLinkable: true, toLinkable: true, cursor: "pointer",
              fill: "white",  // default color
              strokeWidth: 2
            },
            new go.Binding("figure"),
            new go.Binding("fill")),
          $(go.TextBlock,
          {
            font: "bold 11pt Helvetica, Arial, sans-serif",
            margin: 8,
            maxSize: new go.Size(160, NaN),
            wrap: go.TextBlock.WrapFit,
            editable: true
          },
          new go.Binding("text").makeTwoWay())
          ),
        // four small named ports, one on each side:
        makePort("T", go.Spot.Top, false, true),
        makePort("L", go.Spot.Left, true, true),
        makePort("R", go.Spot.Right, true, true),
        makePort("B", go.Spot.Bottom, true, false),
        { // handle mouse enter/leave events to show/hide the ports
          mouseEnter: function(e, node) { showSmallPorts(node, true); },
          mouseLeave: function(e, node) { showSmallPorts(node, false); }
        }
        );

    function showSmallPorts(node, show) {
      node.ports.each(function(port) {
        if (port.portId !== "") {  // don't change the default port, which is the big shape
          port.fill = show ? "rgba(0,0,0,.3)" : null;
      }
    });
    }

    var linkSelectionAdornmentTemplate =
    $(go.Adornment, "Link",
      $(go.Shape,
          // isPanelMain declares that this Shape shares the Link.geometry
          { isPanelMain: true, fill: null, stroke: "deepskyblue", strokeWidth: 0 })  // use selection object's strokeWidth
      );

    myDiagram.linkTemplate =
      $(go.Link,  // the whole link panel
        { selectable: true, selectionAdornmentTemplate: linkSelectionAdornmentTemplate },
        { relinkableFrom: true, relinkableTo: true, reshapable: true },
        {
          routing: go.Link.AvoidsNodes,
          curve: go.Link.JumpOver,
          corner: 5,
          toShortLength: 4
        },
        new go.Binding("points").makeTwoWay(),
        $(go.Shape,  // the link path shape
          { isPanelMain: true, strokeWidth: 2 }),
        $(go.Shape,  // the arrowhead
          { toArrow: "Standard", stroke: null }),
        $(go.Panel, "Auto",
          new go.Binding("visible", "isSelected").ofObject(),
          $(go.Shape, "RoundedRectangle",  // the link shape
            { fill: "#F8F8F8", stroke: null }),
          $(go.TextBlock,
          {
            textAlign: "center",
            font: "10pt helvetica, arial, sans-serif",
            stroke: "#919191",
            margin: 2,
            minSize: new go.Size(10, NaN),
            editable: true
          },
          new go.Binding("text").makeTwoWay())
          )
        );


      // Make link labels visible if coming out of a "conditional" node.
      // This listener is called by the "LinkDrawn" and "LinkRelinked" DiagramEvents.
      function showLinkLabel(e) {
        var label = e.subject.findObject("LABEL");
        if (label !== null) label.visible = (e.subject.fromNode.data.type === "condition");
      }

      // temporary links used by LinkingTool and RelinkingTool are also orthogonal:
      myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
      myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;


    load_graph();  // load an initial diagram from some JSON text

    // initialize the Palette that is on the left side of the page
    myPalette =
      $(go.Palette, "myPaletteDiv",  // must name or refer to the DIV HTML element
      {
        maxSelectionCount: 1,
        "animationManager.isEnabled": false,
        nodeTemplateMap: myDiagram.nodeTemplateMap,  // share the templates used by myDiagram
        linkTemplate: // simplify the link template, just in this Palette
          /* ============================================================= */
          $(go.Link,
              { // because the GridLayout.alignment is Location and the nodes have locationSpot == Spot.Center,
                // to line up the Link in the same manner we have to pretend the Link has the same location spot
                locationSpot: go.Spot.Center,
                selectionAdornmentTemplate:
                $(go.Adornment, "Link",
                  { locationSpot: go.Spot.Center },
                  $(go.Shape,
                    { isPanelMain: true, fill: null, stroke: "deepskyblue", strokeWidth: 0 }),
                    $(go.Shape,  // the arrowhead
                      { toArrow: "Standard", stroke: null })
                    )
              },
              {
                routing: go.Link.AvoidsNodes,
                curve: go.Link.JumpOver,
                corner: 5,
                toShortLength: 4
              },
              new go.Binding("points"),
              $(go.Shape,  // the link path shape
                { isPanelMain: true, strokeWidth: 2 }),
              $(go.Shape,  // the arrowhead
                { toArrow: "Standard", stroke: null })
              ),
          /* ============================================================= *
          $(go.Link,  // the whole link panel
            {
              routing: go.Link.AvoidsNodes,
              curve: go.Link.JumpOver,
              corner: 5, toShortLength: 4,
              relinkableFrom: true,
              relinkableTo: true,
              reshapable: true,
              resegmentable: true,
              // mouse-overs subtly highlight links:
              mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },
              mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; },
              selectionAdorned: false
            },
            new go.Binding("points").makeTwoWay(),
            $(go.Shape,  // the highlight shape, normally transparent
              { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }),
            $(go.Shape,  // the link path shape
              { isPanelMain: true, stroke: "gray", strokeWidth: 2 },
              new go.Binding("stroke", "isSelected", function(sel) { return sel ? "dodgerblue" : "gray"; }).ofObject()),
            $(go.Shape,  // the arrowhead
              { toArrow: "standard", strokeWidth: 0, fill: "gray"}),
            $(go.Panel, "Auto",  // the link label, normally not visible
              { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5},
              new go.Binding("visible", "visible").makeTwoWay(),
              $(go.Shape, "RoundedRectangle",  // the label shape
                { fill: "#F8F8F8", strokeWidth: 0 }),
              $(go.TextBlock, "Yes",  // the label
                {
                  textAlign: "center",
                  font: "10pt helvetica, arial, sans-serif",
                  stroke: "#333333",
                  editable: true
                },
                new go.Binding("text").makeTwoWay())
            )
          ),
          /* ============================================================= */
          model: new go.GraphLinksModel([  // specify the contents of the Palette
            { text: "--------------\n\n", figure: "Rectangle", fill: "rgba(0,0,0,0.0)" },
            { text: "Start", figure: "Circle", fill: "#00AD5F", type: "start" },
            { text: "Step", figure: "Rectangle", fill: "whitesmoke", type: "step"},
            { text: "Input/Output", figure: "Parallelogram1", fill: "orange", type: "io"},
            // { text: "DB", figure: "Database", fill: "lightgray" },
            { text: "Condition", figure: "Diamond", fill: "lightskyblue", type: "condition"},
            { text: "Comment", figure: "Rectangle", fill: "lightyellow", type: "comment"},
            { text: "Stop", figure: "Circle", fill: "#CE0620", type: "end"}
            ], [
            // the Palette also has a disconnected Link, which the user can drag-and-drop
            { points: new go.List(go.Point).addAll([new go.Point(0, 0), new go.Point(30, 0), new go.Point(30, 40), new go.Point(60, 40)]) }
            ])
        });
    }


    function TopRotatingTool() {
      go.RotatingTool.call(this);
    }
    go.Diagram.inherit(TopRotatingTool, go.RotatingTool);

    /** @override */
    TopRotatingTool.prototype.updateAdornments = function(part) {
      go.RotatingTool.prototype.updateAdornments.call(this, part);
      var adornment = part.findAdornment("Rotating");
      if (adornment !== null) {
      adornment.location = part.rotateObject.getDocumentPoint(new go.Spot(0.5, 0, 0, -30));  // above middle top
    }
  };

  /** @override */
  TopRotatingTool.prototype.rotate = function(newangle) {
    go.RotatingTool.prototype.rotate.call(this, newangle + 90);
  };
  // end of TopRotatingTool class


  // Show the diagram's model in JSON format that the user may edit
  function save_graph() {
    saveDiagramProperties();  // do this first, before writing to JSON
    document.getElementById("mySavedModel").value = myDiagram.model.toJson();
    myDiagram.isModified = false;
  }
  function load_graph() {
    myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
    loadDiagramProperties();  // do this after the Model.modelData has been brought into memory
  }

  function saveDiagramProperties() {
    myDiagram.model.modelData.position = go.Point.stringify(myDiagram.position);
  }
  function loadDiagramProperties(e) {
    // set Diagram.initialPosition, not Diagram.position, to handle initialization side-effects
    var pos = myDiagram.model.modelData.position;
    if (pos) myDiagram.initialPosition = go.Point.parse(pos);
    post_load_fn();
  }

  
  // print the diagram by opening a new window holding SVG images of the diagram contents for each page
  function printDiagram() {
    var svgWindow = window.open();
    if (!svgWindow) return;  // failure to open a new Window
    var printSize = new go.Size(700, 960);
    var bnds = myDiagram.documentBounds;
    var x = bnds.x;
    var y = bnds.y;
    while (y < bnds.bottom) {
      while (x < bnds.right) {
        var svg = myDiagram.makeSVG({ scale: 1.0, position: new go.Point(x, y), size: printSize });
        svgWindow.document.body.appendChild(svg);
        x += printSize.width;
      }
      x = bnds.x;
      y += printSize.height;
    }
    setTimeout(function() { svgWindow.print(); }, 1);
  }

  function createThumbnail() {
    var img = myDiagram.makeImage({
      scale: 1,
      size: new go.Size(500, NaN),
      background: "white",
      details: 0.4,
      type: "image/jpeg"
    });
    // $('body').append(img);
    var base64 = $(img).attr('src');
    // console.log(base64);
    return base64;
  }


  function createImage() {
    var img = myDiagram.makeImage({
      scale: 1.5,
      background: "white",
      details: 1,
      type: "image/jpeg"
    });
    // $('body').append(img);
    var base64 = $(img).attr('src');
    // console.log(base64);
    return base64;
  }