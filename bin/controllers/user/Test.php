<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends User_Controller {

	public $thumb_dir = "img/thumbs/";
	
	function __construct() {
	    parent::__construct(true);
	    // Loading Models
	    // $this->load->model($this->module."/m_admin");

	    $this->data['page_title'] = '';
	    $this->data['controller'] .= $this->router->fetch_class();
	}

	function index() {
		// $data = $this->data;
		// $data['page'] = $this->router->fetch_class();
		// $data['page_title'] = 'Welcome to Flowgraph';
		// $data['graph'] = true;
		// $data['graph_id'] = NULL;
		// $data['graph_json'] = $this->fetch_graph_json(NULL, true);
		// // $this->printer($data, true);
		// $this->load->view($this->viewpath.'v_main', $data);
	}

	function js_compiler() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = 'JS Compiler';
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}
}
