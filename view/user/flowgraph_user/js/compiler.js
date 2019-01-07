var v = [];
var curr_node = 0;
var nodes = [];
var var_list = [];

window.onerror = function(e) {
	alert("There's an error in node " + curr_node + ": " + e);
};

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

function isDigit(ch){
  return /^[0-9]$/i.test(ch);
}

function isAlpha(ch){
  return /^[A-Z]$/i.test(ch);
}

function sanitize(text) {
	text = text.trim(); // Removing preceeding and trailing spaces
	text = text.replace(/\s\s+/g, ' '); // Replacing multiple spaces with single space
	return text;
}

// function replace_all(text, search, replacement) {
// 	return text.replace(new RegExp(search, 'g'), replacement);

// 	// replace(/\+/g, ' ');
// }

function replace_all(text, search, replacement) {
	while(text.indexOf(search) != -1) text = text.replace(search, replacement);
	return text;
}

function divide(str, splitter) {
	var splitIdx = str.indexOf(splitter);
	var str_parts = [];
	if(splitIdx == -1) {
		str_parts[0] = str;
	}
	else {
		str_parts[0] = str.substr(0, splitIdx);
		str_parts[1] = str.substr(splitIdx+splitter.length);
	}
	return str_parts;
}

function validate_identifier(variable_name) {
	if(isAlpha(variable_name.substr(0, 1)) || variable_name.substr(0, 1) == '_' ) {
		for (var i = 1; i < variable_name.length; i++) {
		  if(!(isAlpha(variable_name.charAt(i)) || isDigit(variable_name.charAt(i)) || variable_name.charAt(i) == '_')) return false; 
		}
		return true;
	}
	else return false;
}

function extractAllQuotedText(str){
  const re = /"(.*?)"/g;
  const result = [];
  let current;
  while (current = re.exec(str)) {
    result.push(current.pop());
  }
  return result.length > 0 ? result : [str];
}

function check_var(var_name) {
	return (v[var_name] != undefined);
}

function new_var(var_name) {
	// Process animations
}

function initiate_sample_data() {
	v['x'] = 50;
	v['y'] = 10;
	v['a'] = 35;
	v['b'] = 20;

	var_list.push('x');
	var_list.push('y');
	var_list.push('a');
	var_list.push('b');

	// return;

	// x+y+z
	// ((x+y)*(a-b))/2
	// p
	// 5
	// var exp = '((x+y)*(a-b))/2';

	// var value = parse_expression(exp);
	// alert(value);

	// return;

	nodes.push({'category':'step', 'text':'p:=q:=r:=((x+y)*(a-b))/2'});
	nodes.push({'category':'step','text':'Sum:=0'});
	nodes.push({'category':'step','text':'sum := 3'});
	nodes.push({'category':'step','text':'Sum:=97, i:=1'});
	nodes.push({'category':'step','text':'i := i + 1'});
	nodes.push({'category':'step','text':'Sum := Sum + i'});

	nodes.push({'category':'condition','text':'i<N'});
	nodes.push({'category':'condition','text':'(i<N)'});
	nodes.push({'category':'condition','text':'((i<Sum))'});
	nodes.push({'category':'condition','text':'((i+N) > 3)'});
	nodes.push({'category':'condition','text':'(i>N) AND (i=1)'});
	nodes.push({'category':'condition','text':'(i<N) AND ((i=1) OR (i=2))'});

	nodes.push({'category':'io','text':'Read Sum'});
	nodes.push({'category':'io','text':'Print "Hello World"'});
	nodes.push({'category':'io','text':'   Input     N '});
	nodes.push({'category':'io','text':'show p'});
	nodes.push({'category':'io','text':'read x, y'});

}

function process_single_node(node) {
	if(node.category == 'io') {
		console.log(node.text);
		io_process(node.text);
	}
	else if(node.category == 'step') {
		comma_separated_steps = node.text.split(',');
		console.log(comma_separated_steps);
		for(var k=0; k<comma_separated_steps.length; ++k) {
			step_process(comma_separated_steps[k]);	
		}
	}
	else if(node.category == 'condition') {
		var condition_result = condition_process(node.text);
		console.log(condition_result);
	}
}

// ============================ IO Functions ========================

function io_process(text) {
	text = sanitize(text);

	iotemp = divide(text, ' ');
	// var splitIdx = text.indexOf(' ');
	// var iotemp = [];
	// iotemp[0] = text.substr(0, splitIdx);
	// iotemp[1] = sanitize(text.substr(splitIdx+1));


	// Valid I/O structure
	var command = iotemp[0];
	command = command.toLowerCase();
	if(command == 'input' || command == 'read' || command == 'fetch' || command == 'get') {
		// Input Statement
		io_process_input(iotemp[1]);
	}
	else if(command == 'output' || command == 'print' || command == 'show' || command == 'display') {
		// Output Statement
		io_process_output(iotemp[1]);
	}
	else {
		alert('This is not a valid Input/Output Statement');
	}
}

function io_process_output(str) {
	var fc = str.substr(0, 1);
	var lc = str.substr(str.length - 1, 1);
	var mp = str.substr(1, (str.length-2));

	if(fc == '"' && lc == '"' && mp.indexOf('"') == -1) { // first and last characters are double quotes, and there are no other double quote in it.
		// Valid quoted string
		// output this string (str);
	}
	else { // Possible Variable
		if(validate_identifier(str)){
			// Valid variable
			// Output the value of the variable if it exists, if not then throw exception
		}
		else {
			// Invalid variable && Invalid Quoted String
			// Invalid IO Statement
		}
	}
}

function io_process_input(str) {
	var potential_vars = str.split(',');
	for(var i=0; i<potential_vars.length; ++i) {
		potential_vars[i] = sanitize(potential_vars[i]);
		
		if(validate_identifier(potential_vars[i])){
			// Valid variable
			// Create the variable if doesn't exist, then Input the value of the variable
			if(!check_var(potential_vars[i])) {
				var_list.push(potential_vars[i]);
				new_var(potential_vars[i]);
			}
			v[potential_vars[i]] = 5;
		}
		else {
			// Invalid variable
			// Invalid IO Statement
		}
	}
}

// ======================== Step Functions =====================

function step_process(step_text, level=0) {
	// console.log(step_text + ' - ' + level);
	if(level==0) step_text = replace_all(step_text, ' ', '');
	var step_parts = divide(step_text, ':=');

	// console.log(step_parts);

	if(step_parts.length < 2) {
		if(level == 0) {
			// Invalid step, no assignment operator found
			// Throw exception
			console.log("Invalid Step");
		}
		else {
			// Possibly expression
			return parse_expression(step_text);
		}
	}
	else {
		if(validate_identifier(step_parts[0])) {
			// console.log(step_parts[0]);
			// console.log(step_parts[1]);
			var step_temp = step_process(step_parts[1], ++level);

			// console.log(step_parts[0] + "=" + step_parts[1] + ' => ' + step_temp);

			if(step_temp !== false) {
				if(!check_var(step_parts[0])) {
					var_list.push(step_parts[0]);
					new_var(step_parts[0]);
				}
				v[step_parts[0]] = parseInt(step_temp);
				// Process animation for showing this new/old variable
				// console.log(step_parts[0] + ' => ' + v[step_parts[0]]);
				return v[step_parts[0]];
			}
			else return false;
		}
		else {
			return false;
		}
	}
}

function parse_expression(exp_str) {
	// x+y+z
	// ((x+y)*(a-b))/2
	// p
	// 5

	var exp = exp_str; // taking backup
	exp = replace_all(exp, "(", " ");
	exp = replace_all(exp, ")", " ");
	exp = replace_all(exp, "+", " ");
	exp = replace_all(exp, "-", " ");
	exp = replace_all(exp, "*", " ");
	exp = replace_all(exp, "/", " ");
	exp = replace_all(exp, "%", " ");

	exp = sanitize(exp);
	var vars = exp.split(' ');
	if(vars.length == 1) return process_var_const(exp); //single variable or constant
	else { // multiple variables and/or constants found

		// console.log(exp_str);
		for(var i=0; i<vars.length; ++i) {
			var val_temp = process_var_const(vars[i]);
			if(val_temp === false) return false; // value not found
			// value found, replace this variable (if) name with this value in the expression
			if(val_temp == vars[i]) continue; // constant, no need to replace
			exp_str = replace_all(exp_str, vars[i], val_temp);
			console.log(exp_str);
		}
		var final_value = eval(exp_str);
		return final_value;
	}
}

function process_var_const(exp) {
	if($.isNumeric(exp)) return exp; // constant
	// variable
	if(!validate_identifier(exp)) return false; // invalid variable name
	// valid variable name
	if(!check_var(exp)) return false; //non-existent variable
	// existing valid variable
	return v[exp]; // return the value of the variable
}


// ======================== Condition Functions =====================


function condition_process(condition, level=0) {
	return parse_condition(condition);
}


function parse_condition(exp_str) {
	// 5>1 && (1==1 || 5<1)
	// (i<5) AND ((i=1) OR (i=2))

	console.log(exp_str);

	exp_str = replace_all(exp_str, "AND", "&&");
	exp_str = replace_all(exp_str, "OR", "||");
	exp_str = replace_all(exp_str, "NOT", "!");
	exp_str = replace_all(exp_str, "and", "&&");
	exp_str = replace_all(exp_str, "or", "||");
	exp_str = replace_all(exp_str, "not", "!");

	var exp = exp_str; // taking backup
	exp = replace_all(exp, "(", " ");
	exp = replace_all(exp, ")", " ");
	exp = replace_all(exp, "<", " ");
	exp = replace_all(exp, ">", " ");
	exp = replace_all(exp, "=", " ");
	exp = replace_all(exp, "&", " ");
	exp = replace_all(exp, "|", " ");
	exp = replace_all(exp, "!", " ");
	exp = replace_all(exp, "+", " ");
	exp = replace_all(exp, "-", " ");
	exp = replace_all(exp, "*", " ");
	exp = replace_all(exp, "/", " ");
	exp = replace_all(exp, "%", " ");

	exp = sanitize(exp);
	var vars = exp.split(' ');
	if(vars.length == 1) return process_var_const(exp); //single variable or constant
	else { // multiple variables and/or constants found

		// console.log(exp_str);
		for(var i=0; i<vars.length; ++i) {
			var val_temp = process_var_const(vars[i]);
			if(val_temp === false) return false; // value not found
			// value found, replace this variable (if) name with this value in the expression
			if(val_temp == vars[i]) continue; // constant, no need to replace
			exp_str = replace_all(exp_str, vars[i], val_temp);
			// console.log(exp_str);
		}

		exp_str = replace_all(exp_str, "=", "$");
		exp_str = replace_all(exp_str, "$", "==");

		console.log(exp_str);

		var final_value = eval(exp_str);
		return final_value;
	}
}