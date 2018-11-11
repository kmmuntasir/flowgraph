<?php

class M_admin_api extends CI_model {
	function add_student($admin) {
		// for testing
		// it will always roll back
		$this->db->trans_start(true);
		// $this->db->trans_start();
		$this->db->insert('admin', $admin);
		// echo $this->db->last_query();
		$this->db->trans_complete();
		return $this->db->trans_status();
	}

	function update_admin($admin, $admin_id){
		$this->db->trans_start(true);
		$this->db->where('admin_id', $admin_id)->update('admin', $admin);
		$this->db->trans_complete();
		return $this->db->trans_status();
	}

	function delete_admin($admin_id){
		$this->db->trans_start(true);
		$this->db->where('admin_id', $admin_id)->update('admin', array('status_id'=>3));
		$this->db->trans_complete();
		return $this->db->trans_status();
	}

}

?>