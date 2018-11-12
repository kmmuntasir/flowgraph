<?php

class M_home extends CI_model {
	function fetch_graph_json($graph_id) {
		return $this->db->select('graph_json')->where('graph_id', $graph_id)->get('graph')->row();
	}
}

?>