<?php

namespace MyModel;

use MyModel\BaseModel;
use Phalcon\Mvc\Model\Relation;

class Kost extends BaseModel
{
    public $id_user;
    public $nama; 
    public $jumlah_transaksi;
    public $alamat; 

    public function initialize () {
        $this->setSource('kost');

        $this->belongsTo(
            'id_user',
            'MyModel\User',
            'id',
            [
                'alias' => 'User',
            ]
        );

        $this->hasMany(
            'id',
            'MyModel\Kamar',
            'id_kost',
            [
                'alias' => 'Kamar',
                'foreignKey' => [
                    'action' => Relation::ACTION_CASCADE,
                ],
            ]
        );

        $this->hasMany(
            'id',
            'MyModel\KostFasilitasKost',
            'id_kost',
            [
                'alias' => 'KostFasilitasKost',
                'foreignKey' => [
                    'action' => Relation::ACTION_CASCADE,
                ],
            ]
        );

        $this->hasMany(
            'id',
            'MyModel\KostPeriodeKost',
            'id_kost',
            [
                'alias' => 'KostPeriodeKost',
                'foreignKey' => [
                    'action' => Relation::ACTION_CASCADE,
                ],
            ]
        );
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