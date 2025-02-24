<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;

use Phalcon\Mvc\Controller;
use MyModel\User;

class HomeController extends BaseController
{
    //4. Melihat data akun miliknya sendiri
    public function profileAction($id){
        $user = User::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $this->view->user = $user;
    }

    public function editAction($id){
        $user = User::findFirst(
            [
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $id
                ]
            ]
        );

        $this->view->user = $user;
    }

    //5. Mengubah data akun miliknya sendiri
    public function updateAction($id)
    {
        if($this->request->isPost())
        {
            $user = User::findFirst(
                [
                    "conditions" => "id = :id:",
                    "bind" => [
                        "id" => $id
                    ]
                ]
            );
            $data = $_POST;
            $data['id'] = $id;
            $data['peran'] = $user->peran;
            $data['foto_profil'] = $user->foto_profil;
            $data['foto_ktp'] = $user->foto_ktp;
            if($user->password !== $data['password']){
                $data['password'] = $this->security->hash($data['password']);
            }
            $user->registrasi($data);
            if($user->save())
            {
                $this->flashSession->success("Profile Anda berhasil diperbarui.");
                return $this->response->redirect('profile');
            } else {
                $this->flashSession->error("Profile Anda tidak berhasil diperbarui.");
                return $this->response->redirect('profile');
            }
        }
    }

    //1. Melakukan pencarian indekos
    public function searchAction()
    {
        $kosts = $this->modelsManager
                    ->createBuilder()
                    ->from(Kost::class)
                    ->where('nama LIKE :search:', 
                        [
                            'search' => '%' . $search . '%',
                        ]
                    )
                    ->getQuery()
                    ->execute();
    }
}