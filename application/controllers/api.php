<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        header('content-type: application/json; charset=utf-8');

    }

    private function _send($data)
    {
        $json = json_encode($data);
        echo isset($_GET['callback'])
            ? "{$_GET['callback']}($json)"
            : $json;
    }
	
    /* takes date values as mysql timestamp integers
    eg. 20061124092345 */
    public function panels($start = null, $end = null)
    {
        $this->_send($this->_get_panels((float) $start, (float) $end));
    }

    /* takes date values as mysql timestamp integers
    eg. 20061124092345*/
    public function sensors($start = null, $end = null)
    {
        $this->_send($this->_get_sensors((float) $start, (float) $end));
    }

    public function settings()
    {
        $this->_send($this->_get_settings());
    }

    public function tiles()
    {
        $this->load->database();
        $query_string = 'select * from tiles;';
        $query = $this->db->query($query_string.";");
        $this->_send($query->result_array());
    }

    private function _compare($a, $b)
    {
        return $b["x"] - $a["x"];
    }

    public function sample()
    {
        $to_return = array();
        for($i = 1; $i < rand(10,100); $i++) {
            $to_return[] = array("x"=>$i, "y"=>rand(1,1200));
        }

        $this->_send($to_return);
    }

    private function _get_panels($start = null, $end = null)
    {
        $this->load->database();
        $query_string = 'select * from panels';

        if($start || $end) {
            $query_string .= " where ";
            if($start) {
                $query_string .= " installed_date >= " . $start;
            }
            if($end) {
                if($start) {
                    $query_string .= " AND ";
                }
                $query_string .= " installed_date <= " . $end;
            }
        }
        $query = $this->db->query($query_string.";");
        return $query->result_array();
    }

    private function _get_sensors($start = null, $end = null)
    {
        $this->load->database();
        $query_string = 'select * from sensors';

        if($start || $end) {
            $query_string .= " where ";
            if($start) {
                $query_string .= " reg_date >= " . $start;
            }
            if($end) {
                if($start) {
                    $query_string .= " AND ";
                }
                $query_string .= " reg_date <= " . $end;
            }
        }
        $query = $this->db->query($query_string.";");
        return $query->result_array();
    }

    private function _get_settings()
    {
        $this->load->database();
        $query = $this->db->query('SELECT * FROM settings');
        return $query->result_array();
    }


    public function utci($type, $start = null, $end = null)
    {
        if($type == "sun"
            || $type == "smartroof"
            || $type == "ambient") {
            $this->_send($this->_get_utci($type, (float) $start, (float) $end));
        }
    }

    private  function _get_utci($type, $start, $end)
    {
        $this->load->database();
        $query_string = 'select UNIX_TIMESTAMP(recorded_time) as x, '.$type.' as y from utci 
        WHERE recorded_time >= "2016-08-19 00:00:00" AND recorded_time <= "2016-08-27 10:00:00"
        order by recorded_time; ';

//        if($start || $end) {
//            $query_string .= " where ";
//            if($start) {
//                $query_string .= " recorded_date >= '2016-08-19 00:00:00'" ;
//            }
//            if($end) {
//                if($start) {
//                    $query_string .= " AND ";
//                }
//                $query_string .= " recorded_date <= 2016-08-27 10:00:00" ;
//            }
//        }
//        var_dump($query_string);
        $query = $this->db->query($query_string.";");
        return $query->result_array();
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */