<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
</head>
<body class="container">
	<div class="card grey lighten-5">
		<div class="row indigo lighten-5">
			<div class="col s12 indigo-text">
				<h6>Top users (current quarter)</h6>
			</div>
		</div>
		<div class="row indigo-text">
			<table class="highlight centered responsive-table">
				<thead>
					<tr>
						<th>User name</th>
						<th>Points earned</th>
						<th>Suspected fraud(?)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="user-jane.jsp" class="indigo-text">Jane
								Hoffmann</a></td>
						<td>22</td>
						<td class="red-text">Yes</td>
					</tr>
					<tr>
						<td><a href="user-thomas.jsp" class="indigo-text">Thomas
								Crane</a></td>
						<td>20</td>
						<td class="red-text">Yes</td>
					</tr>
					<tr>
						<td><a href="user-robert.jsp" class="indigo-text">Robert
								Boyle</a></td>
						<td>15</td>
						<td class="green-text">No</td>
					</tr>
					<tr>
						<td><a href="user-linda.jsp" class="indigo-text">Linda
								Hamilton</a></td>
						<td>12</td>
						<td class="green-text">No</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>