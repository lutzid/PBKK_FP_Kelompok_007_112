<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>TEMANRANTAU
		</title>

		<!-- Styles -->
		{#    <link href="{{ asset('css/app.css') }}" rel="stylesheet"> #}
		<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<style>
			@font-face {
				font-family: 'Segoe UI Regular';
				font-style: normal;
				font-weight: normal;
				src: local('Segoe UI Regular'), url('/fonts/Segoe UI.woff') format('woff');
			}
			@font-face {
				font-family: 'Segoe UI Italic';
				font-style: normal;
				font-weight: normal;
				src: local('Segoe UI Italic'), url('/fonts/Segoe UI Italic.woff') format('woff');
			}
			@font-face {
				font-family: 'Segoe UI Bold';
				font-style: normal;
				font-weight: normal;
				src: local('Segoe UI Bold'), url('/fonts/Segoe UI Bold.woff') format('woff');
			}
			@font-face {
				font-family: 'Segoe UI Bold Italic';
				font-style: normal;
				font-weight: normal;
				src: local('Segoe UI Bold Italic'), url('/fonts/Segoe UI Bold Italic.woff') format('woff');
			}
			body {
				font-family: 'Segoe UI Regular';
			}
			.mybg {
				object-fit: none;
				object-position: center;
				width: 100%;
				max-height: 60vh;
				margin-bottom: 1rem;
			}
			.mybrand {
				font-family: 'Segoe UI Bold';
				font-weight: bold;
				font-size: xx-large;
				color: #FFC107 !important;
				padding: 0;
			}
			.myheader {
				font-family: 'Segoe UI Bold';
			}
			.btn-file {
				position: relative;
				overflow: hidden;
				border: none;
				background: none;
			}
			.btn-file input[type=file] {
				position: absolute;
				top: 0;
				right: 0;
				min-width: 100%;
				min-height: 100%;
				font-size: 100px;
				text-align: right;
				filter: alpha(opacity=0);
				opacity: 0;
				outline: none;
				cursor: inherit;
				display: block;
			}
			.mycircle {
				padding: 15% 0;
				background-color: white;
				border-radius: 100%;
				height: 100%;
				width: 100%;
			}
			.mysquare {
				padding: 15% 0;
				background-color: white;
				border-style: solid;
				border-width: 0.75px;
				height: 50%;
				width: auto;
			}
			.mytab {
				background-color: #F8F9FA;
			}
			.mytab .nav-link {
				color: black;
				text-decoration: none;
			}
			.myfooter {
				bottom: 0;
				width: 100%;
				/* position: fixed; */
				background-color: #F8F9FA;
				height: 5%;
			}
			.mytable {
				display: table;
			}
			.mylist {
				list-style-type: none;
				padding-left: 0;
			}
			.mylist li {
				display: inline;
			}
			.mylist li::before {
				content: "\29BF";
				color: white;
				font-weight: bolder;
				display: inline-block;
			}
		</style>

	</head>
	<body>
		<div id="app">
			<nav class="navbar fixed-top navbar-expand-md navbar-dark shadow-sm" style="background-color: #6C757D; padding: 2px; min-height: 9vh;">
				<div class="container">
					<a class="navbar-brand mybrand" href="{{ url('/') }}">
						<img src="{{ url('img/logo.png') }}" alt="temanrantau" height="45vh">
						TEMANRANTAU.COM
					</a>
					<div
						class="collapse navbar-collapse" id="navbarSupportedContent">
						<!-- Left Side Of Navbar -->
						<ul class="navbar-nav mr-auto"></ul>

						<!-- Right Side Of Navbar -->
						<ul
							class="navbar-nav ml-auto">

							<!-- Authentication Links -->
							{% if session.has('auth') %}
								{% if session.get('auth').peran == "Perantau" %}
									<li class="nav-item">
										{{ link_to('dashboard/owner/kost', 'MY KOST', 'class':'nav-link', 'style':'color: white; font-weight: bold;') }}
									</li>
								{% elseif session.get('auth').peran == "Pemilik" %}
									<li class="nav-item">
										{{ link_to('dashboard/owner/kost', 'MY PROPERTY', 'class':'nav-link', 'style':'color: white; font-weight: bold;') }}
									</li>
								{% endif %}
								<li class="nav-item dropdown">
									<a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
										{{ session.get('auth').nama }}
										<span class="caret"></span>
									</a>

									<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="/dashboard/home/profile/{{ session.get('auth').id }}">
											Profile
										</a>
										<a class="dropdown-item" href="{{ url('/dashboard/authentication/logout') }}" onclick="event.preventDefault();
																																				                                                                                                    document.getElementById('logout-form').submit();">
											Logout
										</a>

										<form id="logout-form" action="{{ url('/dashboard/authentication/logout') }}" method="POST" style="display: none;"></form>
									</div>
								</li>
							{% else %}
								<li class="nav-item">
									{{ link_to('dashboard/index/register', 'REGISTER', 'class':'nav-link', 'style':'color: white; font-weight: bold;') }}
								</li>
								<li class="nav-item">
									{{ link_to('dashboard/authentication/index', 'LOGIN', 'class':'nav-link', 'style':'color: white; font-weight: bold;') }}
								</li>
							{% endif %}
						</ul>
					</div>
				</div>
			</nav>
			<div style="min-height: 9vh;"></div>
			<main class="py-4" style=" min-height: 100vh; background-color: #FBC94C;">
				<div class="container">
					{% if flashSession.has('error') %}
						<div class="alert alert-danger" role="alert">
							{{ flashSession.output() }}
						</div>
					{% endif %}
					{% block content %}{% endblock %}
				</div>

			</main>
			<nav class="myfooter navbar navbar-light bg-light">
				<div class="container">
					<ul class="navbar-nav mr-auto">
						<li class="nav-ite#FBC94Cm">
							temanrantau-dev
						</li>
					</ul>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							Zidan Lutfi | Pristi Zahara
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</body>
	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script>
		function readKTP(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#preview_ktp').attr('src', e.target.result);
$('#temp_ktp').prop('hidden', true);
}
reader.readAsDataURL(input.files[0]);
}
}
$("#foto_ktp").change(function () {
readKTP(this);
});

function readProfil(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#preview_profil').attr('src', e.target.result);
$('#temp_profil').prop('hidden', true);
}
reader.readAsDataURL(input.files[0]);
}
}
$("#foto_profil").change(function () {
readProfil(this);
});
function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#preview_kost').attr('src', e.target.result);
$('#def').prop('hidden', true);
}
reader.readAsDataURL(input.files[0]);
}
}
$("#img_kost").change(function () {
readURL(this);
});
function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#preview_kamar').attr('src', e.target.result);
$('#def').prop('hidden', true);
}
reader.readAsDataURL(input.files[0]);
}
}
$("#img_kamar").change(function () {
readURL(this);
});
	</script>
</html>
