{% extends "layouts/app.volt" %}

{% block content %}
    <div class="row d-flex justify-content-center">
        <div class="col-md-4">
            <div>
            {#
                <img src="{{ url('profil_user').'/'. auth()->user()->foto_profil }}" class="img-fluid " alt="user">
            #}
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Username
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.username }}
        </span>
    </div>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Password
        </span>
        <span class="col-md-2 offset-md-1">
            ********
        </span>
    </div>
    <br>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Name
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.nama }}
        </span>
    </div>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            NIK
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.nik }}
        </span>
    </div>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Address
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.alamat_ktp }}
        </span>
    </div>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Domicile Address
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.alamat_domisili }}
        </span>
    </div>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Phone Number
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.no_hp }}
        </span>
    </div>
    <div class="row">
        <span class="col-md-1 offset-md-3">
            Email
        </span>
        <span class="col-md-2 offset-md-1">
            {{ user.email }}
        </span>
    </div>
    <br>
    <div class="row">
        <div class="col-md-2 offset-md-5">
            <a href="/dashboard/home/edit/{{ session.get('auth').id }}" class="btn btn-danger">Edit</a>
        </div>
    </div>
    <br>
{% endblock %}