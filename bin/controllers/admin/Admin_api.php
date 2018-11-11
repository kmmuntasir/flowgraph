<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class Admin_api extends Admin_Controller {
		function __construct() {
		    parent::__construct();
		    // Loading Models
		    // $this->load->model($this->module."/m_admin");
		    $this->load->model($this->module."/m_admin");
		    $this->data['page_title'] = '';
		    $this->data['controller'] .= $this->router->fetch_class();
		}

		function add(){
			if ($_POST['admin_pass_1']!=$_POST['admin_pass_2']) exit("Passwords doesn't match!");
			if($_POST['admin_pass_1']=="") exit("Password can't be empty!");

			$_POST['admin_pass'] = md5($_POST['admin_pass_1']);
			unset($_POST['admin_pass_1']);
			unset($_POST['admin_pass_2']);
			
			$_POST['admin_add_date'] = $this->now();
			// $_POST['student_added_by'] = $this->session->admin_id;
			$_POST['admin_added_by'] = 1;
			//$student_photo = $this->file->student_photo;
			// for testing is it working or not?
			// $this->printer($_POST);
			//echo $this->m_student->get_all_students($_POST);
			if ($status=$this->m_admin->add_admin($_POST)) echo 'Success';
			else echo "Failed!";

		}

		function update(){
			if ($_POST['admin_pass_1']!=$_POST['admin_pass_2']) exit("Passwords doesn't match!");
			if($_POST['admin_pass_1']=="") exit("Password can't be empty!");

			$_POST['admin_pass'] = md5($_POST['admin_pass_1']);
			unset($_POST['admin_pass_1']);
			unset($_POST['admin_pass_2']);
			
			$_POST['admin_add_date'] = $this->now();
			$_POST['admin_added_by'] = 1;
			if ($status=$this->m_admin->update_admin($_POST)) echo 'Success';
			else echo "Failed!";

		}

		function delete(){
			if ($status=$this->m_admin->delete_admin($_POST['admin_id'])) echo 'Success';
			else echo "Failed!";
		}
	}
?>