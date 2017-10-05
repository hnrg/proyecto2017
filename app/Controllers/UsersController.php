<?php namespace App\Controllers;

/**
 * created by Ulises Jeremias Cornejo Fandos
 */
class UsersController extends \App\Controller
{
    function __construct($app, $method = null, $data = null)
    {
        parent::__construct($app);
        \App\Models\User::init();
        $users = \App\Models\User::all();
        echo $this->template->render('user/user.twig', array('users' => $users));
    }
}
