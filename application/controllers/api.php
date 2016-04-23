<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {

	public function index()
	{
		$this->load->view('api_message');
	}
	

    public function panels()
    {
        header('content-type: application/json; charset=utf-8');

        $json = json_encode($this->_get_panels());

        echo isset($_GET['callback'])
            ? "{$_GET['callback']}($json)"
            : $json;
    }

    private function _get_panels($start = null, $end = null)
    {
        $this->load->database();
        $query = $this->db->query('select * from panels');
        return $query->result_array();
    }
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */