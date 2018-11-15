<?php

class M_home extends CI_model {
	function fetch_graph_json($graph_id) {
		return $this->db->select('graph_json')->where('graph_id', $graph_id)->get('graph')->row();
	}

	function fetch_single_graph($graph_id) {
		$this->db->join('user', 'user.user_id = graph.user_id');
		return $this->db->where('graph_id', $graph_id)->get('graph')->row();
	}

	function fetch_single_graph_info($graph_id) {
		$select = "graph_id, graph_name, graph_thumb, graph_datetime, graph.user_id, user_name, user_email";
		$this->db->join('user', 'user.user_id = graph.user_id');
		return $this->db->select($select)->where('graph_id', $graph_id)->get('graph')->row();
	}

	function fetch_all_graphs() {
		$select = "graph_id, graph_name, graph_thumb, graph_datetime, user.user_id, user_name";
		$this->db->join('user', 'user.user_id = graph.user_id');
		return $this->db->select($select)->where('graph.is_deleted', 0)->get('graph')->result();
	}

	function fetch_my_graphs($user_id) {
		$select = "graph_id, graph_name, graph_thumb, graph_datetime";
		$this->db->where('user_id', $user_id);
		return $this->db->select($select)->where('is_deleted', 0)->get('graph')->result();
	}

	function fetch_graph_thumb($graph_id) {
		return $this->db->select('graph_thumb')->where('graph_id', $graph_id)->get('graph')->row();
	}

	function save_graph($graph) {
		$this->db->trans_start();
		$this->db->insert('graph', $graph);
		$this->db->trans_complete();
		return $this->db->trans_status();
	}

	function update_graph($graph, $graph_id) {
		$this->db->trans_start();
		$this->db->where('graph_id', $graph_id)->update('graph', $graph);
		$this->db->trans_complete();
		return $this->db->trans_status();
	}

	function delete_graph($graph_id) {
		$this->db->trans_start();
		// $this->db->where('graph_id', $graph_id)->delete('graph');
		$this->db->where('graph_id', $graph_id)->update('graph', array('is_deleted'=>1));
		$this->db->trans_complete();
		return $this->db->trans_status();
	}
}

?>