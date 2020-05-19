{% extends "layouts/app.volt" %}

{% block content %}
	<div class="row justify-content-center">
		<div class="col-md">
			<form method="POST" action="{{ url('/dashboard/kamar/update') }}" enctype="multipart/form-data">
				<div class="mysquare col-md text-center">
					<img src="" id="preview_kamar" width="80%"/>
					<span class="btn btn-file" id="def">
						<img src="{{ url('img/camera.png') }}" class="img-fluid" alt="camera">
						<input id="img_kamar" type="file" class="form-control" name="img_kamar">
					</span>
				</div>
				<br>
				<div class="card col-md-8 offset-md-2">
					<div class="card-body">
						<div class="form-group row">
							<label for="nama" class="col-md-4 offset-md-1 col-form-label text-md-left">Room Name</label>

							<div class="col-md-6">
								<input id="nama" type="text" class="form-control" name="nama" required autocomplete="nama" autofocus value="{{ kamar.nama }}">
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