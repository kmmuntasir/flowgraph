<!DOCTYPE html>
<html>

<?php require_once('elements/head.php'); ?>

<body>
    <?php require_once('elements/nav.php'); ?>
    <div class="wrapper">
        <?php require_once('elements/sidebar.php'); ?>

        <!-- Page Content -->
        <div id="content">
        	<!-- Loader -->
        	<div id="overlay_loader">
        		<div id="loader_content">
	        		<span><i class="fas fa-spinner fa-spin"></i></span>
	        		<div class="clearfix"></div>
	        		<div class="text-center full_width loader_text alert bg-dark text-white"></div>
	        	</div>
        	</div> <!-- Loader end -->
            <?php require_once('pages/v_'.$page.'.php'); ?>
        </div>

    </div><!-- wrapper end -->

    
    <?php require_once('elements/scripts.php'); ?>

</body>

</html>