<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\Kost;
use MyModel\PeriodeKost;
use Phalcon\Security\Random;
use MyModel\FasilitasKost;

class KostController extends Controller
{
    public function indexAction()
    {
        $kosts = Kost::find();
        $this->view->setVar("kosts", $kosts);
    }

    public function createAction()
    {
        $periode = PeriodeKost::find();
        $fasilitas = FasilitasKost::find();
        $this->view->setVar("periode", $periode);
        $this->view->setVar("fasilitas", $fasilitas);
    }

    public function storeAction()
    { 
        if($this->request->isPost())
        {
            $random = new Random();
            $data = $_POST;
            $data['id'] = $random->base64Safe();
            $data['id_user'] = $this->session->get('auth')->id;

            $kost = new Kost();
            $kost->registrasi($data);
            if($kost->save())
            {
                $this->flashSession->success("Data kost berhasil ditambahkan.");
            } else {
                $this->flashSession->error("Data kost gagal ditambahkan.");
            }
        }
    }

    //2. Melihat detail informasi sebuah indekos
    public function showAction($id)
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

    public function editAction($id)
    { 
        $kost = Kost::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        $periode = PeriodeKost::find();
        $fasilitas = FasilitasKost::find();
        
        $this->view->kost = $kost;
        $this->view->periode = $periode;
        $this->view->fasilitas = $fasilitas;
    }

    public function updateAction($id)
    {
        $kost = Kost::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $data = $_POST;
        $data['id'] = $kost->id;
        $data['id_user'] = $kost->id_user;
        $data['jumlah_transaksi'] = $kost->jumlah_transaksi;
        $kost->registrasi($data);
        if($kost->save())
        {
            $this->flashSession->success("Data kost berhasil diperbarui.");
        } else {
            $this->flashSession->error("Data kost gagal diperbarui.");
        }
    }

    public function destroyAction($id)
    { 
        $kost = Kost::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        if($kost->delete())
        {
            $this->flashSession->success("Data Kost berhasil dihapus.");
        } else {
            $this->flashSession->error("Data Kost gagal dihapus.");
        }
    }
}
