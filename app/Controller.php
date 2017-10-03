<?php namespace App;

use Twig_Environment;
use Twig_Loader_Filesystem;

/**
 * created by Ulises J. Cornejo Fandos
 */
class Controller extends \Mbh\Controller
{
    static function create($controller, $args)
    {
        $className = "\\App\\Controllers\\" . ucwords($controller) . "Controller";
        if (class_exists($className)) {
            return parent::create($className, $args);
        }

        /* do something */
    }

    function __construct($app = null)
    {
        parent::__construct($app);

        $this->template = new Twig_Environment(new Twig_Loader_Filesystem('web/templates/'));
    }
}
