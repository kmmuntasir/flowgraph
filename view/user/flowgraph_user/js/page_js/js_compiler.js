
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