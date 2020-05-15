<?php

namespace MyModel;

use MyModel\BaseModel;

class KostPeriodeKost extends BaseModel
{
    public $id_kost;
    public $id_periode_kost;

    public function initialize () {
        $this->setSource('kostperiodekost');

        $this->belongsTo(
            'id_kost',
            'MyModel\Kost',
            'id',
            [
                'alias' => 'Kost',
            ]
        );

        $this->belongsTo(
            'id_periode_kost',
            'MyModel\PeriodeKost',
            'id',
            [
                'alias' => 'PeriodeKost',
            ]
        );
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->id_kost = $data['id_kost'];
        $this->id_periode_kost = $data['id_periode_kost'];
    }
}