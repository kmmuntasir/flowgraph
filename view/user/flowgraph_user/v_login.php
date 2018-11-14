<!DOCTYPE html>
<html>

<?php require_once('elements/head.php'); ?>

<body>
    
	<div class="loginformbox">

		<div class="text-center">
			<a href="<?php echo base_url(); ?>"><img class="mb-3" src="<?php echo base_url('img/logo.png'); ?>" alt="" width="72" height="72"></a>
			<h1 class="h3 mb-3">FlowGraph</h1>
			<h1 class="h5 mb-3 ">Login to Discover More</h1>
		</div>
		<form class="mb-5 ajax_form" data-func="login_form_action" action="<?php echo $login_process_url; ?>" method="post">
			<div class="input-group form-group">
				<div class="input-group-prepend">
				  <span class="input-group-text"><i class="fas fa-envelope"></i></span>
				</div>
				<input type="text" name="user_email" class="form-control" placeholder="Email Address">
			</div>

			<div class="input-group form-group">
				<div class="input-group-prepend">
				  <span class="input-group-text"><i class="fas fa-key"></i></span>
				</div>
				<input type="password" name="user_pass" class="form-control" placeholder="Password">
			</div>

			<div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" id="remember_me_checkbox" name="remember">
			  <label class="custom-control-label pointer small pt-1" for="remember_me_checkbox">Remember Me</label>
			</div>

			<button type="submit" class="btn btn-primary float-right mb-5">
				<i class="fas fa-sign-in-alt"></i> Login
			</button>
			<div class="clearfix"></div>
		</form>
		<small class="text-center">FlowGraph : Copyright &copy; <?php echo date('Y'); ?> by Farjana Boby</small>
	</div>

</body>

</html>