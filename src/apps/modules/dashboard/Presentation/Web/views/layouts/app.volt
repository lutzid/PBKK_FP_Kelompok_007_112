<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>TEMANRANTAU
		</title>

		<!-- Styles -->
		{#    <link href="{{ asset('css/app.css') }}" rel="stylesheet"> #}
		{{ assets.outputCss() }}
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
	{{ assets.outputJs() }}
</html>
