<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\User;
use MyModel\Transaksi;
use MyModel\Kamar;
use MyModel\Kost;
use Phalcon\Security\Random;

class KamarController extends BaseController
{
    public function indexAction()
    {

    }

    public function createAction($id)
    {
        $kost = Kost::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        
        $this->view->kost = $kost;
    }

    //6. Menambahkan kamar di sebuah indekos
    public function storeAction()
    {
        if($this->request->isPost())
        {
            $id = $this->dispatcher->getParam("id");
            $random = new Random();
            $data = $_POST;
            $data['id'] = $random->base64Safe();
            $data['id_kost'] = $id;
            $data['harga'] = (float)str_replace('.', '', $data['harga']);
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

    public function editAction($id)
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

    //7. Mengubah kamar di sebuah indekos
    public function updateAction($id)
    {
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

    //8. Menghapus kamar di sebuah indekos
    public function destroyAction($id)
    {
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

    public function bookAction($id)
    {
        $kamar = Kamar::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        $kost = Kost::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $kamar->id_kost
                ]
            ]
        );
        $this->view->setVar("kost", $kost);
        $this->view->setVar("kamar", $kamar);
    }
}