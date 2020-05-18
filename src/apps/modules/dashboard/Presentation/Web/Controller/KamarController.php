<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\User;
use MyModel\Transaksi;
use MyModel\Kamar;
use MyModel\Kost;
use Phalcon\Security\Random;

class KamarController extends Controller
{
    public function indexAction()
    {

    }

    public function createAction()
    {
        $id = $this->dispatcher->getParam("id");
        $kost = Kost::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        
    }

    public function storeAction()
    {
        if($this->request->isPost())
        {
            $id = $this->dispatcher->getParam("id");
            $random = new Random();
            $data = $_POST;
            $data['id'] = $random->base64Safe();
            $data['id_kost'] = $id;
            $data['status'] = 'Available';

            $kamar = new Kamar();
            $kamar->registrasi($data);
            if($kamar->save())
            {
                $this->flashSession->success("Data kamar berhasil ditambahkan.");
            } else {
                $this->flashSession->error("Data kamar gagal ditambahkan.");
            }
        }
    }

    public function editAction()
    {
        $id = $this->dispatcher->getParam("id");
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

    public function updateAction()
    {
        $id = $this->dispatcher->getParam("id");
        $kamar = Kamar::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $data = $_POST;
        $data['id'] = $kamar->id;
        $data['id_kost'] = $kamar->id_kost;
        $data['status'] = $kamar->status;
        $kamar->registrasi($data);
        if($kamar->save())
        {
            $this->flashSession->success("Data kamar berhasil diperbarui.");
        } else {
            $this->flashSession->error("Data kamar gagal diperbarui.");
        }
    }

    public function destroyAction()
    {
        $id = $this->dispatcher->getParam("id");
        $kamar = Kamar::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        if($kamar->delete())
        {
            $this->flashSession->success("Data kamar berhasil dihapus.");
        } else {
            $this->flashSession->error("Data kamar gagal dihapus.");
        }
    }

    public function bookAction()
    {
        $id = $this->dispatcher->getParam("id");
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