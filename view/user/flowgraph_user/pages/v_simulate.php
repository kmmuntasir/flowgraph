<div style="display: none;">
	<textarea class="form-control" id="graph_data"><?php echo json_encode($graph_data); ?></textarea>
	
		<textarea id="error_data"><?php echo json_encode($error_data); ?></textarea>

		<input type="hidden" id="start_node" value='<?php echo $graph_start; ?>'>

</div>

<div class="row">
<div id="simulator_container" class="col-12 pt-4 pb-3">
		<div id="pixel_container">

		</div>
		<img id="graph_img_background" src="<?php echo $graph_img ?>" alt="Graph Image">
</div>
<div class="clearfix"></div>
<button id="reset_button" class="btn btn-dark">Reset</button>
<button id="step_button" class="btn btn-primary">Next Step</button>
</div> <!-- Row end -->

<pre><?php print_r($graph_data); ?></pre>


<style type="text/css">
	#pixel_container {

	}
	#graph_img_background {
		display: block;
		/*border: solid 1px #000;*/
		box-shadow: 0px 0px 1px #000;
		z-index: 100;
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
