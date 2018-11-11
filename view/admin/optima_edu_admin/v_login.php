<!DOCTYPE html>
<html>

<?php require_once('elements/head.php'); ?>

<body>
    
	<div class="loginformbox">

		<div class="text-center">
			<img class="mb-3" src="<?php echo base_url('img/logo.png'); ?>" alt="" width="72" height="72">
			<h1 class="h3 mb-3">ABC International Kindergarten School</h1>
			<h1 class="h5 mb-3 ">School Management System</h1>
		</div>
		<form class="mb-5 ajax_form" data-func="login_form_action" action="<?php echo $login_process_url; ?>" method="post">
			<div class="input-group form-group">
				<div class="input-group-prepend">
				  <span class="input-group-text"><i class="fas fa-user"></i></span>
				</div>
				<input type="text" name="username" class="form-control" placeholder="Username">
			</div>

			<div class="input-group form-group">
				<div class="input-group-prepend">
				  <span class="input-group-text"><i class="fas fa-key"></i></span>
				</div>
				<input type="password" name="password" class="form-control" placeholder="Password">
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
		<small class="text-center">Optima Edu : Copyright &copy; <?php echo date('Y'); ?> by Unifoxer Group</small>
	</div>

</body>

</html>