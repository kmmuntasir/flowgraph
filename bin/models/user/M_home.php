<?php

class M_home extends CI_model {
	function fetch_graph_json($graph_id) {
		return $this->db->select('graph_json')->where('graph_id', $graph_id)->get('graph')->row();
	}

	function fetch_all_graphs() {
		$select = "graph_id, graph_name, graph_thumb, graph_datetime";
		return $this->db->select($select)->where('is_deleted', 0)->get('graph')->result();
	}
}

?>