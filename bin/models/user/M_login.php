<?php

class M_login extends CI_model {

	public function login_check_user($user_email, $user_pass) {
		$this->db->where('is_deleted', 0);
		$this->db->where('user_email', $user_email);
		$this->db->where('user_pass', $user_pass);
		return $this->db->get('user')->row();
	}
}

?>