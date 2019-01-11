<div style="display: none;">
	<textarea class="form-control" id="graph_data"><?php echo json_encode($graph_data); ?></textarea>
	
	<textarea id="error_data"><?php echo json_encode($error_data); ?></textarea>

	<input type="hidden" id="start_node" value='<?php echo $graph_start; ?>'>

</div>

<div class="row">
	<div id="simulator_container" class="col-8 pt-4 pb-3">
		<div id="pixel_container">
			
		</div>
		<img id="graph_img_background" src="<?php echo $graph_img ?>" alt="Graph Image">
	</div>

	<div id="explanation_container" class="col-4 pb-3 pl-0 pr-0">
		<div id="variables_container" class="card">
			<div class="card-header bg-dark text-white">Variables</div>
			<div class="card-body">
				<div id="vars" class="row pl-2 pr-2">

					<!-- <div class="col-2 mb-2 pl-1 pr-1 var_box">
						<button class="btn btn-dark btn-block btn-sm var_name">Hello</button>
						<button class="btn btn-success btn-block btn-sm mt-0 var_value border-success">5</button>
					</div> -->

				</div>
			</div>
		</div>

		<div id="output_container" class="card mt-3">
			<div class="card-header bg-dark text-white">Output</div>
			<div id="outputs" class="card-body" total="0">

				
				<!-- <div class="alert alert-dark alert-sm pt-1 pb-1 pl-2 pr-2 mb-1">This is an output</div> -->

			</div>
		</div>
	</div>

	<div class="clearfix"></div>
	<button id="reset_button" class="btn btn-dark">Reset</button>
	<button id="step_button" class="btn btn-primary">Next Step</button>
</div> <!-- Row end -->

<pre><?php // print_r($graph_data); ?></pre>


<style type="text/css">
#pixel_container {

}
#graph_img_background {
	display: block;
	/*border: solid 1px #000;*/
	/*box-shadow: 0px 0px 1px #000;*/
	z-index: 100;
}

#condition_animator, #step_animator {
	z-index: 300;
	display: block;
	position: absolute;
	font-size: 25px;
	opacity: 0.95;
}

#pointer {
	transition: all 1000ms ease;
}


/* ==================== */
.pixel {
	z-index: 200;
	display: block;
	position: absolute;
	transform: rotate(90deg);
	color: #900;
	text-shadow: 1px 1px 2px #000;
	font-size: 25px;
}

.var_name, .var_value {
	font-weight: bold;
}

/* ==================== */

	/* ==================== *
	.pixel {
		z-index: 200;
		background-color: #09f;
		border: solid 1px #000;
		height: 10px;
		width: 10px;
		display: block;
		position: absolute;
	}

	.pixel > svg {
		display: none !important;
	}
	/* ==================== */

</style>
