var page = '';
var module = '';
var base_url = '';
var site_url = '';
var admin_type = '';
var check_for_new_messages_status = false;
// var global_form_event = 'click';
// var global_form_event_time = $.now();

$(document).ready(function() {
	// Collecting necessary data
	page = $('#page').val();
	module = $('#module').val();
	base_url = $('#base_url').val();
	admin_type = $('#admin_type').val();
	site_url = base_url + 'index.php';
	

	$('.datepicker').datepicker({
		dateFormat: 'MM d, yy',
		//dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true
	});

	$('.timepicker').timepicker({
		zindex: 11000,
		interval: 15,
		scrollbar: true
	});

	$('.monthpicker').datepicker({
		//dateFormat: 'MM d, yy',
		//dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: 'MM yy',
		beforeShow: function(input) {
			$(input).datepicker("widget").addClass('hide-calendar');
		},
		onClose: function(dateText, inst) {
			$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
			$(this).datepicker('widget').removeClass('hide-calendar');
		}
	});

	// Binding Left/Right Arrow Keys to Confirmation "Yes"/"No" Buttons

	$(document).keyup(function(event){
		var key = event.which;
	 	var confirmation_stat = $('#confirm_box_modal').css('display');
	 	if(confirmation_stat == 'block') {
			if(key == 39) $('#confirmation_no_button').focus();
			else if(key == 37) $('#confirmation_yes_button').focus();
	 	}
	});
	check_for_new_messages();
	setInterval(check_for_new_messages, 3000);

});

function check_for_new_messages() {
	if(check_for_new_messages_status) return;
	check_for_new_messages_status = true;
	var fetch_url = site_url + '/' + module + '/chat/get_unread_count';

    $.post(fetch_url, function(data) {
    	if(data == '0') $('#chat_notification').fadeOut(300);
    	else {
    		$('#chat_notification').html(data);
    		$('#chat_notification').fadeIn(300);
    	}
	});
	check_for_new_messages_status = false;
}

// Function for changing datepicker format to mysql format before submitting

$(document).on('submit', 'form', function() {
	$(this).find('.datepicker').each(function(){
		var d = $(this).val();
		//alert(d.indexOf('N'));
		if(d == '' || d.indexOf('NaN') != -1) {
			$(this).val('');
		}
		else {
			d = formatDate(d, 'yyyy-MM-dd');
			$(this).val(d);
		}
	});

	$(this).find('.monthpicker').each(function(){
		var d = $(this).val();
		if(d == '' || d.indexOf('NaN') != -1) {
			$(this).val('');
		}
		else {
			d = formatDate(d, 'yyyy-MM-01');
			$(this).val(d);
		}
	});

	$(this).find('.timepicker').each(function(){
		var d = $(this).val();
		if(d == '' || d.indexOf('NaN') != -1) {
			$(this).val('');
		}
		else {
			d = '2018-01-01 ' + d;
			d = formatDate(d, 'HH:mm:ss');
			$(this).val(d);
		}
	});
});

// Month Picker

$(document).on('change', '.ui-datepicker-month', function() {
	//alert("Hello");
});

// Functions for updating global_form_event when submitting a form (for confirmation modal)

// $(document).on('click', 'form button[type=submit]', function() {
// 	var diff = $.now() - global_form_event_time;
// 	diff /= 1000;
// 	if(diff > 2) {
// 		global_form_event = 'click';
// 		global_form_event_time = $.now();
// 	}
// });
// $(document).on('click', 'form input[type=submit]', function() {
// 	var diff = $.now() - global_form_event_time;
// 	diff /= 1000;
// 	if(diff > 2) {
// 		global_form_event = 'click';
// 		global_form_event_time = $.now();
// 	}
// });

// $("form").on('keypress', function(e) {
// 	if (e.which == 13)
// 	{
// 		global_form_event = 'keypress';
// 		global_form_event_time = $.now();
// 	}
// }); 

// Functions for showing/hiding loader

function show_loader(loader_msg=null) {
	if(loader_msg != null) {
		$('#overlay_loader .loader_text').html(loader_msg)
		$('#overlay_loader .loader_text').show();
	}
	$('#overlay_loader').modal({
		backdrop: false
	});
}

function hide_loader() {
	$('#overlay_loader').modal('hide');
	$('#overlay_loader .loader_text').hide();
}

// Function for showing user a notification for t seconds
function notify(msg_text, msg_class='info', t=5000, modal_size='sm') {
	$('#notification_message').remove();
	var notification = '<div class="modal fade" id="notification_message" tabindex="-1" aria-hidden="true"><div class="modal-dialog modal-'+modal_size+'" role="document"><div class="modal-content bg-' + msg_class +' text-white"><div class="modal-body"><b>'+msg_text+'</b><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div></div></div></div>';

		
	$('body').append(notification);
	$('#notification_message').modal({
    	backdrop: false
    });

	setTimeout(function(){ 
		$('#notification_message').fadeOut(3000, function() {
			$(this).remove();
		});
	}, t);
}


// Confirmation Mechanism
function confirmation(yes_fn='close_confirmation', yes_data='', text='Are you sure?', no_fn='close_confirmation', no_data='') {
	if(text == '') text='Are you sure?';
	var confirm_box_modal = '<div class="modal" id="confirm_box_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"><div class="modal-dialog modal-dialog-centered" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title">'+text+'</h5><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>';
	//confirm_box_modal += '<div class="modal-body"></div>';
	confirm_box_modal += '<div class="modal-footer">';

	if ($.type(yes_data) !== 'string') yes_data = JSON.stringify(yes_data);
	if ($.type(no_data) !== 'string') yes_data = JSON.stringify(no_data);
	// no_data = JSON.stringify(no_data);

	confirm_box_modal += '<button type="button" id="confirmation_yes_button" do="'+yes_fn+'" do_data=\''+yes_data+'\' class="confirmation_button btn btn-danger btn-sm">Yes</button>';
	confirm_box_modal += '<button type="button" id="confirmation_no_button" do="'+no_fn+'" do_data=\''+no_data+'\' class="confirmation_button btn bg-dark text-white btn-sm">No</button>';
	confirm_box_modal += '</div></div></div></div>';
	
	$('#confirm_box_modal').remove();
	$('body').append(confirm_box_modal);
	$('#confirm_box_modal').modal('show');
	$('#confirmation_no_button').focus();
}

function close_confirmation(data){
}

$(document).on('click', '.confirmation_button ', function() {
	var confirmation_fn = $(this).attr('do');
	var confirmation_data = $(this).attr('do_data');
	if(isJson(confirmation_data)) confirmation_data = $.parseJSON(confirmation_data);
	window[confirmation_fn](confirmation_data); // calling the function matching the function name with the page string.
	$('#confirm_box_modal').modal('hide').remove();
});

function isJson(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

function formatDate(date=null, format='MMM d, yyyy') {
	// Requires jquery-dateFormat Plugin
	// yy = short year
	// yyyy = long year
	// M = month (1-12)
	// MM = month (01-12)
	// MMM = month abbreviation (Jan, Feb ... Dec)
	// MMMM = long month (January, February ... December)
	// d = day (1 - 31)
	// dd = day (01 - 31)
	// ddd = day of the week in words (Monday, Tuesday ... Sunday)
	// E = short day of the week in words (Mon, Tue ... Sun)
	// D - Ordinal day (1st, 2nd, 3rd, 21st, 22nd, 23rd, 31st, 4th...)
	// h = hour in am/pm (0-12)
	// hh = hour in am/pm (00-12)
	// H = hour in day (0-23)
	// HH = hour in day (00-23)
	// mm = minute
	// ss = second
	// SSS = milliseconds
	// a = AM/PM marker
	// p = a.m./p.m. marker

	if(date != null) var d = new Date(date);
	else var d = new Date();
	return $.format.date(d, format)
}


function scroll(selector, direction='top', delay=500) {
	var position = (direction == 'top') ? 0 : $(selector)[0].scrollHeight;
	$(selector).animate({
	    scrollTop: position
	}, delay);
}

// ===================================== Common Functions =============================

// Function for focusing input field when modal is shown
$('.modal').on('shown.bs.modal', function (e) {
	$(this).find('.form_focus').focus();
})

// Function for resetting addform
$('#AddModal').on('shown.bs.modal', function (e) {
	$('#addform')[0].reset();
})

// Function for Adding
$(document).on('submit', '#addform', function() {
	confirmation('add_final', 1)
	event.preventDefault();
	return;
});

function add_final(arg) {
	show_loader();
    var datastring = $('#addform').serialize();
    var action = $('#addform').attr('action');
    var entity = $('#addform').attr('entity');
    if(entity == undefined) entity = page;
    $.post(action, datastring, function(data) {
    	//alert(data);
    	hide_loader();
    	if(data == 'success') {
    		notify('Added Successfully', 'success');
    		reload_dtable();
			$('#AddModal').modal('toggle');
    	}
    	else notify(data, 'danger');
    });
}


function tagger(obj) {
  return obj.prop("tagName").toLowerCase();
};

// Functions for showing Edit Form with existing data
$(document).on('click', '.edit', function() {
	show_loader();
    var id = $(this).attr('entity_id');
    var update_url = site_url+'/'+module+'/'+page+'/update/'+id;
    var fetch_url = site_url+'/'+module+'/'+page+'/single_'+page+'/'+id;
	$('#editform')[0].reset();
    $.post( fetch_url, function( data ) {
        var entity = $.parseJSON(data);

        // $.each(entity, function(key,val){
            
        // });

		$('#editform input, #editform select, #editform textarea').each(
		    function(index){  
		        var element = $(this);
		        var tag = tagger(element);
		        var type = element.attr('type');
		        var name = element.attr('name');
		        var value = element.val();
			    var possible_value = entity[name];

		        //alert('Tag: ' + t + ', Type: ' + element.attr('type') + ', Name: ' + element.attr('name') + ', Value: ' + element.val());

		        if(tag == 'input') {
		        	if(type == 'password') {
		        		// Do nothing
		        	}
		        	else if(type != 'radio' && type != 'checkbox') {
			        	element.val(possible_value);
			        }
			        else {
			        	element.removeAttr('checked');
			        	if(value == possible_value) element.attr('checked', 'checked');
			        }
		        }
		        else if(tag == 'select') {
		        	$(this).children('option').each(function() {

			        	if($(this).attr('value') == possible_value) {
			        		element.attr('selected', 'selected')
			        		element.val(possible_value);
			        	}
		        	});
		        }
		        else { // Textarea
		        	var possible_value = entity[name];
			        element.val(possible_value);
		        }
		    }
		);

		var post_process_fn = 'edit_form_'+page;
		window[post_process_fn](entity)

  		$('#editform').attr('action', update_url);
		hide_loader();
  		$('#editModal').modal('toggle');
		$('#editform .form_focus').focus();
    });
});


// Function for Updating
$(document).on('submit', '#editform', function() {
	confirmation('update_final', 1);
	event.preventDefault();
	return;
});

function update_final(arg) {
	show_loader();
    var datastring = $('#editform').serialize();
    var action = $('#editform').attr('action');
    var entity = $('#editform').attr('entity');
    if(entity == undefined) entity = page;
    $.post(action, datastring, function(data) {
    	hide_loader();
    	if(data == 'success') {
    		notify('Updated Successfully', 'success');
    		reload_dtable();
		    //$('#editform')[0].reset();
			$('#editModal').modal('toggle');
    	}
    	else notify(data, 'danger');
    });
}

// Functions for deleting
$(document).on('click', '.delete', function() {
    var id = $(this).attr('entity_id');
    var entity = $(this).attr('entity');
    if(entity == undefined) entity = page;
    confirmation('delete_final', id, 'You are going to delete this '+ entity + '. Are you sure?');
});

function delete_final(id) {
	show_loader();
	var url = site_url+'/'+module+'/'+page+'/delete/'+id;
	$.post( url, function( data ) {
		hide_loader();
	    if(data == 'success') {
	        notify('Deleted Successfully', 'success');
    		reload_dtable();
	    }
	    else notify(data, 'danger');
	});
}

$(document).on('click', '#test_button', function() {
    // $('#exampleModal').modal({
    // 	backdrop: false
    // });
    notify('Hello There Guys', 'primary');
});

