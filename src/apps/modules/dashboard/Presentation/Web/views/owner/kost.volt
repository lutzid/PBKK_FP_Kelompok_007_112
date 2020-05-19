{% extends "layouts/app.volt" %}

{% block content %}
	<h1>My Property</h1>
	<div>
		<span>
			<form action="/dashboard/kost/destroy/{{ kost.id }}" method="POST" style="display: inline;">
				<button class="btn btn-danger" type="submit" style="padding: 0.05% 5%;">Delete</button>
			</form>
		</span>
		<span>
			<a class="btn btn-warning" href="/dashboard/kost/edit/{{ kost.id }}" style="padding: 0.05% 5%;">Update</a>
		</span>
	</div>
	<h2 class="myheader">
		{{ kost.nama }}
	</h2>
	<h4>
		{{ kost.alamat }}
	</h4>
	<div>
		<span style="color: white; background-color: #17A2B8; padding: 0.5% 5%; border-radius: 5px;">
			Available
		</span>
	</div>
	<div>
		<h4 style="color: white;">
			Facilities
		</h4>
		<div>
			{% for fasil in kost.kostfasilitaskost %}
				<span style="background-color: white; margin: 0.25%; padding: 0 1.25%; border-radius: 7.5px;">
					{{ fasil.fasilitaskost.nama }}
				</span>
			{% endfor %}
		</div>
	</div>
	<div>
		<span class="mytable">
			<ul class="mylist">
				{% for per in kost.kostperiodekost %}
					<li>
						{{ per.periodekost.nama }}
					</li>
				{% endfor %}
			</ul>
		</span>
	</div>
	<div class="row">
		<div class="card-deck col-md-4" style="margin-bottom: 2.5%;">
			<div class="card">
				<a href="/dashboard/kamar/create/{{ kost.id }}" style="color: black; text-decoration: none;">
					<div class="card-header" style="background-color: white; border-bottom: none;">
						<div class="mysquare text-center" style="padding: 10%; max-height: 20vh;">
							<span>
								<img src="{{ url('img/camera.png') }}" class="img-fluid" alt="camera" height="35%" width="35%">
							</span>
						</div>
					</div>
					<div class="card-body">
						<div class="text-center">
							<span>
								<a class="btn btn-warning" href="/dashboard/kamar/create/{{ kost.id }}">Add</a>
							</span>
						</div>
					</div>
				</a>
			</div>
		</div>
		{% for kamar in kost.kamar %}
			<div class="card-deck col-md-4" style="margin-bottom: 2.5%;">
				<div class="card">
					<div class="card-header" style="padding: 0">
						<img src="{{ url('img/kamar.png') }}" alt="" height="150vh" width="100%">
					</div>
					<div class="card-body" style="padding-top: 1%">
						<div style="text-align: right;">
							<span>
								<form action="/dashboard/kamar/destroy/{{ kamar.id }}" method="POST" style="display: inline;">
									<button class="btn btn-danger" type="submit" style="padding: 0.05% 5%;">Delete</button>
								</form>
							</span>
							<span>
								<a class="btn btn-warning" href="/dashboard/kamar/edit/{{ kamar.id }}" style="padding: 0.05% 5%;">Update</a>
							</span>
						</div>
						<h4 class="myheader">{{ kamar.nama }}</h4>
					</div>
				</div>
			</div>
		{% endfor %}
	</div>
{% endblock %}
