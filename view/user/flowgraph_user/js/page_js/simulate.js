var graph_data = '';
var dislocation_x = -25;
var dislocation_y = 0;
var key = 0;
var start = 0;
var error_data = "asdf";
var simulation_enabled = true;
var animate_condition_unique_flag = 0;
var animate_step_unique_flag = 0;

function put_var(var_name) {
	var var_box = '<div class="col-2 mb-2 pl-1 pr-1 var_box"><button class="btn btn-dark btn-block btn-sm var_name">'+var_name+'</button><button class="btn btn-success btn-block btn-sm mt-0 var_value" id="var_box_'+var_name+'">'+v[var_name]+'</button></div>';
	$('#vars').append(var_box);
}

function update_var(var_name) {
	var id = '#var_box_'+var_name;
	var delay = 200;

	setTimeout(function(){ 
        $(id).removeClass('btn-success').addClass('btn-warning');
        $(id).removeClass('text-white').addClass('text-dark');

        setTimeout(function(){ 
	        $(id).removeClass('btn-warning').addClass('btn-success');
        	$(id).removeClass('text-dark').addClass('text-white');

    		setTimeout(function(){ 
    	        $(id).removeClass('btn-success').addClass('btn-warning');
    	        $(id).removeClass('text-white').addClass('text-dark');

    	        setTimeout(function(){ 
    		        $(id).removeClass('btn-warning').addClass('btn-success');
    	        	$(id).removeClass('text-dark').addClass('text-white');

	        		setTimeout(function(){ 
	        	        $(id).removeClass('btn-success').addClass('btn-warning');
	        	        $(id).removeClass('text-white').addClass('text-dark');

	        	        setTimeout(function(){ 
	        		        $(id).removeClass('btn-warning').addClass('btn-success');
	        	        	$(id).removeClass('text-dark').addClass('text-white');

    	        			$(id).html(v[var_name]);

	        	        }, delay);
	        	    }, delay);

    	        }, delay);
    	    }, delay);

        }, delay);
    }, delay);

	
}

function put_output(str) {
	var total = $('#outputs').attr('total');
	++total;
	$('#outputs').attr('total', total);
	var id = 'output_'+total;
	var delay = 200;

	// var output_alert = '<div class="alert alert-dark alert-sm pt-1 pb-1 pl-2 pr-2 mb-1">'+total+'. '+str+'</div>';
	var output_alert = '<div id="'+id+'" class="alert alert-dark alert-sm pt-1 pb-1 pl-2 pr-2 mb-1">'+str+'</div>';
	$('#outputs').append(output_alert);
	id = '#'+id;

	setTimeout(function(){ 
        $(id).addClass('bg-warning');
        setTimeout(function(){ 
	        $(id).removeClass('bg-warning');
        	setTimeout(function(){ 
                $(id).addClass('bg-warning');
                setTimeout(function(){ 
        	        $(id).removeClass('bg-warning');
    	        	setTimeout(function(){ 
    	                $(id).addClass('bg-warning');
    	                setTimeout(function(){ 
    	        	        $(id).removeClass('bg-warning');
    	                }, delay);
    	            }, delay);
                }, delay);
            }, delay);
        }, delay);
    }, delay);
}

function animate_condition(cur_key, exp_result) {
	var temp = 0;
	do {
		temp = Math.floor((Math.random() * 100000) + 1);
	} while(temp == animate_condition_unique_flag);
	animate_condition_unique_flag = temp;
	$('#condition_animator').remove();
	var icon = (exp_result[1]) ? 'check' : 'ban';
	var alert_class = (exp_result[1]) ? 'success' : 'danger';
	var condition_animation_box = '<div id="condition_animator" class="alert alert-'+alert_class+'" style="margin-top: '+(graph_data[cur_key].x - 20)+'px; margin-left: '+(graph_data[cur_key].y + 60)+'px; display:none;">('+exp_result[0]+') <i class="fas fa-'+icon+'"></i></div>';
	$('#pixel_container').append(condition_animation_box);
	$('#condition_animator').fadeIn(300);
	
	setTimeout(function(){
        if(animate_condition_unique_flag == temp) $('#condition_animator').fadeOut(1000, function() {$(this).remove();});
    }, 5000);
}


function animate_step(cur_key, exp_str) {
	var temp = 0;
	do {
		temp = Math.floor((Math.random() * 100000) + 1);
	} while(temp == animate_step_unique_flag);
	animate_step_unique_flag = temp;
	$('#step_animator').remove();
	var step_animation_box = '<div id="step_animator" class="alert alert-primary" style="margin-top: '+(graph_data[cur_key].x - 20)+'px; margin-left: '+(graph_data[cur_key].y + 60)+'px; display:none;">'+exp_str+'</div>';
	$('#pixel_container').append(step_animation_box);
	$('#step_animator').fadeIn(300);
	
	setTimeout(function(){
        if(animate_step_unique_flag == temp) $('#step_animator').fadeOut(1000, function() {$(this).remove();});
    }, 5000);
}

function test() {
	v['munna'] = 10;
	put_var('munna');
	put_output(v['munna']);
}

$(document).ready(function() {
	// Processing Graph Image
	var img_width = $('#graph_img_background').width();
	var percentage = 65.488;
	// percentage = 64.7;
	img_width = img_width * (percentage/100);
	$('#graph_img_background').css('width', img_width);


	graph_data = $('#graph_data').html();
	graph_data = $.parseJSON(graph_data);
	// console.log(graph_data);




	start = $('#start_node').val();
	key = start;
	if(key == 'error') {
		alert("Start Node not found");
		simulation_enabled = false;
	}
	else {
		// Start Node Found

		// dislocation_x = dislocation_y = 0;

		var pixel = '<div id="pointer" class="pixel" style="margin-top: '+ (graph_data[key].x + dislocation_x) +'px; margin-left: '+ (graph_data[key].y + dislocation_y) +'px;"><i class="fas fa-location-arrow"></i></div>';
		$('#pixel_container').append(pixel);

		// Error Checking
		error_data = $('#error_data').html();
		error_data = $.parseJSON(error_data);
		if(error_data.length != 0) {
			// Process Errors
			console.log(error_data);
			simulation_enabled = false;
		}
	}

	if(simulate_js_present != undefined) simulate_js_present = true;
});

$(document).on('click', '#step_button', function() {
	if(!simulation_enabled) {
		alert("Simulation has stopped");
		return;
	}
	var next_key = 0;
	// console.log(graph_data[key].category + ' - ' + graph_data[key].text);
	if(graph_data[key].category == 'condition') {
		var ret_val = process_single_node(graph_data[key].category, graph_data[key].text);
		if(ret_val === false) {
			simulation_enabled = false;
			alert("Variable not found. Simulation has stopped");
		}
		else {
			animate_condition(key, ret_val);
			next_key = (ret_val[1]) ? graph_data[key].true : graph_data[key].false;
		}
	}
	else {
		if(graph_data[key].category == 'end') {
			simulation_enabled = false;
			alert("Simulation has stopped");
		}
		else if(graph_data[key].category == 'io' || graph_data[key].category == 'step') {
			var ret_val = process_single_node(graph_data[key].category, graph_data[key].text);

			if(ret_val != undefined) {
				// console.log(ret_val);
				animate_step(key, ret_val);
			}
		}
		next_key = graph_data[key].next;
	}
	if(!simulation_enabled) return;
	// console.log(next_key);
	var next_m_top = graph_data[next_key].x + dislocation_x;
	var next_m_left = graph_data[next_key].y + dislocation_y;

	$('#pointer').css('margin-top', next_m_top);
	$('#pointer').css('margin-left', next_m_left);
	key = next_key;
});

$(document).on('click', '#reset_button', function() {
	if(error_data.length != 0) return;
	simulation_enabled = true;
	key = start;
	var next_m_top = graph_data[key].x + dislocation_x;
	var next_m_left = graph_data[key].y + dislocation_y;

	$('#pointer').css('margin-top', next_m_top);
	$('#pointer').css('margin-left', next_m_left);

	v = [];
	$('#vars').html('');
	$('#outputs').html('');
	$('#outputs').attr('total', 0);
});