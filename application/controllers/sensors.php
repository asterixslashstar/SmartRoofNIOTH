<?php
class sensors extends CI_Controller {
    private function _fetch_sensor_data()
    {
        $this->load->database();
        $mysqli = new mysqli("localhost", "smartroof", "smartroof", "smartroof");
        $baseUrl = 'https://tsdemobox09.tindi.solutions/measurement/measurements?startkey=%22';



        $read_query_string = "SELECT taliastemp,recorded FROM weathersensor ORDER BY id DESC LIMIT 1";
        $query = $this->db->query($read_query_string);
        $lastKey = $query->result_array()[0]['recorded'];
        //return time();
        //return strtotime($lastKey);

        $timeDifference = (time() - strtotime($lastKey));
        //return $timeDifference;
        //$baseUrl .= $timeDifference + $query->result_array()[0]['taliastemp'];
        $baseUrl .= $timeDifference + 83701;

        $baseUrl .= '%22&pageSize=10';
        //return $baseUrl;
        $context = stream_context_create(array(
            'http' => array(
                'header'  => "Authorization: Basic " . base64_encode("api1@telia.com:Api1-2016")
            )
        ));
        $data = file_get_contents($baseUrl, false, $context);
        $s_string = $mysqli->real_escape_string($data);
        //$jsonData = json_decode($s_string);
        $jsonData = json_decode($data);
        //return $data;
        $line = end($jsonData->measurements);
        //return $line;
        $temperature = $line->c8y_TemperatureMeasurement->T->value;
        $humidity = $line->c8y_HumidityMeasurement->h->value;
        $keyTime = $line->id;

        //return $keyTime;

        $query_string = 'insert into weathersensor (airtemp,humidity,taliastemp) values ("' . $temperature. '","' . $humidity . '","'.$keyTime.'");';
        $query = $this->db->query($query_string);
        return $line;

    }

    public function fetch()
    {
        print_r($this->_fetch_sensor_data());
    }
}
?>