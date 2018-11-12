<div class="card">
	<div class="card-header">
		<?php echo $this->router->fetch_method(); ?>
		<div class="card-header-btn-bar">
			<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#add_modal">
				<i class="fas fa-plus"></i>
				<span>Add</span>
			</button>
			<div class="dropdown ml-2">
				<button class="btn btn-sm btn-dark dropdown-toggle" type="button" id="faculty_dropdown" data-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-cogs"></i>
					<?php if(false) { ?>
						<span class="badge badge-warning"><?php echo "2"; ?></span>
					<?php } ?>
				</button>
				<div class="dropdown-menu mobile_margin" aria-labelledby="faculty_dropdown">
					<button data-param="2" data-detail="Option" class="pointer dtable_param dropdown-item" href="#">
						<span class="dropdown-item-icon"><i class="fas fa-trash-alt"></i></span> Option 1
					</button>
					<button data-param="2" data-detail="Option" class="pointer dtable_param dropdown-item" href="#">
						<span class="dropdown-item-icon"><i class="fas fa-trash-alt"></i></span> Option 2
					</button>
					<button data-param="2" data-detail="Option" class="pointer dtable_param dropdown-item" href="#">
						<span class="dropdown-item-icon"><i class="fas fa-trash-alt"></i></span> Option 3
					</button>
					<button data-param="2" data-detail="Option" class="pointer dtable_param dropdown-item" href="#">
						<span class="dropdown-item-icon"><i class="fas fa-trash-alt"></i></span> Option 4
					</button>
				</div>
			</div>

		</div>
	</div>
	<div class="card-body">
		<div class="table-responsive">
		    <table data-sort-dir="asc" data-sort="1" data-page="<?php echo $page; ?>" data-source="<?php echo $data_source; ?>" class="table table-striped table-hover table-sm datatable">
		        <thead>
		            <tr>
		                <th class=>Faculty</th>
		                <th class=>Departments</th>
		                <th id="action_thead">Actions</th>
		            </tr>
		        </thead>
		        <tfoot>
		            <tr>
		                <td>Faculty</td>
		                <td>Departments</td>
		                <td id="action_tfoot">Actions</td>
		            </tr>
		        </tfoot>
		    </table>
		</div>
	</div>
</div>

<!------------------ Modal ----------------------->

<!-- Add Faculty Modal -->
<div id="add_modal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add New Faculty</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Submit</button>
			</div>
		</div>
	</div>
</div>