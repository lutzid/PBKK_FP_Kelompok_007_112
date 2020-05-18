{% extends "layouts/app.volt" %}

{% block content %}
	<div class="row justify-content-center">
		<div
			class="col-md-4 text-center">{#
								                <img src="{{ url('img_kost').'/'. $kost->fotoKost[0]->nama}}" alt="" height=auto width="100%">
								                #}
		</div>
		<div class="col-md-8">
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
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-9 offset-md-1">
			<div class="card" style="border-radius: 20px;">
                {% for kamar in kost.kamar %}
				<div class="card-body row">
					<div class="col-md-4">
                        {#
						    <img src="{{ url('img_kamar').'/'. $kamar->fotoKamar[0]->nama}}" alt="" width="100%" style="max-height: 20vh;">
                        #}
					</div>
					<div class="col-md-8">
						<h2 class="myheader">
							{{ kamar.nama }}
						</h2>
						<br>
						<h3>
							Rp.
							{{ kamar.harga }}
							/month
						</h3>
                        {% if kamar.status == "Available" %}
						<a href="/dashboard/kamar/book/{{ kamar.id }}" class="btn btn-warning">Book Now</a>
                        {% else %}
						<p class="btn btn-danger">Booked</p>
                        {% endif %}
					</div>
				</div>
                {% endfor %}
			</div>
		</div>
	</div>
{% endblock %}
