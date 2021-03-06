<?php namespace App\Controllers;

use Mbh\Helpers\Functions;
use App\Models\User;

/**
 * @author Ulises Jeremias Cornejo Fandos
 */
class SignupController extends \App\Controller
{
    public function __construct($app)
    {
        parent::__construct($app, [
          'unlogged' => true
        ]);

        if (MAINTENANCE) {
            header('location:' . URL . 'error/500');
        }

        $this->app->get('/signup', [ $this, 'indexAction' ]);
        $this->app->post('/signup', [ $this, 'signupAction' ]);

        $this->app->run();
    }

    public function indexAction()
    {
        return $this->template->render('signup/signup.twig');
    }

    public function signupAction()
    {
        try {
            $post = $this->post();
            User::init();

            $user = User::create([
              'firstName' => $post['firstName'],
              'lastName' => $post['lastName'],
              'name' => $post['username'],
              'email' => $post['email'],
              'password' => Functions::encrypt($post['password'])
            ]);

            $this->session->generateSession($user->id());

            return [
              'success' => true,
              'message' => "La operación fué realizada con éxito."
            ];
        } catch (\Exception $e) {
            return [
              'success' => false,
              'message' => $e->getMessage()
            ];
        }
    }
}
