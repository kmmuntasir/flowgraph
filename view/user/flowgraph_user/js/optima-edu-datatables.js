var table = '';
var loading_msg = "Loading Table Data...";

$(document).ready(function() {

	// DataTables Mechanisms
	
	dtable();

	function dtable() {
		if($('.datatable').length) show_loader(loading_msg);
		
	    // Enabling Individual Column Search
	    $('.datatable tfoot td').each( function () {
	        var title = $(this).text();
	        $(this).html( '<input type="text" placeholder="Search '+title+'" class="form-control datatable-tfoot-input">' );
	    });
	    
	    // Initializing DataTable
	    var data_source = $('.datatable').attr('data-source');
	    var data_page = $('.datatable').attr('data-page');
	    var data_sort = $('.datatable').attr('data-sort');
	    var data_sort_dir = $('.datatable').attr('data-sort-dir');
	    if(data_sort_dir == null) data_sort_dir = 'asc';
	    data_sort *= 1;
	    data_sort -= 1;
	    var buttons = ['csv','excel', 'print', 'refresh'];
	    table = $('.datatable').DataTable({
	        "ajax": data_source,
	        "deferRender": true,
	        "pageLength": 10,
	        "order": [[ data_sort, data_sort_dir ]],
	        dom: 'iplBfrt',
	        responsive: true,
	        buttons: buttons,
	        "initComplete": function() {dtable_post_init(data_page);},
            'drawCallback': function() {
	        	dtable_post_process(data_page);
	        	$('#action_tfoot').html('');
            }
	        
	    });
	    
	    // Apply the search
	    table.columns().every( function () {
	        var that = this;
	        $( 'input', this.footer() ).on('keyup change', function () {
	            if ( that.search() !== this.value ) {
	                that
	                    .search( this.value )
	                    .draw();
	            }
	        });
	    });
	}
});

function dtable_post_process(data_page) {
	// var fn_name = data_page+'_datatable';
	// window[fn_name](); // calling the function matching the function name with the page string.
}

function dtable_post_init(data_page) {
	hide_loader();
}

function reload_dtable(table_obj = table, table_page=page) {
	show_loader(loading_msg);
    table_obj.ajax.reload(function() {
    	hide_loader();
    	dtable_post_process(table_page);
    });
}


function reload_dtable_url(url, table_obj = table, table_page=page) {
	if(url == undefined || url == '') return;
	show_loader(loading_msg);
	table_obj.ajax.url( url ).load(function() {
    	hide_loader();
    	dtable_post_process(table_page);
    });
}

$(document).on('focus', '.datatable-tfoot-input', function() {
	$(this).select();
});

$.fn.dataTable.ext.buttons.refresh = {
    text: 'Refresh'
  , action: function ( e, dt, node, config ) {
      dt.clear().draw();
      show_loader(loading_msg);
      dt.ajax.reload(function(){
      	hide_loader();
      });
    }
};

$(document).on('click', '.dtable_param', function() {
	var data_param = $(this).attr('data-param');
	var data_detail = $(this).attr('data-detail');
    var dt_src = $('.datatable').attr('data-source');
    var sub_str = dt_src.substring(0, dt_src.lastIndexOf('/')+1);
    var new_url = sub_str + data_param;
    // alert(new_url);
    reload_dtable_url(new_url);
    if(data_detail != '') {
    	$('.page_subtitle').html(data_detail);
    }
});

$(document).on('click', '.dtable_url', function() {
	var new_url = $(this).attr('data-url');
	var data_detail = $(this).attr('data-detail');
    // alert(new_url);
    reload_dtable_url(new_url);
    if(data_detail != '') {
    	$('.page_subtitle').html(data_detail);
    }
});