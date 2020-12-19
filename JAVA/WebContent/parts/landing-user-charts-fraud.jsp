<%@ page
  language="java"
  contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
</head>
<body class="container">
  <div class="card grey lighten-5">
    <div class="row indigo lighten-5">
      <div
        class="col s8 indigo-text"
        style="padding: 5px 10px;">
        <h6>Fraud details : Program wide</h6>
      </div>
      <div
        class="col s4 right-align"
        style="padding: 10px;">
        <button
          class="btn small-btn indigo"
          onclick="toggleContentChartsFraud()">Show details</button>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-fraud-div"
      style="display: none;">
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_bar_chart-fraud"></canvas>
          </div>
        </div>
      </div>
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_pie_chart-fraud"></canvas>
          </div>
        </div>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-fraud-div1"
      style="display: none;">
      <div class="col s12">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_line_chart-fraud"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
			new Chart(document.getElementById("canvas_bar_chart-fraud"), {
				type : 'bar',
				data : {
					labels : [ "Octobar", "November", "December" ],
					datasets : [ {
						label : "Fraud incidents",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f" ],
						data : [ 123, 143, 137 ]
					} ]
				},
				options : {
					legend : {
						display : false
					},
					title : {
						display : true,
						text : 'Fraud incidents (Current quarter)'
					}
				}
			});

			new Chart(document.getElementById("canvas_line_chart-fraud"), {
				type : 'line',
				data : {
					labels : [ 50, 100, 150, 200, 250, 300 ],
					datasets : [ {
						data : [ 86, 114, 106, 76, 87, 65 ],
						label : "Octobar",
						borderColor : "#e8c3b9",
						fill : false
					}, {
						data : [ 48, 79, 92, 98, 76, 56 ],
						label : "November",
						borderColor : "#c45850",
						fill : false
					}, {
						data : [ 68, 82, 73, 76, 45, 110 ],
						label : "December",
						borderColor : "#3cba9f",
						fill : false
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Fraud incidents trend (Current quarter)'
					}
				}
			});

			new Chart(document.getElementById("canvas_pie_chart-fraud"), {
				type : 'pie',
				data : {
					labels : [ "Online", "Credit card", "Debit card" ],
					datasets : [ {
						label : "Fraud incidents distribution",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f", ],
						data : [ 1433, 423, 899 ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Fraud incidents distribution (Current quarter)'
					}
				}
			});
		</script>
</body>
</html>