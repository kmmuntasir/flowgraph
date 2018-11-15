<!DOCTYPE html>
<html>

<?php require_once('elements/head.php'); ?>

<body>

<?php require_once('elements/nav.php'); ?>

<?php

	if(isset($graph)) {
		if(isset($graph_id)) $fetch_graph_url = site_url($module.'/home/fetch_graph_json/'.$graph_id);
		else $fetch_graph_url = site_url($module.'/home/fetch_graph_json/');

		echo '<input type="hidden" id="fetch_graph_url" value="'.$fetch_graph_url.'">';
	}

	if(isset($this->session->user_id)) {
		echo '<input type="hidden" id="user_id" value="'.$this->session->user_id.'">';
		if($page == 'viewgraph')
			echo '<input type="hidden" id="graph_user_id" value="'.$single_graph->user_id.'">';
	}

?>



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