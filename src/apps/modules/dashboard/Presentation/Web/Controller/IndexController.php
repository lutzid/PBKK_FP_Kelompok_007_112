<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use Phalcon\Security\Random;
use MyModel\Kost;
use MyModel\User;

class IndexController extends BaseController
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
            $data['foto_profil'] = 'img/user.png';
            $data['foto_ktp'] = 'img/ktp.png';
            $data['peran'] = 'Perantau';
            $user = new User();
            $user->registrasi($data);
            $user->save();

            if ($user->save()) {
                return $this->response->redirect('/')->send();
            } else {
                $messages = $user->getMessages();
                $this->view->messages = $messages;

                return $this->dispatcher->forward(
                    [
                        "controller" => "index",
                        "action"     => "register",
                    ]
                );
            }
        }
    }
}