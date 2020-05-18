<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use Phalcon\Security\Random;
use MyModel\User;

class AdminController extends BaseController
{
    public function indexAction()
    {

    }

    public function createAction()
    {

    }

    public function storeAction()
    {
        if($this->request->isPost())
        {
            $random = new Random();
            $data = $_POST;
            $data['id'] = $random->base64Safe();
            $data['password'] = $this->security->hash($data['password']);
            $data['foto_profil'] = 'storage/avatar3.jpg';
            $data['foto_ktp'] = 'storage/avatar3.jpg';
            $data['peran'] = 'Pemilik';
            $user = new User();
            $user->registrasi($data);
            $user->save();

           return $this->response->redirect('login')->send();
        }
    }
}