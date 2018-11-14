$(document).ready(function() {
	init();
	// var url = $('#fetch_graph_url').val();
	// $.post(url, function(data) {
	// 	$('#mySavedModel').val(data);
	// 	init();
	// });
});

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



$(document).on('click', '.go_save_btn', function(){ 
	var user_id = $('#user_id').val();

	if(user_id) {
		$('#graph_save_modal').modal({
			'show':true,
			'focus': false
		});
	}
	else {
		notify("You have to be logged in to save your graphs", 'warning');
	}
});

$(document).on('submit', '#graph_save_form', function() {
	save_graph();
	var action = $(this).prop('action');
	var graph = $('#mySavedModel').val();
	var img = createThumbnail();
	var graph_name = $('#graph_save_form div input[name=graph_name]').val();
	var postdata = {
		'graph_json':graph,
		'graph_thumb':img,
		'graph_name':graph_name
	};
	show_loader('Please wait while the graph is being saved');
	$.post(action, postdata, function(data) {
		hide_loader();
		$('#graph_save_modal').modal('hide');
		$('#graph_save_form div input[name=graph_name]').val('');

		if(data=='success') {
			$('#SaveButton').attr('disabled', 'disabled');
			notify('Successfully Saved Graph', 'success');
		}
		else {
			notify(data, 'danger');
		}
	});

	event.preventDefault();
});

