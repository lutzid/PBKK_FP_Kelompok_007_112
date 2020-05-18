<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\User;
use MyModel\Transaksi;

class KamarController extends Controller
{
    public function indexAction()
    {

    }

    public function createAction()
    {

    }

    public function storeAction()
    {

    }

    public function editAction()
    {

    }

    public function updateAction()
    {

    }

    public function destroyAction()
    {

    }

    public function bookAction()
    {
        $kamar = Kamar::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $this->view->kamar = $kamar;
    }
}