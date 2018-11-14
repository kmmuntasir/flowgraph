<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends User_Controller {
	public function __construct() {
        parent::__construct(true);
        
        // Loading Models
        // $this->load->model($this->module."/m_user");

        $this->data['page_title'] = '';
        $this->data['controller'] .= $this->router->fetch_class();
    }
    //====================================//

    public function index() {
    	if(!isset($_GET['url'])) $url = $this->module;
  		else $url = $_GET['url'];

        $this->session->set_userdata('url_segment', $url);

    	if($this->__is_logged_in($this->module)) redirect($url);

    	$data = $this->data;
        $data['page'] = 'login';
        $data['page_title'] .= 'User Login';
        $data['login_process_url'] = $this->data['controller'].'/login_process';
        $this->load->view($this->viewpath.'v_login', $data);
    }

    public function login_process() {
        // $this->printer($_POST, true);
        extract($_POST);
    	$result = $this->m_login->login_check_user($user_email, md5($user_pass));

        // $this->printer($result, true);

        $url = $this->session->userdata('url_segment');

    	if($result) {
            // Setting Session
    		$temp = array('user_id' => $result->user_id, 'user_stat' => $result->is_deleted, 'user_name' => $result->user_name);
    		$this->session->set_userdata($temp);
            $this->session->unset_userdata('url_segment');

            if(isset($_POST['remember'])) {

                // Setting Cookie
                $cookie = array(
                    'name'   => 'user_id',
                    'value'  => $result->user_id,                            
                    'expire' => time()+86400*7
                );

                $this->create_cookie($cookie);

                $cookie = array(
                    'name'   => 'user_stat',
                    'value'  => $result->is_deleted,                            
                    'expire' => time()+86400*7
                );
                
                $this->create_cookie($cookie);

                $cookie = array(
                    'name'   => 'user_name',
                    'value'  => $result->user_name,                            
                    'expire' => time()+86400*7
                );
                
                $this->create_cookie($cookie);
            }

    		redirect(site_url($url));
    	}
        $url = ($url != $this->module.'/dashboard') ? '?url='.$url : '';
        $this->redirect_msg(site_url($this->module.'/login'.$url), 'Login Failed! Invalid Username/Password', 'danger');
    }

    public function logout() {
    	$temp = array('user_id', 'user_stat', 'user_name');
    	$this->session->unset_userdata($temp);         // Unsetting Session
        $this->destroy_cookie('user_id');          // Unsetting Cookie
        $this->destroy_cookie('user_stat');         // Unsetting Cookie
        $this->destroy_cookie('user_name');         // Unsetting Cookie
    	redirect(site_url($this->module.'/login'));
    }
}
