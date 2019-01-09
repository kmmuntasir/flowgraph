$(document).ready(function () {
    
    /* Disabling Right Click on whole document *
    $(document).on('contextmenu', function() {
        event.preventDefault();
    }); /* ============ */

    // show_loader("Please wait. Content is loading....");

});

// Functions for showing/hiding loader

function show_loader(loader_msg=null) {
    if(loader_msg != null) {
        $('#overlay_loader .loader_text').html(loader_msg)
        $('#overlay_loader .loader_text').show();
    }
    $('#overlay_loader').show();
}

function hide_loader() {
    $('#overlay_loader').hide();
    $('#overlay_loader .loader_text').hide();
}

// function for anchoring 
$(document).on('click', '.anchor', function() {
    var href = $(this).attr('data-href');
    window.location.href = href;
});

// Notify Function 
function notify(msg_text, msg_class='primary', t=5000, modal_size='md') {
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

function isJson(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}