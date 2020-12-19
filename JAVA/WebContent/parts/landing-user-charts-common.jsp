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
        <h6>Loyalty point details : Program wide</h6>
      </div>
      <div
        class="col s4 right-align"
        style="padding: 10px;">
        <button
          class="btn small-btn indigo"
          onclick="toggleContentChartsCommon()">Show details</button>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-common-div"
      style="display: none;">
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_bar_chart"></canvas>
          </div>
        </div>
      </div>
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_pie_chart"></canvas>
          </div>
        </div>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-common-div1"
      style="display: none;">
      <div class="col s12">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_line_chart"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
			new Chart(document.getElementById("canvas_bar_chart"), {
				type : 'bar',
				data : {
					labels : [ "Octobar", "November", "December" ],
					datasets : [ {
						label : "Loyalty points",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f" ],
						data : [ 14120, 12432, 15456 ]
					} ]
				},
				options : {
					legend : {
						display : false
					},
					title : {
						display : true,
						text : 'Loyalty points (Current quarter)'
					}
				}
			});

			new Chart(document.getElementById("canvas_line_chart"), {
				type : 'line',
				data : {
					labels : [ 50, 100, 150, 200, 250, 300 ],
					datasets : [ {
						data : [ 86, 114, 106, 200, 34, 56 ],
						label : "Octobar",
						borderColor : "#e8c3b9",
						fill : false
					}, {
						data : [ 100, 79, 120, 76, 98, 110 ],
						label : "November",
						borderColor : "#c45850",
						fill : false
					}, {
						data : [ 168, 170, 210, 204, 87, 12 ],
						label : "December",
						borderColor : "#3cba9f",
						fill : false
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Loyalty points trend (Current quarter)'
					}
				}
			});

			new Chart(document.getElementById("canvas_pie_chart"), {
				type : 'pie',
				data : {
					labels : [ "Online", "Credit card", "Debit card" ],
					datasets : [ {
						label : "Loyality point distribution",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f", ],
						data : [ 2978, 3100, 934 ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Loyality point distribution (Current quarter)'
					}
				}
			});
		</script>
</body>
</html>