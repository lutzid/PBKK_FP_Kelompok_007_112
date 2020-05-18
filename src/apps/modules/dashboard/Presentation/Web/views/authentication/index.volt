{% extends "layouts/app.volt" %}

{% block title %}
	Welcome
{% endblock %}

{% block content %}
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<img src="{{ url('img/user.png') }}" class="img-fluid" alt="user">
						<div style="height: 20px;"></div>
						{% if flashSession.has('error') %}
							<div class="alert alert-danger" role="alert">
								{{ flashSession.output() }}
							</div>
						{% endif %}
						<form method="POST" action="{{ url('/dashboard/authentication/login') }}">
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
										Login
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
			<a href="{{ url('/dashboard/home/register') }}">
				<button type="submit" class="btn btn-danger">
					Register
				</button>
			</a>
		</div>
		<br>
	</div>
{% endblock %}
