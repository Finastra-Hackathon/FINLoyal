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
        <h6>Loyalty point details : All geographies</h6>
      </div>
      <div
        class="col s4 right-align"
        style="padding: 10px;">
        <button
          class="btn small-btn indigo"
          onclick="toggleContentChartsGeo()">Show details</button>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-geo-div"
      style="display: none;">
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_bar_chart-geo"></canvas>
          </div>
        </div>
      </div>
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_pie_chart-geo"></canvas>
          </div>
        </div>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-geo-div1"
      style="display: none;">
      <div class="col s12">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_line_chart-geo"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
			new Chart(document.getElementById("canvas_bar_chart-geo"), {
				type : 'bar',
				data : {
					labels : [ "Americas", "Europe", "Asia" ],
					datasets : [ {
						label : "Loyalty points",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f" ],
						data : [ 14120, 13456, 15456 ]
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

			new Chart(document.getElementById("canvas_line_chart-geo"), {
				type : 'line',
				data : {
					labels : [ 50, 100, 150, 200, 250, 300 ],
					datasets : [ {
						data : [ 86, 114, 106, 83, 65, 134 ],
						label : "Americas",
						borderColor : "#e8c3b9",
						fill : false
					}, {
						data : [ 100, 89, 120, 134, 95, 156 ],
						label : "Europe",
						borderColor : "#c45850",
						fill : false
					}, {
						data : [ 168, 170, 188, 145, 210, 225 ],
						label : "Asia",
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

			new Chart(document.getElementById("canvas_pie_chart-geo"), {
				type : 'pie',
				data : {
					labels : [ "Americas", "Europe", "Asia" ],
					datasets : [ {
						label : "Loyality point distribution",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f", ],
						data : [ 2478, 5267, 734 ]
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