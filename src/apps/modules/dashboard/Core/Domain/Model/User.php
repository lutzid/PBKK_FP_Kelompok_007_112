<?php

namespace MyModel;

use MyModel\BaseModel;

class User extends BaseModel
{
    public $email;
    public $password;
    public $username;
    public $nama;
    public $nik;
    public $alamat_ktp;
    public $alamat_domisili;
    public $no_hp;
    public $peran;
    public $foto_profil;
    public $foto_ktp;

    public function initialize () {
        $this->setSource('users');

        $this->hasMany(
            'id',
            'MyModel\Kost',
            'id_user',
            [
                'alias' => 'Kost'
            ]
        );

        $this->hasMany(
            'id',
            'MyModel\Transaksi',
            'id_user',
            [
                'alias' => 'Transaksi'
            ]
        );
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->email = $data['email'];
        $this->password = $data['password'];
        $this->username = $data['username'];
        $this->nama = $data['nama'];
        $this->nik = $data['nik'];
        $this->alamat_ktp = $data['alamat_ktp'];
        $this->alamat_domisili = $data['alamat_domisili'];
        $this->no_hp = $data['no_hp'];
        $this->peran = $data['peran'];
        $this->foto_profil = $data['foto_profil'];
        $this->foto_ktp = $data['foto_ktp'];
    }
}