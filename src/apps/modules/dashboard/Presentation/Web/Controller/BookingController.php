<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\Kamar;
use MyModel\Transaksi;
use Phalcon\Security\Random;
use Carbon\Carbon;

class BookingController extends Controller
{
    public function storeAction()
    {
        $_POST->sub_total = (float)str_replace('.', '', $_POST->sub_total);
        $_POST->admin = (float)str_replace('.', '', $_POST->admin);
        $_POST->total = (float)str_replace('.', '', $_POST->total);

        $start_boarding = Carbon::createFromFormat('Y-m-d', $_POST->start_boarding)->startOfDay();
        if($_POST->per == 1) {
            $end_boarding = Carbon::createFromFormat('Y-m-d', $_POST->start_boarding)->addDays($_POST->num)->endOfDay();
        }
        if($_POST->per == 2) {
            $end_boarding = Carbon::createFromFormat('Y-m-d', $_POST->start_boarding)->addWeeks($_POST->num)->endOfDay();
        }
        if($_POST->per == 3) {
            $end_boarding = Carbon::createFromFormat('Y-m-d', $_POST->start_boarding)->addMonths($_POST->num)->endOfDay();
        }
        if($_POST->per == 4) {
            $end_boarding = Carbon::createFromFormat('Y-m-d', $_POST->start_boarding)->addYears($_POST->num)->endOfDay();
        }

        $id = $this->dispatcher->getParam("id");
        $kamar = Kamar::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        $transaksi = new Transaksi();

        $random = new Random();
        $data['id'] = $random->base64Safe();
        $data['id_kamar'] = $kamar->id;
        $data['id_user'] = $this->session->get('auth')->id;
        $data['waktu_mulai'] = $start_boarding;
        $data['waktu_selesai'] = $end_boarding;
        $data['admin'] = $_POST->admin;
        $data['sub_total'] = $_POST->sub_total;
        $data['total'] = $_POST->total;
        $data['status'] = 'Pending';
        $data['metode_pembayaran'] = 'null';
        $data['bukti_pembayaran'] = 'null';

        $transaksi->registrasi($data);
        
        $kamar->status = 'Unavailable';

        $kamar->save();
        $transaksi->save();

    }

    public function acceptAction()
    {
        $id = $this->dispatcher->getParam("id");
        $transaksi = Transaksi::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $transaksi->status = 'Diterima';
        $transaksi->save();
    }

    public function rejectAction()
    {
        $id = $this->dispatcher->getParam("id");
        $transaksi = Transaksi::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $transaksi->status = 'Ditolak';
        $transaksi->save();
    }

    public function cancelAction()
    {
        $id = $this->dispatcher->getParam("id");
        $transaksi = Transaksi::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );
        $transaksi->delete();
    }

    public function invoiceAction()
    {

    }
}