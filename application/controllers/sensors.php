<?php
class sensors extends CI_Controller {
    private function _fetch_sensor_data()
    {
        $this->load->database();
        $mysqli = new mysqli("localhost", "smartroof", "smartroof", "smartroof");
        $url = 'https://tsdemobox09.tindi.solutions/measurement/measurements?startkey=%2259601%22&pageSize=80';

        $context = stream_context_create(array(
            'http' => array(
                'header'  => "Authorization: Basic " . base64_encode("api1@telia.com:Api1-2016")
            )
        ));
        $data = file_get_contents($url, false, $context);
        $s_string = $mysqli->real_escape_string($data);
        //$jsonData = json_decode($s_string);
        $jsonData = json_decode($data);
        //return $data;
        $line = end($jsonData->measurements);
        $temperature = $line->c8y_TemperatureMeasurement->T->value;
        $humidity = $line->c8y_HumidityMeasurement->h->value;
        $query_string = 'insert into weathersensor (airtemp,humidity) values ("' . $temperature. '","' . $humidity . '");';
        $query = $this->db->query($query_string);
        return $data;

    }

    public function fetch()
    {
        print_r($this->_fetch_sensor_data());
    }
}
?>