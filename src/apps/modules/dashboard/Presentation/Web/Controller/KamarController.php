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
    { }

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
    public function storeAction($id)
    {
        if ($this->request->isPost()) {
            $random = new Random();
            $data = $_POST;
            $data['id'] = $random->base64Safe();
            $data['id_kost'] = $id;
            $data['harga'] = (float) str_replace('.', '', $data['harga']);
            $data['status'] = 'Available';

            $kamar = new Kamar();
            $kamar->registrasi($data);
            if ($kamar->save()) {
                $this->flashSession->success("Data kamar berhasil ditambahkan.");
            } else {
                $messages = $kamar->getMessages();
                $this->view->messages = $messages;
                
                $this->flashSession->error("Data kamar gagal ditambahkan.");

                return $this->dispatcher->forward(
                    [
                        "controller" => "kamar",
                        "action"     => "create",
                        "params"     => array($id),
                    ]
                );
            }
        }
        $this->response->redirect('/dashboard/owner/kost');
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
        if ($kamar->save()) {
            $this->flashSession->success("Data kamar berhasil diperbarui.");
        } else {
            $messages = $kamar->getMessages();
            $this->view->messages = $messages;

            $this->flashSession->error("Data kamar gagal diperbarui.");
        }
        $this->response->redirect('/dashboard/owner/kost');
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

        if ($kamar->delete()) {
            $this->flashSession->success("Data kamar berhasil dihapus.");
        } else {
            $this->flashSession->error("Data kamar gagal dihapus.");
        }
        $this->response->redirect('/dashboard/owner/kost');
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
