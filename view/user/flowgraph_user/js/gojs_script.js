$(document).ready(function() {
	var url = "http://localhost/flowgraph/index.php/home/graph_json";
	$.post(url, function(data) {
		$('#mySavedModel').val(data);
		init();
	});
});