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
			Email
		</span>
		<span class="col-md-2 offset-md-1">
			{{ user.email }}
		</span>
	</div>
	<form method="POST" action="{{ url('/dashboard/home/update') }}">

		<div class="row">
			<span class="col-md-1 offset-md-3">
				Username
			</span>
			<span class="col-md-2 offset-md-1">
				<input id="username" type="text" class="form-control" name="username" required value="{{ user.username }}">
			</span>
		</div>
		<div class="row">
			<span class="col-md-1 offset-md-3">
				Password
			</span>
			<span class="col-md-2 offset-md-1">
				<input id="password" type="password" class="form-control" name="password" required autocomplete="current-password" value="{{ user.password }}">
			</span>
		</div>
		<br>
		<div class="row">
			<span class="col-md-1 offset-md-3">
				Address
			</span>
			<span class="col-md-2 offset-md-1">
				<input id="alamat_ktp" type="text" class="form-control" name="alamat_ktp" required value="{{ user.alamat_ktp }}">
			</span>
		</div>
		<div class="row">
			<span class="col-md-1 offset-md-3">
				Phone Number
			</span>
			<span class="col-md-2 offset-md-1">
				<input id="no_hp" type="text" class="form-control" name="no_hp" required value="{{ user.no_hp }}">
			</span>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2 offset-md-5">
				<button type="submit" class="btn btn-primary">
					Register
				</button>
			</div>
		</div>
	</form>
{% endblock %}
