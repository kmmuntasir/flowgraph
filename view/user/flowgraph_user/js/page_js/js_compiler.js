function output(data) {
	$('#output').append('<pre>'+data+'</pre>');
}

function sanitize(text) {
	text = text.trim(); // Removing preceeding and trailing spaces
	text = text.replace(/\s\s+/g, ' '); // Replacing multiple spaces with single space
	return text;
}

function extractAllQuotedText(str){
  const re = /"(.*?)"/g;
  const result = [];
  let current;
  while (current = re.exec(str)) {
    result.push(current.pop());
  }
  return result.length > 0
    ? result
    : [str];
}

$(document).ready(function() {





	// return;
	var v = [];
	var nodes = [];
	nodes[0] = {'type':'step','text':'Sum=0'};
	nodes[1] = {'type':'step','text':'Sum = 0'};
	nodes[2] = {'type':'step','text':'Sum=0, i=1'};
	nodes[3] = {'type':'io','text':'   Input     N  k  '};
	nodes[4] = {'type':'step','text':'i = i + 1'};
	nodes[5] = {'type':'step','text':'Sum:=0'};
	nodes[6] = {'type':'condition','text':'i<N'};
	nodes[7] = {'type':'step','text':'Sum = Sum + i'};
	nodes[8] = {'type':'io','text':'Read Sum'};
	nodes[9] = {'type':'io','text':'Print "haha I forgot to laugh"'};
	nodes[10] = {'type':'io','text':'show p'};
	// nodes[11] = {'type':'step','text':'Sum=0'};
	// nodes[12] = {'type':'step','text':'Sum=0'};
	// nodes[13] = {'type':'step','text':'Sum=0'};
	// nodes[14] = {'type':'step','text':'Sum=0'};
	// nodes[15] = {'type':'step','text':'Sum=0'};
	// nodes[16] = {'type':'step','text':'Sum=0'};
	// nodes[17] = {'type':'step','text':'Sum=0'};
	// nodes[18] = {'type':'step','text':'Sum=0'};
	// nodes[19] = {'type':'step','text':'Sum=0'};
	// nodes[20] = {'type':'step','text':'Sum=0'};
	// nodes[21] = {'type':'step','text':'Sum=0'};
	// nodes[22] = {'type':'step','text':'Sum=0'};

	for(var i=0; i<nodes.length; i++) {
		if(nodes[i].type == 'io') {
			nodes[i].text = sanitize(nodes[i].text);
			// var temp = nodes[i].text.split(' ');
			var fidx = nodes[i].text.indexOf(' ');
			// alert(fidx);
			var iotemp = [];
			iotemp[0] = nodes[i].text.substr(0, fidx);
			iotemp[1] = nodes[i].text.substr(fidx+1);


			// console.log(iotemp);
			// Valid I/O structure
			var command = iotemp[0];
			command = command.toLowerCase();
			if(command == 'input' || command == 'read' || command == 'fetch' || command == 'get') {
				// Input Statement
			}
			else if(command == 'output' || command == 'print' || command == 'show' || command == 'display') {
				// Output Statement

				var str = iotemp[1];
				str = sanitize(str);
				var fc = str.substr(0, 1);
				var lc = str.substr(str.length - 1, 1);
				var mp = str.substr(1, (str.length-2));

				if(fc == '"' && lc == '"' && mp.indexOf('"') == -1) {
					// Valid quoted string
					// output this string (str);
				}
				else { // Possible Variable
					vartemp = str.split(' ');
					if(vartemp.length == 1 && str.indexOf('"') == -1){
						// Valid variable
						// Output the value of the variable if it exists, if not then throw exception
					}
					else {
						// Invalid variable && Invalid Quoted String
						// Invalid IO Statement
					}
				}


			}
			else {
				alert('This is not a valid Input/Output Statement');
			}

			// ======================================
			output(nodes[i].type + ': ' + nodes[i].text);

		}

		// output(nodes[i].type + ': ' + nodes[i].text);
	}
});