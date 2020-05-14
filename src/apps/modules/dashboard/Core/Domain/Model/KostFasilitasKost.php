<?php

namespace MyModel;

use MyModel\BaseModel;

class KostFasilitasKost extends BaseModel
{
    public $id_kost;
    public $id_fasilitas_kost;

    public function initialize () {
        $this->setSource('kostfasilitaskost');
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->id_kost = $data['id_kost'];
        $this->id_fasilitas_kost = $data['id_fasilitas_kost'];
    }
}