<?php
class M_student_api extends CI_model {
	
	function add_student($student) {
		$this->db->trans_start();
		$this->db->insert('student', $student);
		$this->db->trans_complete();
		//echo $this->db->last_query();
		// printing the last query we run
		return $this->db->trans_status();
	}

	function update_student($student, $student_id){
		$this->db->trans_start();
		$this->db->where('student_id', $student_id)->update('student', $student);
		$this->db->trans_complete();
		return $this->db->trans_status();
	}

	function delete_student($student_id){
		$this->db->trans_start();
		$this->db->where('student_id', $student_id)->update('student', array('student_status_id'=>3));
		$this->db->trans_complete();
		return $this->db->trans_status();
	}
}
?>