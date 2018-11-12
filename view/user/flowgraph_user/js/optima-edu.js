$(document).ready(function () {
    
    /* Disabling Right Click on whole document *
    $(document).on('contextmenu', function() {
        event.preventDefault();
    }); /* ============ */

    // ============= Sidebar Controlling Functions ============= //
    $("#sidebar").mCustomScrollbar({
        theme: "minimal"
    });

    $('.overlay').on('click', function () {
        // hide sidebar
        $('#sidebar').removeClass('active');
        // hide overlay
        $('.overlay').removeClass('active');
    });

    $('#sidebarCollapse').on('click', function () {
        // open sidebar
        $('#sidebar').toggleClass('active');
        // hide overlay

        // fade in the overlay
        $('.overlay').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
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