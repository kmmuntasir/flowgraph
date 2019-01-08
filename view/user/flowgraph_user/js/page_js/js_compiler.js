

function output(data) {
	data = replace_all(data, '<', '&lt');
	data = replace_all(data, '>', '&gt');
	$('#output').append('<pre>'+data+'</pre>');
}


function display_vars() {
	var blank_str = "";
	var delimiter = "";
	for(var k=0; k<var_list.length; ++k) {
		blank_str += delimiter + var_list[k] + ' = ' + v[var_list[k]];
		delimiter = ", ";
	}
	$('#output').append('<pre>'+blank_str+'</pre><hr>');
}

$(document).ready(function() {
	// Placing sample data in nodes array
	initiate_sample_data();


	// Calling process fn for every item in nodes array
	for(var i=0; i<nodes.length; i++) {
		curr_node = i;
		process_single_node(nodes[i]);

		output(nodes[i].category + ': ' + nodes[i].text);
		display_vars();
		// console.log(v);
		// console.log(var_list);
	}
});