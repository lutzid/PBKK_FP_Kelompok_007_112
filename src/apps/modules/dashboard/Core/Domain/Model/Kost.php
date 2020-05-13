<?php

namespace MyModel;

use MyModel\BaseModel;

class Kost extends BaseModel
{
    public $id_user;
    public $nama; 
    public $jumlah_transaksi;
    public $alamat; 

    public function initialize () {
        $this->setSource('kost');
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->id_user = $data['id_user'];
        $this->nama = $data['nama'];
        $this->jumlah_transaksi = $data['jumlah_transaksi'];
        $this->alamat = $data['alamat'];
    }
}