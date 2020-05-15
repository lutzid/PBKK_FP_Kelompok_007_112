<?php

namespace MyModel;

use MyModel\BaseModel;

class KostFasilitasKost extends BaseModel
{
    public $id_kost;
    public $id_fasilitas_kost;

    public function initialize () {
        $this->setSource('kostfasilitaskost');

        $this->belongsTo(
            'id_kost',
            'MyModel\Kost',
            'id',
            [
                'alias' => 'Kost',
            ]
        );

        $this->belongsTo(
            'id_fasilitas_kost',
            'MyModel\FasilitasKost',
            'id',
            [
                'alias' => 'FasilitasKost',
            ]
        );
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->id_kost = $data['id_kost'];
        $this->id_fasilitas_kost = $data['id_fasilitas_kost'];
    }
}