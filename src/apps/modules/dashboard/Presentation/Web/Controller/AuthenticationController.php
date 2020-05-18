<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\User;

class AuthenticationController extends BaseController
{
    public function indexAction()
    {

    }

    public function loginAction()
    {
        $email = $this->request->getPost('email');
        $pass = $this->request->getPost('password');
    	$user = User::findFirst(
            [
                "conditions" => "email = :email:",
                "bind" => [
                    "email"   => $email
                ],
            ]
        );
        if($user == false){
            $this->flashSession->error("Email atau Password yang anda inputkan salah.");
            return $this->response->redirect('/dashboard/authentication/index');
        }else{
            if(!$this->security->checkHash($pass, $user->password)){
                $this->flashSession->error("Email atau Password yang anda inputkan salah.");
                return $this->response->redirect('/dashboard/authentication/index');
            }
            $this->session->set('auth', $user);
        }

        return $this->response->redirect('/');
    }
    

    public function logoutAction()
    {
        $this->session->destroy();
        $this->flashSession->success("Anda berhasil logout.");

        return $this->response->redirect('/');
    }
}