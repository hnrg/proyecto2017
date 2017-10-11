<?php namespace App\Controllers;

/**
 * created by Ulises Jeremias Cornejo Fandos
 */
class DashboardController extends \App\Controller
{
    function __construct($app)
    {
        parent::__construct($app, [
          'logged' => true
        ]);

        echo $this->template->render('dashboard/dashboard.twig');
    }
}
