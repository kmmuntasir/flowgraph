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
		$data['graph'] = true;
		$data['graph_id'] = NULL;
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function viewgraph($graph_id=NULL) {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = ucfirst($this->router->fetch_method());
		$data['graph'] = true;
		$data['graph_id'] = $graph_id;
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function default_graph_json($return=false) {
		$json_string = '{"class": "go.GraphLinksModel","linkFromPortIdProperty": "fromPort","linkToPortIdProperty": "toPort","nodeDataArray": [],"linkDataArray": []}';
		if($return) return $json_string;
		else echo $json_string;
	}
	function fetch_graph_json($graph_id=NULL) {
		if(!$graph_id) echo $this->default_graph_json(true);
		else {
			$json = $this->m_home->fetch_graph_json($graph_id);
			if($json) echo $json->graph_json;
			else echo "Invalid Graph ID";
		}
	}

	function analyze_graph($graph_id=NULL) {
		if(!$graph_id) exit("No ID Found");
		else {
			$json = $this->m_home->fetch_graph_json($graph_id);
			if($json) {
				$graph = json_decode($json->graph_json);
				$this->printer($graph);
			}
			else echo "Invalid Graph ID";

		}
	}
}
