<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\Kost;

class OwnerController extends Controller
{
    // public function indexAction()
    // {

    // }

    // public function updateAction()
    // {

    // }

    //12. Melihat profil miliknya sendiri
    public function kostAction()
    {
        $id = $this->session->get('auth')->id;
        $kost = Kost::findFirst(
            [
                "conditions" => "id_user = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        
        $this->view->kost = $kost;
    }
}