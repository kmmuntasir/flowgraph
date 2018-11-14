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
		$data = $this->data;
		$data['page'] = $this->router->fetch_class();
		$data['page_title'] = ucfirst($this->router->fetch_class());
		$data['graph'] = true;
		$data['graph_id'] = NULL;
		$data['graph_json'] = $this->fetch_graph_json(NULL, true);
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function browse() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = ucfirst($this->router->fetch_method());
		$data['thumb_dir'] = $this->thumb_dir;
		$data['all_graphs'] = $this->m_home->fetch_all_graphs();
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function my_charts() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = "My Charts";
		$data['thumb_dir'] = $this->thumb_dir;
		$data['all_graphs'] = $this->m_home->fetch_my_graphs($this->session->user_id);
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function viewgraph($graph_id=NULL) {
		if(!$graph_id) redirect(site_url());
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = ucfirst($this->router->fetch_method());
		$data['graph'] = true;
		$data['graph_id'] = $graph_id;
		$data['single_graph'] = $this->m_home->fetch_single_graph($graph_id);
		$data['graph_json'] = $data['single_graph']->graph_json;
		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}

	function save_graph() {
		if(!$this->__is_logged_in($this->module)) exit('You have to be logged in to save graph');
		$_POST['user_id'] = $this->session->user_id;
		$_POST['graph_datetime'] = $this->now();
		$_POST['graph_thumb'] = $this->store_image($_POST['graph_thumb'], 'jpeg');
		// $this->printer($_POST, true);

		$status = $this->m_home->save_graph($_POST);
		if($status) echo 'success';
		else {
			unlink($this->thumb_dir.$_POST['graph_thumb']);
			echo 'Something went wrong';
		}
	}

	function delete_graph() {
		if(!$this->__is_logged_in($this->module)) exit('You have to be logged in to delete graph');
		// $this->printer($_POST, true);
		if(!isset($_POST['graph_id'])) exit('No Graph ID Found');

		// $graph = $this->m_home->fetch_graph_thumb($_POST['graph_id']);
		// if(!$graph) exit('Invalid Graph ID');
		// $file_path = $this->thumb_dir.$graph->graph_thumb;

		$status = $this->m_home->delete_graph($_POST['graph_id']);
		if($status) echo 'success';
		else echo 'Invalid Graph ID';

	}

	function store_image($data, $type) {
		if (preg_match('/^data:image\/(\w+);base64,/', $data, $type)) {
		    $data = substr($data, strpos($data, ',') + 1);
		    $type = strtolower($type[1]); // jpg, png, gif

		    if (!in_array($type, [ 'jpg', 'jpeg', 'gif', 'png' ])) {
		        throw new \Exception('invalid image type');
		    }

		    $data = base64_decode($data);

		    if ($data === false) {
		        throw new \Exception('base64_decode failed');
		    }
		} else {
		    throw new \Exception('did not match data URI with image data');
		}

		$filename = '';
		do {
			// Generating a unique name using current microtime
			$filename = substr(md5(microtime(true)), 1, 10).'.'.$type;
			$file_path = $this->thumb_dir.$filename;
		} while(is_file($file_path));

		file_put_contents($file_path, $data);
		return $filename;
	}

	function default_graph_json($return=false) {
		$json_string = '{"class": "go.GraphLinksModel","linkFromPortIdProperty": "fromPort","linkToPortIdProperty": "toPort","nodeDataArray": [],"linkDataArray": []}';
		if($return) return $json_string;
		else echo $json_string;
	}
	function fetch_graph_json($graph_id=NULL, $return=false) {
		if(!$graph_id) {
			if($return) return $this->default_graph_json(true);
			else echo $this->default_graph_json(true);
		}
		$json = $this->m_home->fetch_graph_json($graph_id);
		if($json) {
			if($return) return $json->graph_json;
			else echo $json->graph_json;
		}
		else echo "Invalid Graph ID";
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
