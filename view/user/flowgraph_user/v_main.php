<!DOCTYPE html>
<html>

<?php require_once('elements/head.php'); ?>

<body>

<?php require_once('elements/nav.php'); ?>

<?php

	if(isset($graph)) {
		if(isset($graph_id)) $fetch_graph_url = site_url('home/fetch_graph_json/'.$graph_id);
		else $fetch_graph_url = site_url('home/fetch_graph_json/');
	}

?>

<!-- <input type="hidden" id="blank_graph_url" value="<?php echo site_url('home/default_graph_json'); ?>"> -->
<input type="hidden" id="fetch_graph_url" value="<?php echo $fetch_graph_url; ?>">

<!-- Loader -->
<div id="overlay_loader">
    <div id="loader_content">
        <span><i class="fas fa-spinner fa-spin"></i></span>
        <div class="clearfix"></div>
        <div class="text-center full_width loader_text alert bg-dark text-white"></div>
    </div>
</div> <!-- Loader end -->

<div class="container-fluid">
<?php require_once('pages/v_'.$page.'.php'); ?>
</div><!-- container-fluid end -->


<?php require_once('elements/scripts.php'); ?>

</body>

</html>