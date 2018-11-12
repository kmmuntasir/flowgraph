<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends User_Controller {
	
	function __construct() {
	    parent::__construct(true);
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

	function graph() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = ucfirst($this->router->fetch_method());
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function graph_json() {
		$json_string = '{"class": "go.GraphLinksModel","linkFromPortIdProperty": "fromPort","linkToPortIdProperty": "toPort","nodeDataArray": [],"linkDataArray": []}';
		echo $json_string;
	}
}
