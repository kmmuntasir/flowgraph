<div class="row">
<div class="col-12 pt-4 pb-3">
	<h1 class="text-center">Browse Our Flowchart Gallery</h1>
	<hr>
	<div class="row thumb_container">

		<?php
		foreach($all_graphs as $single_graph) {
		?>
		<div class="col-md-3 single_thumb" graph_id="<?php echo $single_graph->graph_id; ?>">
			<div class="card">
				<h5 class="card-header bg-primary text-white">
					<?php echo substr($single_graph->graph_name, 0, 25); 
					if(strlen($single_graph->graph_name) > 25) echo '...';
					?>
				</h5>
				<div class="card-body">
					<div class="thumb_img_container">
						<img class="thumb_img" src="<?php echo base_url($thumb_dir.$single_graph->graph_thumb); ?>">
					</div>
				</div>
			</div>
		</div><!-- single_thumb end -->
		<?php } ?>


	</div><!-- thumb_container end -->

</div>
</div> <!-- Row end -->



