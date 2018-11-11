<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class Academic_api extends Admin_Controller {
		function __construct() {
		    parent::__construct();
		    // Loading Models
		    // $this->load->model($this->module."/m_admin");

		    $this->data['page_title'] = '';
		    $this->data['controller'] .= $this->router->fetch_class();
		}
		
		function index() {
			$data = $this->data;
			$data['page'] = $this->router->fetch_class();
			$data['page_title'] = ucfirst($this->router->fetch_class());
			$this->load->view($this->viewpath.'v_main', $data);
		}

		function add_faculty(){
			if (isset($_POST['faculty_name'])) {
				$_POST['faculty_add_date'] = $this->now();
				$_POST['faculty_added_by'] = $this->session->admin_id;
				if ($status=$this->m_academic_api->add_faculty($_POST)) echo "success";
				else "Failed to ADD faculty";
			} else echo "Faculty Name required!";
		}

		function update_faculty(){
			if (isset($_POST['faculty_id'])) {
				if ($status=$this->m_academic_api->update_faculty($_POST, $_POST['faculty_id'])) echo "success";
				else "Failed to UPDATE faculty";
			} else echo "ID required!";
		}

		function delete_faculty(){
			if (isset($_POST['faculty_id'])) {
				if ($status=$this->m_academic_api->delete_faculty($_POST['faculty_id'])) echo "success";
				else "Failed to DELETE faculty";
			} else echo "ID required!";
		}

		function all_faculty() {
			$faculties = $this->m_academic_api->get_all_faculty();
		}

		function all_faculty_with_dept(){
			$all_faculties = array();
			$faculties = $this->m_academic_api->get_all_faculty();
			foreach ($faculties as $key => $faculty) {
				$new_array = array();
				$new_array['faculty_name'] = $faculty->faculty_name;
				$new_array['depts'] = '';
				$new_array['faculty_id'] = $faculty->faculty_id;

				$faculty->dept = $this->m_academic_api->get_all_dept($faculty->faculty_id);

				foreach ($faculty->dept as $k => $single_dept) {
					unset($single_dept->faculty_id);
					unset($single_dept->dept_added_by);
					unset($single_dept->dept_add_date);
					unset($single_dept->is_deleted);
				}
				$new_array['depts'] = json_encode($faculty->dept);
				array_push($all_faculties, $new_array);
			}
			// $this->tabular($all_faculties);
			// $this->printer($all_faculties);
			echo $this->to_datatable_json_format($all_faculties, true);
		}
	}
?>