<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/header.jsp"%>
</head>
<body class="container">
<%@ include file="parts/loginHeader.jsp"%>
	<div class="section"></div>
	<main>
		<center>

			<h5 class="grey-text">Please, login into your account</h5>
			<div class="section"></div>

			<div class="container">
				<div class="z-depth-1 grey lighten-4 row"
					style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

					<form class="col s12" method="post" action="home">
						<div class='row'>
							<div class='col s12'></div>
						</div>

						<div class='row'>
							<div class='input-field col s12'>
								<input type='text' name='username' id='username' />
								<label for='username'>Enter your username</label>
							</div>
						</div>

						<div class='row'>
							<div class='input-field col s12'>
								<input type='password' name='password'
									id='password' /> <label for='password'>Enter your
									password</label>
							</div>
						</div>

						<br />
						<center>
							<div class='row'>
								<button type='submit' name='btn_login'
									class='col s12 btn btn-large waves-effect indigo'>Login</button>
							</div>
						</center>
					</form>
				</div>
			</div>
		</center>

		<div class="section"></div>
		<div class="section"></div>
	</main>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</body>
</html>