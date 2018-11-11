<?php

class M_login extends CI_model {

	public function login_check_admin($username, $password) {
		$this->db->where('admin_user', $username);
		$this->db->where('admin_pass', $password);
		return $this->db->get('admin')->row();
	}
}

?>