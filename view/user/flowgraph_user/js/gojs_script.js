$(document).ready(function() {
	var url = $('#fetch_graph_url').val();
	$.post(url, function(data) {
		$('#mySavedModel').val(data);
		init();
	});
});

$(document).on('click', '#SaveButton', function(){ 
	save_graph();
});
$(document).on('click', '#LoadButton', function(){ 
	load_graph();
});
$(document).on('click', '.go_print_btn', function(){ 
	printDiagram();
});


$(document).on('click', '.go_thumb_btn', function(){ 
	createThumbnail();
});