
<!-- jQuery -->
<script src="<?php echo $fullpath; ?>assets/jquery/3.3.1/jquery.min.js"></script>
<!-- Popper.JS -->
<script src="<?php echo $fullpath; ?>assets/popper/1.14.0/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="<?php echo $fullpath; ?>assets/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- jQuery Custom Scroller CDN --
<script src="<?php echo $fullpath; ?>assets/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script> -->


<!-- DataTables Js -->
<script src="<?php echo $fullpath; ?>assets/DataTables/datatables.min.js"></script>
<script src="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/js/dataTables.buttons.min.js"></script>
<!--<script src="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/js/buttons.flash.min.js"></script>-->
<script src="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/js/jszip.min.js"></script>
<script src="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/js/buttons.html5.min.js"></script>
<script src="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/js/buttons.print.min.js"></script>


<!-- jQuery-DateFormat JS -->
<script src="<?php echo $fullpath; ?>assets/jquery-dateFormat/jquery-dateformat.min.js"></script>

<!-- jQuery Datepicker JS -->
<script src="<?php echo $fullpath; ?>assets/jQuery-ui/jquery-ui.min.js"></script>

<!-- jQuery Timepicker JS -->
<script src="<?php echo $fullpath; ?>assets/jquery_timepicker/jquery.timepicker.min.js"></script>



<!-- custom js -->
<script src="<?php echo $fullpath; ?>js/master.js"></script>
<!-- <script src="<?php echo $fullpath; ?>js/master-datatables.js"></script> -->

<?php if(isset($graph)) { ?>
<!-- GO JS Scripts  -->
<script src="<?php echo $fullpath; ?>assets/gojs/go_debug.js"></script>
<!-- <script src="<?php echo $fullpath; ?>assets/gojs/go_init_draggable_link.js"></script> -->
<script src="<?php echo $fullpath; ?>assets/gojs/go_init_flowchart.js"></script>
<script src="<?php echo $fullpath; ?>js/gojs_script.js"></script>
<?php } ?>

<?php if($page == 'simulate' || $page == 'js_compiler') { ?>
	<script src="<?php echo $fullpath; ?>js/compiler.js"></script>
<?php } ?>

<!-- Page Depended JS -->
<script src="<?php echo $fullpath.'js/page_js/'.$page.'.js'; ?>"></script>	

