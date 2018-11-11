<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends Admin_Controller {
	function __construct() {
	    parent::__construct();
	    // Loading Models
	    // $this->load->model($this->module."/m_admin");

	    $this->data['page_title'] = '';
	    $this->data['controller'] .= $this->router->fetch_class();
	}
	
	function index() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_class();
		$data['page_title'] = ucfirst($this->router->fetch_class());
		$this->load->view($this->viewpath.'v_main', $data);
	}
}

?>
