<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class Student_api extends Admin_Controller {
		function __construct() {
		    parent::__construct();
		    // Loading Models
		    // $this->load->model($this->module."/m_admin");
		    $this->load->model($this->module."/m_student_api");
		    $this->data['page_title'] = '';
		    $this->data['controller'] .= $this->router->fetch_class();
		}

		function add(){
			// student password
			if (isset($_POST['student_pass_1']) && isset($_POST['student_pass_2']) && !empty($_POST['student_pass_2'])  && !empty($_POST['student_pass_1']) ) {
				if ($_POST['student_pass_1']!=$_POST['student_pass_2']) exit("Passwords doesn't match!");
				else{
					//if($_POST['student_pass_1']=="") exit("Password can't be empty!");
					//else{
						$_POST['student_pass'] = md5($_POST['student_pass_1']);
						unset($_POST['student_pass_1']);
						unset($_POST['student_pass_2']);
					//}
				}
			} else exit("Student Password! required");
			// guardian password
			if (isset($_POST['student_pass_guardian_1']) && isset($_POST['student_pass_guardian_2']) && !empty($_POST['student_pass_guardian_1']) && !empty($_POST['student_pass_guardian_2'])) {
				if ($_POST['student_pass_guardian_1']!=$_POST['student_pass_guardian_2']) exit("Passwords doesn't match!");
				else{
					if($_POST['student_pass_guardian_1']=="") exit("Password can't be empty!");
					else{
						$_POST['student_pass_guardian'] = md5($_POST['student_pass_guardian_1']);
						unset($_POST['student_pass_guardian_1']);
						unset($_POST['student_pass_guardian_2']);
					}
				}
			} else exit("Guardian Password! required");
			// add date
			$_POST['student_add_date'] = $this->now();
			// added admin
			$_POST['student_added_by'] = $this->session->admin_id;
			// student photo
			//$student_photo = $this->file->student_photo;
			// for testing is it working or not?
			// $this->printer($_POST);
			if (isset($_POST['student_name']) && isset($_POST['student_user']) && isset($_POST['student_address']) && isset($_POST['student_dob']) && isset($_POST['student_status_id'])) {
				if ($status=$this->m_student_api->add_student($_POST)) echo 'success';
				else echo "Failed to ADD!";
			} else echo "Required field can't be empty!";
		}

		function update(){
			if (!empty($_POST['student_id'])) {
				if (isset($_POST['student_pass_1']) && isset($_POST['student_pass_2'])) {
					if ($_POST['student_pass_1']!=$_POST['student_pass_2']) exit("Passwords doesn't match!");
					if($_POST['student_pass_1']=="") exit("Password can't be empty!");
					$_POST['student_pass'] = md5($_POST['student_pass_1']);
					unset($_POST['student_pass_1']);
					unset($_POST['student_pass_2']);
				}
				if (isset($_POST['student_pass_guardian_1']) && isset($_POST['student_pass_guardian_2'])) {
					if ($_POST['student_pass_guardian_1']!=$_POST['student_pass_guardian_2']) exit("Passwords doesn't match!");
					if($_POST['student_pass_guardian_1']=="") exit("Password can't be empty!");
					$_POST['student_pass_guardian'] = md5($_POST['student_pass_guardian_1']);
					unset($_POST['student_pass_guardian_1']);
					unset($_POST['student_pass_guardian_2']);
				}				
				//$student_photo = $this->file->student_photo;
				// for testing is it working or not?
				// $this->printer($_POST);
				if ($status=$this->m_student_api->update_student($_POST, $_POST['student_id'])) echo 'success';
				else echo "Failed to UPDATE!";
			} else echo "No id found!";

		}

		function delete(){
			if (!empty($_POST['student_id'])) {
				if ($status=$this->m_student_api->delete_student($_POST['student_id'])) echo 'success';
				else echo "Failed!";
			} else echo "ID not found!";
		}
	}
?>