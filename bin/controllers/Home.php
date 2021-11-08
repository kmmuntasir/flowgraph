<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends User_Controller {
	
	function __construct() {
	    parent::__construct(true);

	    $this->data['page_title'] = '';
	    $this->data['controller'] .= $this->router->fetch_class();
	}

	function index() {

		redirect($this->data['controller']);
	}

	function default_graph_json($return=false) {
		$json_string = '{
           "class":"go.GraphLinksModel",
           "linkFromPortIdProperty":"fromPort",
           "linkToPortIdProperty":"toPort",
           "nodeDataArray":[],
           "linkDataArray":[]
        }';
		if ($return) return $json_string;
		else echo $json_string;
	}
	function fetch_graph_json($graph_id=NULL) {
		if(!$graph_id) echo $this->default_graph_json(true);
		else {
			$json = $this->m_home->fetch_graph_json($graph_id);
			if($json) $this->printer($json->graph_json);
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
