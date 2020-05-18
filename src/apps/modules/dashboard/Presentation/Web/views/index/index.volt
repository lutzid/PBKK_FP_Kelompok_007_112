{% extends "layouts/app.volt" %}

{% block content %}
{#
    <div class="container">
        <form method="GET" action="{{ route('kost.search') }}">
            <div class="row">
                <div class="col-md-9 offset-md-1" style="padding: 0px;">
                    <input class="form-control" name="search" type="search" placeholder="Search Boarding House" aria-label="Search">
                </div>
                <span class="col-md-2" style="padding: 0px;">
                    {{-- habis pencet tombol search redirect ke /search_result terus ditampilkan hasilnya --}}
                    <button class="btn btn-primary" type="submit" style="width: 50%;">
                        <img src="{{ url('img/search.png') }}" alt="search" height="20vh">
                    </button>
                </span>
            </div>
            <div class="row">
                <div class="col-md offset-md-1" style="padding: 0px;">
                    <label for="start_date">Date: </label>
                    <input type="date" name="start_date" id="start_date">
                    <label for="end_date">until </label>
                    <input type="date" name="end_date" id="end_date">
                </div>
            </div>
            <div class="row">
                <div class="col-md offset-md-1" style="padding: 0px;">
                    <div class="h4">
                        Facilities
                    </div>
                    @foreach ($fasilitas as $fas)
                        <div>
                            <input type="checkbox" name="fasilitas[]" value="{{$fas->id}}"> <label>{{$fas->nama}}</label>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="row">
                <div class="col-md offset-md-1" style="padding: 0px;">
                    <div class="h4">
                        Payment
                    </div>
                    @foreach ($periode as $per)
                        <div>
                            <input type="checkbox" name="periode[]" value="{{$per->id}}"> <label>{{$per->nama}}</label>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="row">
                <div class="col-md offset-md-1" style="padding: 0px;">
                    <div class="h4">
                        Price
                    </div>
                    <label for="min_price">Start from :</label>
                    <input type="number" name="min_price" id="min_price">
                    <label for="max_price">Max Price :</label>
                    <input type="number" name="max_price" id="max_price">
                </div>
            </div>
            <div class="row">
                <div class="col-md offset-md-1" style="padding: 0px;">
                    <div class="h4">
                        Distance
                    </div>
                    <label for="min_dist">Start from :</label>
                    <input type="number" name="min_dist" id="min_dist">
                    <label for="max_dist">Max Distance :</label>
                    <input type="number" name="max_dist" id="max_dist">
                </div>
            </div>
        </form>
    </div>
#}
        <div class="row justify-content-center">
            <div class="col-md-11 offset-md-1">
            {#
                <a href="{{ route('kost.popular') }}" style="color: black; text-decoration: none;">
                    <h2 class="myheader">MOST POPULAR BOARDING HOUSE</h2>
                </a>
            #}
                <h2 class="myheader">BOARDING HOUSES</h2>
                <div class="row">
                {#
                    @foreach ($kosts as $kost)
                #}
                {% for kost in kosts %}
                    <div class="card-deck col-md-4" style="margin-bottom: 2.5%;">
                        <a href="/dashboard/kost/show/{{ kost.id }}" style="color: black; text-decoration: none;">
                            <div class="card">
                                <div class="card-header p-0">
                					{{ image(url('img/kost.png'), "width":"100%", "height":"150vh") }}
                                </div>
                                <div class="card-body" style="padding-top: 1%">
                                    <div style="text-align: right;">
                                        <span style="color: white; background-color: #17A2B8; padding: 0.5% 5%; border-radius: 5px;">
                                            Available
                                        </span>
                                    </div>
                                    <h4 class="myheader">{{ kost.nama }}</h4>
                                    <div>
                                        {{ kost.alamat }}
                                    </div>
                                    <div>
                                        1 room available
                                    </div>
                                </div>
                            </div>
                        {#
                        </a>
                        #}
                    </div>
                {% endfor %}
                {#
                    @endforeach
                #}
                </div>
            </div>
        </div>
{% endblock %}