<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
</head>
<body class="container">
	<section id="user-signels-update">
		<div class="row indigo-text card grey lighten-4" style="padding: 7px 2px 7px 2px; border-radiur:50%;">
			<div class="col s6">
				<H6>Use the search box on the right to get details of a user.</H6>
			</div>
			<form class="col s6" method="post" action="SearchUser">
				<div class="col">
					<input type='text' name='user' id='user' />
				</div>
				<div class="col" style="padding: 10px 10px 10px 10px">
					<button type='submit' name='btn_login'
						class='btn btn-small waves-effect indigo'>Search user</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>