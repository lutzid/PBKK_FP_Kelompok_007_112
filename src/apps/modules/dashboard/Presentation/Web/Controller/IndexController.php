<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\Kost;

class IndexController extends Controller
{
    public function indexAction()
    {
        $kosts = Kost::find();
        $this->view->setVar("kosts", $kosts);
    }

    public function registerAction()
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
            $data['peran'] = 'Perantau';
            $user = new User();
            $user->registrasi($data);
            $user->save();

           return $this->response->redirect('login')->send();
        }
    }
}