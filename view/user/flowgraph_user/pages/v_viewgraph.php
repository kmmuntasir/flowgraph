<div class="row">
<div class="col-12 pt-4 pb-3">
	<h1 id="viewgraph_name" class="text-center"><?php echo $single_graph->graph_name; ?></h1>
</div>
<div class="col-12">
	<?php require_once('gojs.php'); ?>
</div>
</div> <!-- Row end -->

<?php
	$action = site_url($module.'/home/');
	if($single_graph->user_id == $this->session->user_id) $action .= 'update_graph/'.$graph_id;
	else $action .= 'save_graph';
?>

<!-- Modal -->
<div class="modal fade" id="graph_save_modal" tabindex="-1" role="dialog" aria-labelledby="graph_save_modal_label" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form id="graph_save_form" action="<?php echo $action; ?>">
			<div class="modal-header">
				<h5 class="modal-title" id="graph_save_modal_label">
					<?php
						if($single_graph->user_id == $this->session->user_id)
							echo 'Update Graph';
						else echo 'Give it a nice name';
					?>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<label>Graph Name</label>
				<input autofocus class="form-control" type="text" name="graph_name" required placeholder="*This field is required" value="<?php echo $single_graph->graph_name; ?>">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">
					<?php
						if($single_graph->user_id == $this->session->user_id)
							echo 'Update Graph';
						else echo 'Save';
					?>
				</button>
			</div>
		</form>
		</div>
	</div>
</div>

