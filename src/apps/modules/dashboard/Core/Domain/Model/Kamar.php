<?php

namespace MyModel;

use MyModel\BaseModel;

class Kamar extends BaseModel
{
    public $id_kost;
    public $nama;
    public $harga;
    public $panjang;
    public $lebar;
    public $status;

    public function initialize () {
        $this->setSource('kamar');

        $this->belongsTo(
            'id_kost',
            'MyModel\Kost',
            'id',
            [
                'alias' => 'Kost',
            ]
        );

        $this->hasMany(
            'id',
            'MyModel\Transaksi',
            'id_kamar',
            [
                'alias' => 'Transaksi'
            ]
        );
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->id_kost = $data['id_kost'];
        $this->nama = $data['nama'];
        $this->harga = $data['harga'];
        $this->panjang = $data['panjang'];
        $this->lebar = $data['lebar'];
        $this->status = $data['status'];
    }
}