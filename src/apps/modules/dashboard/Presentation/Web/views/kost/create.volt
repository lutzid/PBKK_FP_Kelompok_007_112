{% extends "layouts/app.volt" %}

{% block content %}
	<div class="row justify-content-center">
		<div class="col-md">
			<form method="POST" action="{{ url('/dashboard/kost/store') }}" enctype="multipart/form-data">
				<div class="mysquare col-md text-center">
					<img src="" id="preview_kost" width="80%"/>
					<span class="btn btn-file" id="def">
						<img src="{{ url('img/camera.png') }}" class="img-fluid" alt="camera">
						<input id="img_kost" type="file" class="form-control" name="img_kost">
					</span>
				</div>
				<br>
				<div class="card col-md-8 offset-md-2">
					<div class="card-body">
						<div class="form-group row">
							<label for="nama" class="col-md-4 offset-md-1 col-form-label text-md-left">Boarding House Name</label>

							<div class="col-md-6">
								<input id="nama" type="text" class="form-control" name="nama" required autocomplete="nama" autofocus>
							</div>
						</div>

						<div class="form-group row">
							<label for="alamat" class="col-md-4 offset-md-1 col-form-label text-md-left">Address</label>

							<div class="col-md-6">
								<input id="alamat" type="text" class="form-control" name="alamat" required autocomplete="alamat" autofocus>
							</div>
						</div>

						<div class="form-group row">
							<label for="fasilitas" class="col-md-4 offset-md-1 col-form-label text-md-left">Facilities</label>

							<div class="col-md-6">
								{% for fasil in fasilitas %}
									<div>
										<input type="checkbox" name="fasilitas[]" value="{{ fasil.id }}">
										<label>{{ fasil.nama }}</label>
									</div>
								{% endfor %}
							</div>
						</div>

						<div class="form-group row">
							<label for="periode" class="col-md-4 offset-md-1 col-form-label text-md-left">Periode</label>

							<div class="col-md-6">
								{% for per in periode %}
									<div>
										<input type="checkbox" name="periode[]" value="{{ per.id }}">
										<label>{{ per.nama }}</label>
									</div>
								{% endfor %}
							</div>
						</div>

						<div class="form-group row mb-0">
							<div class="col-md-2 offset-md-5">
								<button type="submit" class="btn btn-primary" id="sub_button">
									Save
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
{% endblock %}
