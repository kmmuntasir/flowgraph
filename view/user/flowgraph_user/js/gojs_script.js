$(document).ready(function() {
	init();
	// var url = $('#fetch_graph_url').val();
	// $.post(url, function(data) {
	// 	$('#mySavedModel').val(data);
	// 	init();
	// });
});

function pre_load_fn() {
	$('#curtain_2 p').html('Loading Graph ...');
}

function post_load_fn() {
	$('#curtain_2 p').html('Loading Complete');
}

$(document).on('click', '#SaveButton', function(){ 
	save_graph();
});
$(document).on('click', '#LoadButton', function(){ 
	load_graph();
});

$(document).on('click', '.go_print_btn', function(){ 
	printDiagram();
});

$(document).on('click', '#go_img_btn', function(){ 
	var base64 = createImage();
	$('#go_img_btn').attr('href', base64);
	return;
});

$(document).on('click', '.go_simulate_btn', function(){ 
	save_graph();
	var graph_img = createImage();
	var graph_data = $('#mySavedModel').html();
	
	$('textarea[name=graph_img]').html(graph_img);
	$('textarea[name=graph_data]').html(graph_data);

	$('#simulate_form').submit();
});


