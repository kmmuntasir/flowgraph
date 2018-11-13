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
			<button class="go_save_btn btn btn-primary btn-lg">
				<i class="fas fa-save"></i>
				Save
			</button>
			<button class="go_print_btn btn btn-info btn-lg">
				<i class="fas fa-print"></i>
				Print
			</button>
			<button class="go_thumb_btn btn btn-warning btn-lg">
				<i class="fas fa-image"></i>
				Thumb
			</button>
		</div>

		<div style="display: block">
			<button id="SaveButton">Save</button>
			<button id="LoadButton">Load</button>

			<textarea id="mySavedModel">
				
			</textarea>
		</div>
	</div>
	<div class="clearfix"></div>
</div>