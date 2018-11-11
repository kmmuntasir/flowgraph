<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Teacher_api extends Admin_Controller {

	function __construct() {
	    parent::__construct();
	    // Loading Models
	    // $this->load->model($this->module."/m_admin");
	    //$this->load->model($this->module."/m_teacher");
	    $this->data['page_title'] = '';
	    $this->data['controller'] .= $this->router->fetch_class();

	}
	
	public function add() {
		if (isset($_POST['teacher_pass_1']) && !empty($_POST['teacher_pass_1']) && isset($_POST['teacher_pass_2']) && !empty($_POST['teacher_pass_2'])) {
			if ($_POST['teacher_pass_1'] != $_POST['teacher_pass_2'] ) exit("Password Does not match.");
			else{
				if ($_POST['teacher_pass_1']=="") exit("Password cannot empty.");
				else{
					$_POST['teacher_pass'] = $_POST['teacher_pass_1'];
					unset($_POST['teacher_pass_1']);
					unset($_POST['teacher_pass_2']);
				}
			}
		}
		
		$_POST['teacher_add_date'] = $this->now();
		$_POST['teacher_added_by'] = $this->session->admin_id;
		//add_Teacher($_POST);
		if (isset($_POST['teacher_user']) && isset($_POST['teacher_pass']) && isset($_POST['teacher_name']) && isset($_POST['tdesignation_id']) && isset($_POST['teacher_address']) && isset($_POST['teacher_dob']) && isset($_POST['teacher_added_by']) && isset($_POST['teacher_add_date']) && isset($_POST['teacher_join_date'])) {
			if ($this->m_teacher_api->add_Teacher($_POST)) echo "success";
			else echo "failed";
		} else echo "Required field can't be empty!";
		//$this->printer($_POST);
	}
	public function update() {
		if (!empty($_POST['teacher_id'])) {
			if ($_POST['teacher_pass_1'] != $_POST['teacher_pass_2'] ) exit("Password Does not match.");
			if ($_POST['teacher_pass_1']=="") exit("Password cannot empty.");
			$_POST['teacher_pass'] = $_POST['teacher_pass_1'];
			unset($_POST['teacher_pass_1']);
			unset($_POST['teacher_pass_2']);
			if ($this->m_teacher_api->update_Teacher($_POST,$_POST['teacher_id'])) echo "success";
			else echo "Failed to UPDATE teacher profile";
		} else echo "Teacher ID required!";		

		//$this->printer($_POST);
		
	}
	public function delete() {
		if (isset($_POST['teacher_id'])) {
			if ($this->m_teacher_api->delete_Teacher($_POST['teacher_id'])) echo "Success";
			else echo "failed";
		} else echo "Teacher ID required to delete!";
	}
}
