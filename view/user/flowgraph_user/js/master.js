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