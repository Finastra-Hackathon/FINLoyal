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
			<div class="col s8 indigo-text" style="padding: 5px 10px;">
				<h6>Bias details : Program wide</h6>
			</div>
			<div class="col s4 right-align" style="padding: 10px;">
				<button class="btn small-btn indigo"
					onclick="toggleContentChartsBias()">Show details</button>
			</div>
		</div>
		<div class="row" id="landing-user-charts-bias-div"
			style="display: none;">
			<div class="col s6">
				<div class="card">
					<div class="card-body">
						<canvas id="canvas_bar_chart-bias"></canvas>
					</div>
				</div>
			</div>
			<div class="col s6">
				<div class="card">
					<div class="card-body">
						<canvas id="canvas_pie_chart-bias"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="landing-user-charts-bias-div1"
			style="display: none;">
			<div class="col s12">
				<div class="card">
					<div class="card-body">
						<canvas id="canvas_line_chart-bias"></canvas>
					</div>
				</div>
			</div>
		</div>

	</div>


	<script>
		new Chart(document.getElementById("canvas_bar_chart-bias"), {
			type : 'bar',
			data : {
				labels : [ "Octobar", "November", "December" ],
				datasets : [ {
					label : "High bias incidents",
					backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f" ],
					data : [ 223, 213, 247 ]
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : 'High bias incidents (Current quarter)'
				}
			}
		});

		new Chart(document.getElementById("canvas_line_chart-bias"), {
			type : 'line',
			data : {
				labels : [ 50, 100, 150, 200, 250, 300 ],
				datasets : [ {
					data : [ 86, 114, 106,145,87,23 ],
					label : "Octobar",
					borderColor : "#e8c3b9",
					fill : false
				}, {
					data : [ 100, 79, 120,89,87,67 ],
					label : "November",
					borderColor : "#c45850",
					fill : false
				}, {
					data : [ 168, 170, 210,234,89,76,254 ],
					label : "December",
					borderColor : "#3cba9f",
					fill : false
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'High bias incidents trend (Current quarter)'
				}
			}
		});

		new Chart(document.getElementById("canvas_pie_chart-bias"), {
			type : 'pie',
			data : {
				labels : [ "Online", "Credit card", "Debit card" ],
				datasets : [ {
					label : "High bias incidents distribution",
					backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f", ],
					data : [ 1478, 5267, 734 ]
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'High bias incidents (Current quarter)'
				}
			}
		});
	</script>






</body>
</html>