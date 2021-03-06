<?php

/**
 * Created by PhpStorm.
 * User: asterixslashstar
 * Date: 4/22/2016
 * Time: 10:14 PM
 */
class Config extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->database();
        $this->load->helper('url');

        $this->load->library('grocery_CRUD');
    }

    public function _config_output($output = null)
    {
        $this->load->view('config.php',$output);
    }


    public function sensor_management()
    {
        try{
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('sensors');
            $crud->set_subject('Sensors');
            $crud->required_fields('sensor_name', 'reg_date');
            $crud->columns('sensor_name', 'reg_date');

            $output = $crud->render();

            $this->_config_output($output);

        }catch(Exception $e){
            show_error($e->getMessage().' --- '.$e->getTraceAsString());
        }
    }
    public function tile_management()
    {
        try{
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('tiles');
            $crud->set_subject('Tiles');
            $crud->required_fields('title', 'x', 'y');
            $crud->columns('title', 'x', 'y');

            $output = $crud->render();

            $this->_config_output($output);

        }catch(Exception $e){
            show_error($e->getMessage().' --- '.$e->getTraceAsString());
        }
    }

    public function panel_management()
    {
        try{
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('panels');
            $crud->set_subject('Panels');
            $crud->required_fields('panel_name', 'installed_date', 'heat', 'rain', 'wind');
            $crud->columns('panel_name', 'installed_date', 'heat', 'rain', 'wind');

            $crud->set_relation('heat', 'boolean', 'title');
            $crud->set_relation('rain', 'boolean', 'title');
            $crud->set_relation('wind', 'boolean', 'title');
            $output = $crud->render();

            $this->_config_output($output);

        }catch(Exception $e){
            show_error($e->getMessage().' --- '.$e->getTraceAsString());
        }
    }

    public function settings_management()
    {
        try{
            $crud = new grocery_CRUD();

            $crud->set_theme('datatables');
            $crud->set_table('settings');
            $crud->set_subject('Settings');
            $crud->required_fields('settingscol');
            $crud->columns('settingscol');

            $output = $crud->render();

            $this->_config_output($output);

        }catch(Exception $e){
            show_error($e->getMessage().' --- '.$e->getTraceAsString());
        }
    }
}