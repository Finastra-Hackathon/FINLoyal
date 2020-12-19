<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
</head>
<body class="container">




<main>

		<center>
			<div class="container">
				<div class="z-depth-1 grey lighten-4 row"
					style="display: inline-block; padding: 5px 15px 0px 15px; border: 1px solid #EEE;">

					<form class="col" method="post" action="SearchUser">
						<div class='row'>
							<div class=''></div>
						</div>
						<div class='row'>
							<div class='lighten-2 indigo-text'>
								Enter user's name
							</div>
						</div>
						<div class='row'>
							<div class='input-field'>
								<input type='text' name='user' id='user' />
							</div>
						</div>
						<br />
						<center>
							<div class='row'>
								<button type='submit' name='btn_login'
									class='btn btn-small waves-effect indigo'>Search user</button>
							</div>
						</center>
					</form>
				</div>
			</div>
		</center>

		<div class="section"></div>
		<div class="section"></div>
	</main>

</body>
</html>