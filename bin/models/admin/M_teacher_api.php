<?php

class M_teacher_api extends CI_model {

	
	function add_Teacher($teacher)
	{
		$this->db->trans_start(true);
		$this->db->insert('teacher',$teacher);
		$this->db->trans_complete();
		return $this->db->trans_status();
	}
	function update_Teacher($teacher,$teacher_id)
	{
		$this->db->trans_start(true);
		$this->db->where('teacher_id',$teacher_id)->update('teacher',$teacher);
		$this->db->trans_complete();
		return $this->db->trans_status();
	}
	function delete_Teacher($teacher_id)
	{
		$this->db->trans_start(true);
		$this->db->where('teacher_id',$teacher_id)->update('teacher',array('status_id'=>3));
		$this->db->trans_complete();
		return $this->db->trans_status();
	}


}
