<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use Phalcon\Security\Random;
use MyModel\Kost;
use MyModel\User;

class BaseController extends Controller
{
    public function onConstruct()
    {
        $this->assets->addCss('https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css');
        $this->assets->addCss('css/style.css');
        $this->assets->addJs('https://code.jquery.com/jquery-3.4.1.min.js');
        $this->assets->addJs('https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js');
        $this->assets->addJs('js/jquery.number.min.js');
        $this->assets->addJs('js/app.js');
    }


}