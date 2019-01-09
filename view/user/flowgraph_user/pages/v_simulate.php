<div style="display: none;">
	<textarea class="form-control" id="graph_data"><?php echo json_encode($graph_data); ?></textarea>
	
	<?php if(isset($error)) { ?>
		<textarea id="error_data"><?php echo json_encode($error); ?></textarea>
	<?php } else {?>
		<input type="hidden" id="start_node" value='<?php echo $graph_start; ?>'>
	<?php } ?>
	<!-- <textarea class="form-control" id="graph_img"></textarea> -->
</div>

<div class="row">
<div id="simulator_container" class="col-12 pt-4 pb-3">
		<div id="pixel_container">

		</div>
		<img id="graph_img_background" src="<?php echo $graph_img ?>" alt="Graph Image">
</div>
<div class="clearfix"></div>
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
		transition: all 300ms ease;
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
