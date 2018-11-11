<!-- Sidebar -->
<nav id="sidebar">
    <ul id="sidebar_main_links" class="list-unstyled components">
        <li>
            <a href="<?php echo site_url($module.'/dashboard'); ?>">
                <span class="sidebar-link-icon">
                    <i class="fas fa-tachometer-alt"></i>
                </span>
                Dashboard
            </a>
        </li>
        <?php foreach($accessible_modules as $key=>$single_module) { ?>
        <li>
            <a href="#<?php echo $single_module->module_name; ?>"  <?php if($single_module->children) echo 'data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"'; ?>>
                <span class="sidebar-link-icon">
                    <i class="fas fa-<?php echo $single_module->module_icon; ?>"></i>
                </span>
                <?php echo $single_module->module_name; ?>
            </a>
            <?php if($single_module->children) { ?>
            <ul class="collapse list-unstyled" id="<?php echo $single_module->module_name; ?>">
                <?php foreach($single_module->children as $k=>$child_module) { ?>
                <li>
                    <a href="<?php echo site_url($module.'/'.$child_module->module_controller); ?>">
                    <span class="sidebar-link-icon">
                        <i class="fas fa-<?php echo $child_module->module_icon; ?>"></i>
                    </span>
                        <?php echo $child_module->module_name; ?>
                    </a>
                </li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <?php } ?>

        <!-- <li class="active">
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Dropdown</a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="#">Home 1</a>
                </li>
                <li>
                    <a href="#">Home 2</a>
                </li>
                <li>
                    <a href="#">Home 3</a>
                </li>
            </ul>
        </li> -->
    </ul>

    <div class="list-unstyled" id="foot_icons">
        <a href="#">
            <i class="fas fa-comments"></i>
        </a>
        <a href="#">
            <i class="fas fa-calendar-alt"></i>
        </a>
        <a href="#">
            <i class="fas fa-power-off"></i>
        </a>
        <a href="#">
            <i class="fas fa-sign-out-alt"></i>
        </a>
    </div>
    <!-- temp="<?php echo site_url($module.'/'.$single_module->module_controller); ?>" -->
</nav>

<!-- Dark Overlay element -->
<div class="overlay"></div>