var graph_data = '';
var dislocation_x = -25;
var dislocation_y = 0;
var key = 0;
var start = 0;
var error_data = "asdf";
var simulation_enabled = true;

$(document).ready(function() {
	// Processing Graph Image
	var img_width = $('#graph_img_background').width();
	var percentage = 65.488;
	// percentage = 64.7;
	img_width = img_width * (percentage/100);
	$('#graph_img_background').css('width', img_width);


	graph_data = $('#graph_data').html();
	graph_data = $.parseJSON(graph_data);
	console.log(graph_data);




	start = $('#start_node').val();
	key = start;
	if(key == 'error') {
		alert("Start Node not found");
		simulation_enabled = false;
	}
	else {
		// Start Node Found

		// dislocation_x = dislocation_y = 0;

		var pixel = '<div id="pointer" class="pixel" style="margin-top: '+ (graph_data[key].x + dislocation_x) +'px; margin-left: '+ (graph_data[key].y + dislocation_y) +'px;"><i class="fas fa-location-arrow"></i></div>';
		$('#pixel_container').append(pixel);

		// Error Checking
		error_data = $('#error_data').html();
		error_data = $.parseJSON(error_data);
		if(error_data.length != 0) {
			// Process Errors
			console.log(error_data);
			simulation_enabled = false;
		}
	}
});

$(document).on('click', '#step_button', function() {
	if(!simulation_enabled) {
		alert("Simulation has stopped");
		return;
	}
	var next_key = 0;
	console.log(graph_data[key].category + ' - ' + graph_data[key].text);
	if(graph_data[key].category == 'condition') {
		var status = process_single_node(graph_data[key].category, graph_data[key].text);
		next_key = (status) ? graph_data[key].true : graph_data[key].false;
	}
	else {
		if(graph_data[key].category == 'end') {
			simulation_enabled = false;
			alert("Simulation has stopped");
		}
		else if(graph_data[key].category == 'io') {
			process_single_node(graph_data[key].category, graph_data[key].text);
		}
		next_key = graph_data[key].next;
	}
	if(!simulation_enabled) return;
	console.log(next_key);
	var next_m_top = graph_data[next_key].x + dislocation_x;
	var next_m_left = graph_data[next_key].y + dislocation_y;

	$('#pointer').css('margin-top', next_m_top);
	$('#pointer').css('margin-left', next_m_left);
	key = next_key;
});

$(document).on('click', '#reset_button', function() {
	if(error_data.length != 0) return;
	simulation_enabled = true;
	key = start;
	var next_m_top = graph_data[key].x + dislocation_x;
	var next_m_left = graph_data[key].y + dislocation_y;

	$('#pointer').css('margin-top', next_m_top);
	$('#pointer').css('margin-left', next_m_left);
});