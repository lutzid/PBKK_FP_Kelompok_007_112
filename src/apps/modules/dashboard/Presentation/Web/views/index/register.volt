{% extends "layouts/app.volt" %}

{% block title %}
	Welcome
{% endblock %}

{% block content %}
		<div class="row justify-content-center text-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						{% if messages is defined %}
							{% for message in messages %}
								<div class="alert alert-danger" role="alert">
									{{ message }}
								</div>
							{% endfor %}
						{% endif %}
						{% if flashSession.has('error') %}
							<div class="alert alert-danger" role="alert">
								{{ flashSession.output() }}
							</div>
						{% endif %}
						<form method="POST" action="{{ url('/dashboard/index/store') }}" enctype="multipart/form-data">
							<label for="foto_profil">Foto Profil</label>
							<img src="" id="preview_profil" width="80%"/>
							<div class="mycircle col-md-8 offset-md-2 mb-4">
								<span class="btn btn-file">
									<img src="{{ url('img/camera.png') }}" class="img-fluid" alt="camera" id="temp_profile">
									<input id="foto_profil" type="file" class="form-control" name="foto_profil">
								</span>
							</div>
							<div style="height: 20px;"></div>
							<label for="foto_ktp">Foto KTP</label>
							<img src="" id="preview_ktp" width="80%"/>
							<div class="mycircle col-md-8 offset-md-2 mb-4">
								<span class="btn btn-file">
									<img src="{{ url('img/camera.png') }}" class="img-fluid" alt="camera" id="temp_ktp">
									<input id="foto_ktp" type="file" class="form-control" name="foto_ktp">
								</span>
							</div>
							<div style="height: 20px;"></div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="email" type="email" class="form-control" name="email" required autocomplete="email" autofocus placeholder="example@mail.com">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="password" type="password" class="form-control" name="password" required autocomplete="current-password" placeholder="password">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="cpassword" type="password" class="form-control" name="cpassword" required placeholder="confirm password">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="username" type="text" class="form-control" name="username" required placeholder="username">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="nama" type="text" class="form-control" name="nama" required placeholder="Nama Lengkap">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="NIK" type="text" class="form-control" name="nik" required placeholder="NIK 16 digit">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="alamat_ktp" type="text" class="form-control" name="alamat_ktp" required placeholder="Alamat KTP">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="alamat_domisili" type="text" class="form-control" name="alamat_domisili" required placeholder="Alamat Domisili">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-10 offset-md-1">
									<input id="no_hp" type="text" class="form-control" name="no_hp" required placeholder="Nomor Telepon">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6 offset-md-1">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="remember" id="remember">

										<label class="form-check-label" for="remember">
											Remember Me
										</label>
									</div>
								</div>
								<div class="col-md-4">
									<button type="submit" class="btn btn-primary">
										Register
									</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row justify-content-center text-center">
			<a href="{{ url('/dashboard/authentication/login') }}">
				<button type="submit" class="btn btn-danger">
					Login
				</button>
			</a>
		</div>
		<br>
{% endblock %}
