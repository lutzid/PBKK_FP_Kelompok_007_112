{% extends "layouts/app.volt" %}

{% block content %}
    <form action="{{ url('/dashboard/booking/store/' ~ kamar.id) }}" method="post">

    <div class="row my-1">
        <div class="col-md-3">
            <p>Pesanan</p>
            <h2>{{ kamar.kost.nama }}</h2>
            <h3>{{ kamar.kost.alamat }}</h3>
            <h5>{{ kamar.nama }}</h5>
        </div>
        <div class="col-md-2">
            <p>Price</p>
            <p>Rp. {{ kamar.harga }}/month</p>
            <input type="hidden" id="price" value="{{ kamar.harga }}">
        </div>
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-3">
                    <p>Payment</p>
                    <select class="form-control" id="num" name="num" required>
                    </select>
                </div>
                <div class="col-md-3">
                    <p>Periode</p>
                    <select class="form-control" id="per" name="per" required>
                        {% for per in kost.kostperiodekost %}
                            <option value="{{ per.periodekost.id }}">{{ per.periodekost.nama }}</option>
                        {% endfor %}
                    </select>
                </div>
                <div class="col-md-6">
                    <p>Start Boarding</p>
                    <input type="date" name="start_boarding" id="start_boarding" class="form-control" required>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <p>Sub Total</p>
            <input type="text" name="sub_total" id="sub_total" class="form-control" value="" readonly required>
        </div>
    </div>
    <div class="row my-1">
        <div class="col-md-12 mt-2">
            <div class="card px-4" style="border-radius: 20px; background-color: #FFD60A;">
                <div class="card-body row">
                    <p class="h5 text-white">Metode Pembayaran</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row float-right my-1">
        <table style="border: none;" class="table">
            <tr>
                <td>Admin</td>
                <td>
                    Rp <input type="text" name="admin" id="admin" value="" readonly style="border: none;" required>
                </td>
            </tr>
            <tr>
                <td>Total</td>
                <td>
                    Rp <input type="text" name="total" id="total" value="" readonly style="border: none;" required>
                </td>
            </tr>
        </table>
        <button type="submit" class="btn btn-info">Confirm Payment</button>
    </div>

    </form>

{% endblock %}