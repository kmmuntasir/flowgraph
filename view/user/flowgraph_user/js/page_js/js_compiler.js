var v = [];

function output(data) {
	$('#output').append('<pre>'+data+'</pre>');
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

$(document).ready(function() {

	// var str = "hello589ddkk";

	// var temp = replace_all(str, 'd', 'p');

	// alert(temp);

	// return;

	v['x'] = 5;
	v['y'] = 10;
	v['a'] = 15;
	v['b'] = 20;

	var exp = '((x+y)*(a-b))/2';

	var value = parse_expression(exp);
	alert(value);

	return;
	var nodes = [];
	nodes[0] = {'type':'step','text':'Sum=0'};
	nodes[1] = {'type':'step','text':'Sum = 0'};
	nodes[2] = {'type':'step','text':'Sum=0, i=1'};
	nodes[3] = {'type':'io','text':'   Input     N '};
	nodes[4] = {'type':'step','text':'i = i + 1'};
	nodes[5] = {'type':'step','text':'Sum:=0'};
	nodes[6] = {'type':'condition','text':'i<N'};
	nodes[7] = {'type':'step','text':'Sum = Sum + i'};
	nodes[8] = {'type':'io','text':'Read Sum'};
	nodes[9] = {'type':'io','text':'Print "haha I forgot to laugh"'};
	nodes[10] = {'type':'io','text':'show p'};
	// nodes[11] = {'type':'step','text':'Sum=0'};
	// nodes[12] = {'type':'step','text':'Sum=0'};
	// nodes[13] = {'type':'step','text':'Sum=0'};
	// nodes[14] = {'type':'step','text':'Sum=0'};
	// nodes[15] = {'type':'step','text':'Sum=0'};
	// nodes[16] = {'type':'step','text':'Sum=0'};
	// nodes[17] = {'type':'step','text':'Sum=0'};
	// nodes[18] = {'type':'step','text':'Sum=0'};
	// nodes[19] = {'type':'step','text':'Sum=0'};
	// nodes[20] = {'type':'step','text':'Sum=0'};
	// nodes[21] = {'type':'step','text':'Sum=0'};
	// nodes[22] = {'type':'step','text':'Sum=0'};

	for(var i=0; i<nodes.length; i++) {
		if(nodes[i].type == 'io') {
			io_process(nodes[i].text);
		}
		else if(nodes[i].type == 'step') {
			step_process(nodes[i].text);
		}


		output(nodes[i].type + ': ' + nodes[i].text);
	}
});

// ============================ IO Functions ========================

function io_process(text) {
	text = sanitize(text);
	var splitIdx = text.indexOf(' ');
	var iotemp = [];
	iotemp[0] = text.substr(0, splitIdx);
	iotemp[1] = sanitize(text.substr(splitIdx+1));


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
	if(validate_identifier(str)){
		// Valid variable
		// Create the variable if doesn't exist, then Input the value of the variable
		v[str] = 5;
	}
	else {
		// Invalid variable && Invalid Quoted String
		// Invalid IO Statement
	}
}

// ======================== Step Functions =====================

function step_process(step_text, level=0) {
	if(level=0) step_text = replace_all(step_text, ' ', '');
	step_parts = step_text.split('=');
	if(step_parts.length < 2) {
		if(level == 0) {
			// Invalid step, no assignment operator found
			// Throw exception

		}
		else {
			// Possibly expression
			return expression_process(step_text);
		}
	}
	else {
		if(validate_identifier(step_parts[0])) {
			var step_temp = step_process(step_parts[1], level+1);
			if(step_temp != false) {
				v[step_parts[0]] = step_temp;
				// Process animation for showing this new/old variable
				return v[step_parts[0]];
			}
			else return false;
		}
		else {
			return false;
		}
	}
}

// a = b = c = x + y + z

// x + y + z

function expression_process(exp) {
	// x+y+z
	// ((x+y)*(a-b))/2
	// p
	// 5



}

function parse_expression(exp_str) {
	var exp = exp_str; // taking backup
	exp = replace_all(exp, "(", " ");
	exp = replace_all(exp, ")", " ");
	exp = replace_all(exp, "+", " ");
	exp = replace_all(exp, "-", " ");
	exp = replace_all(exp, "*", " ");
	exp = replace_all(exp, "/", " ");

	exp = sanitize(exp);
	var vars = exp.split(' ');
	if(vars.length == 1) return process_var_const(exp); //single variable or constant
	else { // multiple variables and/or constants found

		console.log(exp_str);
		for(var i=0; i<vars.length; ++i) {
			var val_temp = process_var_const(vars[i]);
			if(val_temp == false) return false; // value not found
			// value found, replace this variable (if) name with this value in the expression
			if(val_temp == vars[i]) continue; // constant, no need to replace
			exp_str = replace_all(exp_str, vars[i], val_temp);
			console.log(exp_str);
		}
		var final_value = eval(exp_str);
		console.log(final_value);
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
