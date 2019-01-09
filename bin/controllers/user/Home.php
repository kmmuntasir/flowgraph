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
		$data['page_title'] = 'Welcome to Flowgraph';
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
		$this->__security($this->module);
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

		if(!isset($_POST['graph_thumb']) || !isset($_POST['graph_name']) || !isset($_POST['graph_json'])) exit('Invalid Data Provided');
		
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

	function update_graph($graph_id=NULL) {
		if(!$this->__is_logged_in($this->module)) exit('You have to be logged in to update graph');
		if(!$graph_id) exit('No Graph ID Found');
		$graph = $this->m_home->fetch_single_graph_info($graph_id);
		if(!$graph) exit('Invalid Graph ID');
		if($graph->user_id != $this->session->user_id) exit('This is not your graph');
		if(!isset($_POST['graph_thumb']) || !isset($_POST['graph_name']) || !isset($_POST['graph_json'])) exit('Invalid Data Provided');
		$_POST['graph_thumb'] = $this->store_image($_POST['graph_thumb'], 'jpeg');
		// $this->printer($_POST, true);

		$status = $this->m_home->update_graph($_POST, $graph_id);
		if($status) {
			unlink($this->thumb_dir.$graph->graph_thumb);
			echo 'success';
		}
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

	function analyze_graph($graph_id=NULL, $ret=false) {
		if(!$graph_id) exit("No ID Found");
		else {
			$json = $this->m_home->fetch_graph_json($graph_id);
			if($json) {
				$graph = json_decode($json->graph_json);
				if($ret) return $graph;
				$this->printer($graph);
			}
			else echo "Invalid Graph ID";

		}
	}

	function purify_graph($graph=NULL) {
		if(!$graph) exit("No Data Found");
		$graph = json_decode($graph);

    	unset($graph->class);
    	unset($graph->linkFromPortIdProperty);
    	unset($graph->linkToPortIdProperty);

    	$errors = array();
    	$matrix = array();
    	$nodes = array();

    	foreach ($graph->linkDataArray as $key => $link) {
    		unset($link->fromPort);
    		unset($link->toPort);
    		unset($link->points);
    		unset($link->visible);

    		// echo $link->from.' -> '.$link->to .'<br>';

    		if(!isset($matrix[$link->from])) $matrix[$link->from] = array();
    		array_push($matrix[$link->from], $link->to);
    	}


    	foreach ($graph->nodeDataArray as $key => $node) {
    		$idx = $node->key;
    		$nodes[$idx] = $node;
    		unset($nodes[$idx]->key);
    		$nodes[$idx]->edges = (isset($matrix[$idx])) ? $matrix[$idx] : NULL;

    	}

    	foreach ($graph->linkDataArray as $key => $link) {
    		$idx = $link->from;
    		if($nodes[$idx]->category == 'condition') {
    			if(count($nodes[$idx]->edges) != 2) {
    				$errors = $this->err($errors, "condition_target_number_error", $idx);
    			}
    			else {
	    			if(!isset($link->text)) $nodes[$idx]->true = $link->to;
	    			else {
	    				$link->text = strtolower($link->text);
	    				if($link->text == 'yes') $nodes[$idx]->true = $link->to;
	    				else if($link->text == 'no') $nodes[$idx]->false = $link->to;
	    				else $errors = $this->err($errors, "condition_link_text_error", $idx);
	    			}
	    		}

    		}
    		else {
    			if(count($nodes[$idx]->edges) > 1) $errors = $this->err($errors, "node_target_number_error", $idx);
    			else $nodes[$idx]->next = $link->to;
    		}
    	}

    	$min_x = 1000000;
    	$min_y = 1000000;

    	$start_count = 0;
    	// $max_x = -1000000;
    	// $max_y = -1000000;
    	foreach ($nodes as $key => $node) {
    		$axes = explode(" ", $node->loc);
    		$node->x = $axes[1] * 1;
    		$node->y = $axes[0] * 1;

    		if($min_x > $node->x) $min_x = $node->x;
    		if($min_y > $node->y) $min_y = $node->y;
    		// if($max_x < $node->x) $max_x = $node->x;
    		// if($max_y < $node->y) $max_y = $node->y;


    		unset($node->loc);
    		unset($node->edges);
    		if($node->category == 'condition' && (!isset($node->true) || !isset($node->false)))
    			$errors = $this->err($errors, "condition_target_type_error", $key);
    	}


    	foreach ($nodes as $key => $node) {
    		$node->x -= $min_x;
    		$node->y -= $min_y;


    		if($node->category == 'start') {
    			if($start_count == 0) $nodes['start'] = $key;
    			else $errors = $this->err($errors, "multiple_start_count_problem", $key);
    			$start_count++;
    		}
    	}

    	// echo $min_x.' '.$min_y.'<br>';
    	// echo $max_x.' '.$max_y.'<br>';
    	
    	// $graph->matrix = $matrix;
    	// $graph->nodes = $nodes;

    	// $this->printer($errors, true);

		return array('errors' => $errors, 'nodes' => $nodes);
	}

	function err($errors, $error_type, $node) {
		if(!isset($errors[$node])) $errors[$node] = array();
		if(!isset($errors[$node][$error_type])) $errors[$node][$error_type] = 0;
		$errors[$node][$error_type]++;
		return $errors;
	}

	function simulate() {
		$data = $this->data;
		$data['page'] = $this->router->fetch_method();
		$data['page_title'] = ucfirst($this->router->fetch_method());

		$data['pure_graph'] = $this->purify_graph($_POST['graph_data']);
		$data['error_data'] = $data['pure_graph']['errors'];
		$data['graph_data'] = $data['pure_graph']['nodes'];
		
		if(isset($data['graph_data']['start'])) {
			$data['graph_start'] = $data['graph_data']['start'];
			unset($data['graph_data']['start']);
		}
		else $data['graph_start'] = 'error';

		$data['graph_img'] = $_POST['graph_img'];


		unset($_POST['graph_data']);
		unset($_POST['graph_img']);
		unset($data['pure_graph']);

		// $this->printer($data['graph_data'], true);

		// $this->printer($data, true);
		$this->load->view($this->viewpath.'v_main', $data);
	}
}
