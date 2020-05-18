<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use Phalcon\Security\Random;
use MyModel\Kost;
use MyModel\User;

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
            $data['peran'] = 'Perantau';
            $user = new User();
            $user->registrasi($data);
            if($this->request->hasFiles() == true){
                $uploads = $this->request->getUploadedFiles();
                $isuploaded = false;
                $allpath = "";
                foreach($uploads as $up)
                {
                    $path = 'storage/'.time().'-'.strtolower($up->getname());
                    $fpath = BASE_PATH . "/public/" . $path;
                    if($up->moveTo($fpath)){
                        $isUploaded = true;
                        $allpath.=$path;
                    }else{
                        $isUploaded = false;
                    }
                    if($up->getkey() === 'foto_profil'){
                        $data['foto_profil'] = $allpath;
                    } 
                    else if($up->getkey() === 'foto_ktp'){
                        $data['foto_ktp'] = $allpath;
                    }
                }
            }
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