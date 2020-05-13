<?php

namespace MyModel;

use MyModel\BaseModel;

class FasilitasKost extends BaseModel
{
    public $nama;

    public function initialize () {
        $this->setSource('fasilitaskost');
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->nama = $data['nama'];
    }
}