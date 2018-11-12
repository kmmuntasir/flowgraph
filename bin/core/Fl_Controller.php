<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Fl_Controller extends CI_Controller {

	public $data = array();
    public $viewpath = '';

	public function __construct() {
		parent::__construct();

		// Setting Timezone
		date_default_timezone_set("Asia/Dhaka");

		// loading models (If necessary)
		//$this->load->model("admin/m_admin");
        $this->viewpath = $this->module.'/'.$this->template.'/';
		$this->data['fullpath'] = base_url().VIEW_DIR.'/'.$this->module.'/'.$this->template.'/';
		$this->data['page_title'] = '';
		$this->data['module'] = $this->module;
		$this->data['page'] = '';
		$this->data['controller'] = site_url($this->module.'/');
	}


	public function __is_logged_in($module) {
		/**
			Checks if the user is logged in in current module (checks in session)
			If not found in session, but cookie available then sets the session and returns true
			If found in neither session nor cookie, then returns false

		**/
		// $this->printer($_SESSION, true);

		$user_id_string = $module."_id";
		$user_name_string = $module."_name";
		$user_stat_string = $module."_stat";

		if($this->session->$user_id_string == NULL) {
			if(($temp_id = $this->fetch_cookie($user_id_string)) == NULL) return false;	// Returning false on unavailable cookie
			// Cookie found
			$temp = array(
				$user_id_string => $temp_id, 
				$user_name_string => $this->fetch_cookie($user_name_string), 
				$user_stat_string => $this->fetch_cookie($user_stat_string)
			);
			$this->session->set_userdata($temp);    // Loging in the user automatically when cookie is found
			return true;
		}
		return true; // Session Found, so already logged in
	}

	public function __security($module) {
		if(!$this->__is_logged_in($module)) redirect(site_url($module.'/login?url='.$this->uri->uri_string));
	}

    public function __admin_check() {
        
    }

	public function __do_upload($field, $config, $rename_flag=false) {
		/*
			__do_upload() is a custom function to avoid the problem of loading the same library multiple times in the same CI controller and keep the code clean. It uses the same $config array format of CI upload library. $field is the name of the input field of the desired file upload form. 
		*/
		$result = array();

        if($rename_flag) {
    		$file_name = substr(md5(microtime(true).$_FILES[$field]['name']), 1, 6); // Generating a unique name using current microtime
            $ext = pathinfo($_FILES[$field]['name'], PATHINFO_EXTENSION); // Extracting the filename extension from the original filename
            $file_name .= '.'.$ext;
        }
        else $file_name = $_FILES[$field]['name'];

        $config['file_name'] = $file_name;

        $this->load->library('upload');

        $this->upload->initialize($config); 

        if ( ! $this->upload->do_upload($field)) {
        	$result['error'] = $this->upload->display_errors();
        	return $result;
        }
        else {
        	$result['error'] = false;
        	$result['success'] = $this->upload->data();
        	return $result;
        }
    }

    public function printer($arr, $exit_flag = false, $return_flag=false) { // for debug purpose
        $text  = '';
        $text .= '<pre>';
        $text .= print_r($arr, true);
        $text .= '</pre>';

        // $text = nl2br($text);

        if($return_flag) return $text;
        else echo $text;

        if($exit_flag) exit();
    }

    public function dump($data, $exit_flag = false) { // for debug purpose
        highlight_string("<?php\n\$data =\n" . var_export($data, true) . ";\n?>");
        if($exit_flag) exit();
    }
    
    public function redirect_msg($url, $msg='', $type="success", $number=0) {
    	/**
			This function redirects the client with single/multiple flash message(s)
    	**/
    	if($number==0) $this->session->set_flashdata(array('msg' => array(0=>array($msg, $type)), 'number' => 1));
    	else $this->session->set_flashdata(array('msg' => $msg, 'number' => $number));
    	redirect($url);
    }
	
	public function my_curl($url, $post_index, $data) {
		$field_data = $post_index.'='.json_encode($data);
		
		$ch = curl_init( $url );
        curl_setopt( $ch, CURLOPT_POST, 1);
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $field_data);
        curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt( $ch, CURLOPT_HEADER, 0);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);
		return curl_exec( $ch );
	}

	public function my_file_get_contents($url, $post_index, $data) {
        $data = array("$post_index"=>json_encode($data));
        $options = array(
                'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'content' => http_build_query($data),
            )
        );

        $context  = stream_context_create($options);
        return file_get_contents($url, false, $context);
	}

    public function __mail($from, $to, $subject, $message, $cc=NULL, $bcc=NULL) {
        $this->load->library('email');

        $this->email->from($from, 'ISP Admin');
        $this->email->to($to);

        $this->email->subject($subject);
        $this->email->message($message);

        if($cc) $this->email->cc($cc);
        if($bcc) $this->email->bcc($bcc);

        $this->email->send();
    }

    public function tabular($arr, $exit_flag=false, $display=true, $style=true, $attr='cellspacing="0" cellpadding="3" style="background-color: #fff; font-size: 10px; font-family: monaco, consolas"') {
    	/**
			Prints out a two dimensional array in a pretty table for easy debugging purpose
    	**/
        // if(!$style) $attr = '';
        $table = '';
        $css = '';
        if(is_array($arr) || is_object($arr)) {
            $first_row_flag=true;
            $css .= '<style type="text/css">'."\n";
            $css .= 'tbody > tr > td {border: none; border-right: solid 1px #999;}'."\n";
            $css .= 'td:first-child {border-left: solid 1px #999;}'."\n";
            $css .= 'thead > tr {background-color: #fff; color:#000;}'."\n";
            $css .= 'thead > tr > th {border: solid 1px #999;}'."\n";
            $css .= 'tr:last-child > td {border-bottom: solid 1px #999;}'."\n";
            $css .= 'tr {vertical-align: top;}'."\n";
            $css .= 'table {margin: 10 0; border-collapse: collapse;}'."\n";
            // $css .= 'th {position: sticky; position: -webkit-sticky; top: 0; z-index: 10;}'."\n";
            $css .= '</style>'."\n";
            $table .= "<table $attr>";
            $color_flag = true;
            foreach ($arr as $k => $row) {
                if($first_row_flag) {
                    if(is_array($row) || is_object($row)) {
                        $table .= '<thead><tr>';
                        foreach ($row as $key => $val) {
                            $table .= '<th>'.$key.'</th>';
                        }
                        $table .= '</tr></thead><tbody>';
                        $first_row_flag = false;
                    }
                    else $table .= '<td>'.$this->printer($row, false, true).'</td>';
                }

                if(is_array($row) || is_object($row)) {
                    $color = '';
                    if($color_flag && $style) $color = 'style="background-color: #eee;"';
                    $color_flag = !$color_flag;
                    $table .= "<tr $color>";
                    foreach ($row as $key => $val) {
                        // $table .= '<td>'.$val.'</td>';
                        $table .= '<td>';
                        // if(is_array($val) || is_object($val)) {
                            $table .= $this->printer($val, false, true);
                        // }
                        $table .= '</td>';
                    }
                    $table .= '</tr>';
                }
                else $table .= '<td>'.$this->printer($row, false, true).'</td>';
            }
            $table .= "</tbody></table>";
        }
        else $table .= $this->printer($arr, false, true);

        if($display) {
            if($style) echo $css;
            echo $table;
        }
        else return $table;

        if($exit_flag) exit();
    }

    public function swap(&$x, &$y) {
        $temp = $x;
        $x = $y;
        $y = $temp;
    }

    public function isTime($time) {
        $parts = explode(':', $time);
        $h = $parts[0];
        $m = $parts[1];
        $s = $parts[2];

        if(($h >= 0 && $h <= 23) && ($m >= 0 && $m <= 59) && ($s >= 0 && $s <= 59)) return true;
        else return false;
    }

    public function isDate($date) {
        $dt = explode("-", $date);
        if(count($dt) == 3) {
            $y = $dt[0] * 1;
            $m = $dt[1] * 1;
            $d = $dt[2] * 1;
            return checkdate($m, $d, $y);
        }
        else return false;
    }

    public function isDateTime($datetime) {
        $parts = explode(" ", $datetime);
        if(count($parts) == 2) {
            $dt = explode("-", $parts[0]);
            if(count($dt) == 3) {
                $y = $dt[0] * 1;
                $m = $dt[1] * 1;
                $d = $dt[2] * 1;
                if(checkdate($m, $d, $y) && $this->isTime($parts[1]) ) return true;
                else return false;
            }
            else return false;
        }
        else return false;
    }
    
    public function to_datatable_json_format($data, $json_output = false, $datetimeformat=false, $test_multiplier=1) {
        $json_data = array('data' => array());
        $i=0;

        for($m = 0; $m < $test_multiplier; ++$m) {
            foreach($data as $key=>$row) {
                $json_data['data'][$i] = array();
                foreach ($row as $cell_key => $cell) {
                    if($datetimeformat) {
                        if($this->isDateTime($cell)) { // Checking if the value is a date/datetime
                            $cell = date('M d, Y h:i a', strtotime($cell));
                        }
                    }
                    array_push($json_data['data'][$i], $cell);
                }
                ++$i;
            }
        }
        if($json_output) return json_encode($json_data);
        else return $json_data;
    }

    public function now($dateonly=false) {
        if($dateonly) return date('Y-m-d');
        else return date('Y-m-d H:i:s');
    }

    public function create_cookie($cookie=NULL) {
        if($cookie == NULL) return NULL;
        extract($cookie);
        return setcookie($name, $value, $expire);
    }

    public function fetch_cookie($cookie_name=NULL) {
        if($cookie_name == NULL) return NULL;
        if(!isset($_COOKIE[$cookie_name])) return NULL;
        return $_COOKIE[$cookie_name];
    }

    public function destroy_cookie($cookie_name=NULL) {
        if($cookie_name == NULL) return NULL;
        if(!isset($_COOKIE[$cookie_name])) return NULL;

        $cookie = array(
            'name'   => $cookie_name,
            'value'  => '',                            
            'expire' => time()-3600
        );
        return $this->create_cookie($cookie);
    }

}



// ============================== Admin Controller =============================== //

class Admin_Controller extends Fl_Controller {

    public $module = 'admin';   // defines the module
    public $template = 'optima_Fl_admin';  // Current Template Name

    function __construct($bypass_login_check=false) {
        parent::__construct();
        if(!$bypass_login_check) $this->__security($this->module);

        // Loading Models
        $this->load->model($this->module."/m_admin");
        $this->load->model($this->module."/m_".$this->router->fetch_class());
        $this->fetch_access();
    }

    function fetch_access() {
        $roots = $this->m_admin->fetch_access();
        foreach ($roots as $key => $root) {
            $root->children = $this->m_admin->fetch_access($root->module_id);
            // if(count($root->children) == 0) $root->children = NULL;
        }
        $this->data['accessible_modules'] = $roots;
    }

}

// ============================== Student Controller =============================== //

class User_Controller extends Fl_Controller {

    public $module = 'user';   // defines the module
    public $template = 'flowgraph_user';  // Current Template Name

    function __construct($bypass_login_check=false) {
        parent::__construct();
        if(!$bypass_login_check) $this->__security($this->module);

        // Loading Models
        // $this->load->model($this->module."/m_user"); 

    }
}

?>