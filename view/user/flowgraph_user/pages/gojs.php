<div id="go_container">
	<div id="graph_container">
		<div id="curtain_1"><p>Item Palette</p></div>
		<div id="myPaletteDiv"></div>
		<div id="curtain_2"><p>Loading Graph ...</p></div>
		<div id="myDiagramDiv"></div>
	</div>
	
	<div id="model_container"> <!-- style="display: none;"> -->
		<div class="graph_buttons_container mt-3">
			<button class="go_simulate_btn btn btn-success btn-lg">
				<i class="fas fa-play"></i>
				Simulate
			</button>
			<?php if(isset($this->session->user_id)) { ?>
			<button id="SaveButton" class="go_save_btn btn btn-primary btn-lg">
				<i class="fas fa-save"></i>
				Save
			</button>
			<?php } ?>
			<button class="go_print_btn btn btn-info btn-lg">
				<i class="fas fa-print"></i>
				Print
			</button>
			<a id="go_img_btn" download="graph.jpeg" href="#" class="btn btn-warning btn-lg">
				<i id="image_icon" class="fas fa-image"></i>
				<span id="image_text">Download as Image</span>
			</a>
		</div>

		<div style="display: none;">
			<!-- <button id="SaveButton">Save</button> -->
			<button id="LoadButton">Load</button>

			<textarea id="mySavedModel"><?php echo $graph_json; ?></textarea>
		</div>
	</div>
	<div class="clearfix"></div>
</div>