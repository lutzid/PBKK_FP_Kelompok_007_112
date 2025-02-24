<?php

namespace MyModel;

use MyModel\BaseModel;

class Transaksi extends BaseModel
{
    public $id_kamar;
    public $id_user;
    public $waktu_mulai;
    public $waktu_selesai;
    public $admin;
    public $sub_total;
    public $total;
    public $status;
    public $metode_pembayaran;
    public $bukti_pembayaran;

    public function initialize () {
        $this->setSource('transaksi');

        $this->belongsTo(
            'id_user',
            'MyModel\User',
            'id',
            [
                'alias' => 'User',
            ]
        );

        $this->belongsTo(
            'id_kamar',
            'MyModel\Kamar',
            'id',
            [
                'alias' => 'Kamar',
            ]
        );
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->id_kamar = $data['id_kamar'];
        $this->id_user = $data['id_user'];
        $this->waktu_mulai = $data['waktu_mulai'];
        $this->waktu_selesai = $data['waktu_selesai'];
        $this->admin = $data['admin'];
        $this->sub_total = $data['sub_total'];
        $this->total = $data['total'];
        $this->status = $data['status'];
        $this->metode_pembayaran = $data['metode_pembayaran'];
        $this->bukti_pembayaran = $data['bukti_pembayaran'];
    }
}