<?php

class M_admin extends CI_model {

	public function fetch_access($module_parent=NULL) {
		$this->db->select('module.module_id, module_name, module_controller, module_icon');
		$this->db->join('access', 'access.module_id = module.module_id');
		$this->db->join('admin', 'access.admin_id = admin.admin_id');
		$this->db->where('access.admin_id', $this->session->admin_id);
		$this->db->where('module_parent', $module_parent);
		$result = $this->db->get('module');
		return $result->result();
	}
}

?>