<?php

namespace MyModel;

use Phalcon\Mvc\Model;

class BaseModel extends Model
{
    public $created_at;
    public function beforeCreate()
    {
        $this->created_at = date('Y-m-d h:i:sa');
    }
}