<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;

class HomeController extends Controller
{
    public function indexAction()
    {
       
    }

    public function profileAction($id){
        // $user = User::findFirst(
        //     [
        //         "conditions" => "id = :id:",
        //         "bind" => [
        //             "id" => $id
        //         ]
        //     ]
        // );

        // $this->view->user = $user;
    }

    public function editAction($id){
        // $user = User::findFirst(
        //     [
        //         "conditions" => "id = :id:",
        //         "bind" => [
        //             "id" => $id
        //         ]
        //     ]
        // );

        // $this->view->user = $user;
    }

    public function updateAction($id)
    {
        if($this->request->isPost())
        {
            $user = User::findFirst(
                [
                    "conditions" => "id = :id:",
                    "bind" => [
                        "id" => $id
                    ]
                ]
            );
        }
    }
}