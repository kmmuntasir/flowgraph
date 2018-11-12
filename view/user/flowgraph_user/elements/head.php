<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title><?php echo $page_title; ?></title>
    <link rel="icon" href="<?php echo base_url('img'); ?>/favicon.png">

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="<?php echo $fullpath; ?>assets/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="<?php echo $fullpath; ?>css/style.css">
    <link rel="stylesheet" href="<?php echo $fullpath; ?>css/custom.css">
    <link rel="stylesheet" href="<?php echo $fullpath; ?>css/graph.css">
    <?php if($page == 'login') { ?>
    <link rel="stylesheet" href="<?php echo $fullpath; ?>css/login.css">
    <?php } ?>

    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="<?php echo $fullpath; ?>assets/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="<?php echo $fullpath; ?>assets/DataTables/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/css/buttons.dataTables.min.css"/> 
    <link rel="stylesheet" type="text/css" href="<?php echo $fullpath; ?>assets/DataTables/Buttons-1.5.1/css/buttons.bootstrap4.min.css"/>

    <!-- Font Awesome JS -->
    <script defer src="<?php echo $fullpath; ?>assets/fontawesome/free-5.4.2-web/js/solid.min.js"></script>
    <script defer src="<?php echo $fullpath; ?>assets/fontawesome/free-5.4.2-web/js/fontawesome.min.js"></script>
</head>