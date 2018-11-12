<nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <div class="container-fluid">

        <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-justify"></i>
            <span>Toggle Sidebar</span>
        </button>

        <a class="navbar-brand" href="#">
            <img id="navbar_logo" class="omni_logo ml-3" src="<?php echo $fullpath; ?>img/logo.png" alt="School Logo">
            <span id="navbar_isp_name" class="">School<span>
        </a>

        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#main_nav_link" aria-controls="main_nav_link" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-arrow-down"></i>
        </button>

        <div class="collapse navbar-collapse" id="main_nav_link">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Reminder Dropdown</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Message Dropdown</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Mr. John
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<?php echo site_url($module.'/login/logout'); ?>">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>