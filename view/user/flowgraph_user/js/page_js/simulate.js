var graph_data = '';
var dislocation_x = -25;
var dislocation_y = 0;
var key = 0;
var error_data = "asdf";

$(document).ready(function() {
	graph_data = $('#graph_data').html();
	if(isJson(graph_data)) {
		alert(graph_data);
	}
	// graph_data = isJson(graph_data) ? $.parseJSON($(graph_data) : '';


	error_data = $('#error_data').html();
	// alert(error_data);
	// error_data = isJson(error_data) ? $.parseJSON($(error_data) : '';

	if(error_data != '') {
		// alert("error");
		return;
	}

	return;

	key = $('#start_node').val();

	console.log(graph_data);

	var img_width = $('#graph_img_background').width();
	var percentage = 65.488;
	// percentage = 64.7;
	img_width = img_width * (percentage/100);
	$('#graph_img_background').css('width', img_width);

	var pixel = '<div id="pointer" class="pixel" style="margin-top: '+ (graph_data[key].x + dislocation_x) +'px; margin-left: '+ (graph_data[key].y + dislocation_y) +'px;"><i class="fas fa-location-arrow"></i></div>';
	$('#pixel_container').append(pixel);

	// dislocation_x = dislocation_y = 0;

	// var nodes = [];


	// for (var idx in graph_data) {
	// 	// nodes.push(idx);
	// 	var pixel = '<div class="pixel" style="margin-top: '+ (graph_data[idx].x + dislocation_x) +'px; margin-left: '+ (graph_data[idx].y + dislocation_y) +'px;"><i class="fas fa-location-arrow"></i></div>';
	// 	$('#pixel_container').append(pixel);
	// }
	// console.log(nodes);

	// <div class="pixel"></div>

	// $('#simulator_container');
});

$(document).on('click', '#step_button', function() {
	var next_key = 0;
	console.log(graph_data[key].category + ' - ' + graph_data[key].text);
	if(graph_data[key].category == 'condition') {
		var status = process_single_node(graph_data[key].category, graph_data[key].text);
		next_key = (status) ? graph_data[key].true : graph_data[key].false;
	}
	else {
		if(graph_data[key].category == 'io') {
			process_single_node(graph_data[key].category, graph_data[key].text);
		}
		next_key = graph_data[key].next;
	}
	console.log(next_key);
	var next_m_top = graph_data[next_key].x + dislocation_x;
	var next_m_left = graph_data[next_key].y + dislocation_y;

	$('#pointer').css('margin-top', next_m_top);
	$('#pointer').css('margin-left', next_m_left);
	key = next_key;
});