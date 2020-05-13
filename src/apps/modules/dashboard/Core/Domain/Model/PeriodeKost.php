<?php

namespace MyModel;

use MyModel\BaseModel;

class PeriodeKost extends BaseModel
{
    public $nama;

    public function initialize () {
        $this->setSource('periodekost');
    }

    public function registrasi($data)
    {
        $this->id = $data['id'];
        $this->nama = $data['nama'];
    }
}