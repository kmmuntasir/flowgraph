<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Academic extends Admin_Controller {
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

	function faculty() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = ucfirst($this->router->fetch_method());
		$data['data_source'] = site_url($this->module.'/academic_api/all_faculty_with_dept');
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}
	
	function department() {

	}
	
	function classes() {
		echo 'hi';
	}
	
	function section() {

	}
	
	function exam() {

	}
	
	function result() {

	}
	
	function noticeboard() {

	}
}
?>