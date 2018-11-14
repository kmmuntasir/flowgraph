<div class="row">
<div class="col-12 pt-4 pb-3">
	<h1 class="text-center">Welcome to FlowGraph</h1>
	<h3 class="text-center">A simple but awesome tool for validating and explaining simple flowcharts.</h3>
	<h4 class="text-center">
		Drag-n-Drop, Connect and Simulate
	</h4>
</div>
<div class="col-12">
	<?php require_once('gojs.php'); ?>
</div>
</div> <!-- Row end -->


<!-- Modal -->
<div class="modal fade" id="graph_save_modal" tabindex="-1" role="dialog" aria-labelledby="graph_save_modal_label" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<form id="graph_save_form" action="<?php echo site_url($module.'/home/save_graph'); ?>">
			<div class="modal-header">
				<h5 class="modal-title" id="graph_save_modal_label">Give it a nice name</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<label>Graph Name</label>
				<input autofocus class="form-control" type="text" name="graph_name" required placeholder="This field is required">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>
		</form>
		</div>
	</div>
</div>


