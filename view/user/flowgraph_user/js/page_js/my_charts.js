$(document).on('click', '.delete_graph', function() {
	if(!confirm("Are you sure to delete this graph?")) {
		event.preventDefault();
		return;
	}

	var graph_id = $(this).attr('graph_id');
	var url = $(this).attr('href');

	$.post(url, {'graph_id':graph_id}, function(data) {
		if(data == 'success') {
			var id = 'graph_' + graph_id;
			$('#'+id).fadeOut(1000, function() {
				$('#'+id).remove();
			})
			notify('Successfully Deleted Graph', 'success');
		}
		else notify(data, 'danger');
	});


	event.preventDefault();
	return;

});