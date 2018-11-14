<div class="row">
<div class="col-12 pt-4 pb-3">
	<h1 class="text-center">My Charts</h1>
	<hr>
	<div class="row thumb_container">

		<?php
		foreach($all_graphs as $single_graph) {
		?>
		<div id="graph_<?php echo $single_graph->graph_id; ?>" class="col-md-3 single_thumb">
			<div class="card">
				<h5 class="card-header bg-primary text-white">
					<?php echo substr($single_graph->graph_name, 0, 25); 
					if(strlen($single_graph->graph_name) > 25) echo '...';
					?>
				</h5>
				<div class="card-body anchor" data-href="<?php echo site_url($module.'/home/viewgraph/'.$single_graph->graph_id); ?>" title="View/Edit This Graph">
					<div class="thumb_img_container">
						<img class="thumb_img" src="<?php echo base_url($thumb_dir.$single_graph->graph_thumb); ?>">
					</div>
				</div>
				<div class="card-footer">
					<i class="fas fa-clock"></i>
					<?php echo date('M d, Y, h:i a', strtotime($single_graph->graph_datetime)); ?>

					<a title="Delete this graph" class="btn btn-sm btn-secondary delete_graph text-white float-right" graph_id="<?php echo $single_graph->graph_id; ?>" href="<?php echo site_url($module.'/home/delete_graph'); ?>"><i class="fas fa-trash-alt"></i></a>
				</div>
			</div>
		</div><!-- single_thumb end -->
		<?php } ?>


	</div><!-- thumb_container end -->

</div>
</div> <!-- Row end -->



