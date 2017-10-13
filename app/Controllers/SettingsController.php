<?php namespace App\Controllers;

use App\Storage\File;

/**
 * @author Ulises J. Cornejo Fandos
 */
class SettingsController extends \App\Controller
{
    public function __construct($app)
    {
        parent::__construct($app);

        $this->configFile = new File("config/config.json");

        $this->controllersFile = new File("config/controllers.json");
    }
}
