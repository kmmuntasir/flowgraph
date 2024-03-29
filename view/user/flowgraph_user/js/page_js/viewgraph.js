
$(document).on('click', '.go_save_btn', function(){ 
	var user_id = $('#user_id').val();
	var graph_user_id = $('#graph_user_id').val();
	var graph_id = $(this).attr('graph_id');

	if(user_id) {
		// Other people's graph, saving as new, Or Own graph, saving changes
		$('#graph_save_modal').modal({
			'show':true,
			'focus': false
		});
	}
	else // Not logged in
		notify("You have to be logged in to save your graphs", 'warning');
});

$(document).on('submit', '#graph_save_form', function() {
	var user_id = $('#user_id').val();
	var graph_user_id = $('#graph_user_id').val();
	
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
		// $('#graph_save_form div input[name=graph_name]').val('');

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
