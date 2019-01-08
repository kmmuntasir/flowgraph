var graph_data = '';
// var graph_img = '';

$(document).ready(function() {
	graph_data = $.parseJSON($('#graph_data').html());
	// graph_img = $('#graph_img').html();

	console.log(graph_data);
	// console.log(graph_img);

	var img_width = $('#graph_img_background').width();
	// alert(img_width);
	var percentage = 65.488;
	// percentage = 64.7;
	img_width = img_width * (percentage/100);
	$('#graph_img_background').css('width', img_width);

	var dislocation_x = -25;
	var dislocation_y = 0;
	// dislocation_x = dislocation_y = 0;


	for (var idx in graph_data) {
		// console.log(graph_data[idx]);
		var pixel = '<div class="pixel" style="margin-top: '+ (graph_data[idx].x + dislocation_x) +'px; margin-left: '+ (graph_data[idx].y + dislocation_y) +'px;"><i class="fas fa-location-arrow"></i></div>';
		$('#pixel_container').append(pixel);
	}

	// <div class="pixel"></div>

	// $('#simulator_container');
});