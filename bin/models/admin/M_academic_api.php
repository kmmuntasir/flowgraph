<?php

	class M_academic_api extends CI_model {
		function add_faculty($faculty){
			$this->db->trans_start();
			$this->db->insert('faculty', $faculty);
			$this->db->trans_complete();
			//echo $this->db->last_query();
			// printing the last query we run
			return $this->db->trans_status();
		}

		function update_faculty($faculty, $faculty_id){
			$this->db->trans_start();
			$this->db->where('faculty_id', $faculty_id)->update('faculty', $faculty);
			$this->db->trans_complete();
			return $this->db->trans_status();
		}

		function delete_faculty($faculty_id){
			$this->db->trans_start();
			$this->db->where('faculty_id', $faculty_id)->update('faculty', array('is_deleted'=>1));
			$this->db->trans_complete();
			return $this->db->trans_status();
		}

		function get_all_faculty(){
			return $this->db->where('is_deleted', 0)->get('faculty')->result();
			// for one
			//$result = $result->row();
		}

		function get_all_dept($faculty_id) {
			return $this->db->where('faculty_id', $faculty_id)->where('is_deleted', 0)->get('dept')->result();
		}
	}
?>