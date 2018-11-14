<nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <div class="container-fluid">

        <a class="navbar-brand" href="<?php echo base_url(); ?>">
            <img id="navbar_logo" class="omni_logo ml-3" src="<?php echo base_url('img/logo.png'); ?>" alt="School Logo">
            <span id="brand_name" class="">FlowGraph<span>
        </a>

        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#main_nav_link" aria-controls="main_nav_link" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-arrow-down"></i>
        </button>

        <div class="collapse navbar-collapse" id="main_nav_link">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item">
                    <a class="<?php if($page == 'home') echo 'active '; ?>nav-link" href="<?php echo site_url($module."/home"); ?>">Create</a>
                </li>
                <li class="nav-item">
                    <a class="<?php if($page == 'browse') echo 'active '; ?>nav-link" href="<?php echo site_url($module."/home/browse"); ?>">Browse Flowcharts</a>
                </li>
                <?php if(isset($this->session->user_id)) { ?>
                <li class="nav-item">
                    <a class="<?php if($page == 'my_charts') echo 'active '; ?>nav-link" href="<?php echo site_url($module.'/home/my_charts'); ?>">My Charts</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php echo $this->session->user_name; ?>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="<?php echo site_url($module.'/profile'); ?>">Profile</a>
                        <a class="dropdown-item" href="<?php echo site_url($module.'/profile/change_pwd'); ?>">Change Password</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<?php echo site_url($module.'/login/logout'); ?>">Logout</a>
                    </div>
                </li>
                <?php } else { ?>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="loginDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Login
                    </a>
                    <div id="loginDropdownmenu" class="dropdown-menu" aria-labelledby="loginDropdown">
                        <form class="form-control" action="<?php echo site_url($module.'/login/login_process'); ?>" method="post">
                            <div class="form-group">
                                <label>Email Address</label>
                                <input type="text" name="user_email" placeholder="Your Email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="user_pass" placeholder="Password" class="form-control">
                            </div>
                            <div class="custom-control custom-checkbox">
                              <input type="checkbox" class="custom-control-input" id="remember_me_checkbox" name="remember">
                              <label class="custom-control-label pointer small pt-1" for="remember_me_checkbox">Remember Me</label>
                            </div>
                            <button type="submit" class="btn btn-primary float-right">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </button>
                            <div class=""></div>
                            <br><br><a class="float-right" href="#">New User? Register Here</a>
                        </form>
                    </div>
                </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</nav>