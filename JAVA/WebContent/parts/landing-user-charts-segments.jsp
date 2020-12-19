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
        <h6>Loyalty point details : Segments</h6>
      </div>
      <div
        class="col s4 right-align"
        style="padding: 10px;">
        <button
          class="btn small-btn indigo"
          onclick="toggleContentChartsSeg()">Show details</button>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-seg-div"
      style="display: none;">
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_bar_chart-seg"></canvas>
          </div>
        </div>
      </div>
      <div class="col s6">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_pie_chart-seg"></canvas>
          </div>
        </div>
      </div>
    </div>
    <div
      class="row"
      id="landing-user-charts-seg-div1"
      style="display: none;">
      <div class="col s12">
        <div class="card">
          <div class="card-body">
            <canvas id="canvas_line_chart-seg"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
			new Chart(document.getElementById("canvas_bar_chart-seg"), {
				type : 'bar',
				data : {
					labels : [ "Gold", "Silver", "Platinum" ],
					datasets : [ {
						label : "Loyalty points",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f" ],
						data : [ 14120, 13432, 12996 ]
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

			new Chart(document.getElementById("canvas_line_chart-seg"), {
				type : 'line',
				data : {
					labels : [ 50, 100, 150, 200, 250, 300 ],
					datasets : [ {
						data : [ 86, 114, 106,34,123,45 ],
						label : "Gold",
						borderColor : "#e8c3b9",
						fill : false
					}, {
						data : [ 100, 79, 120, 124, 130, 145 ],
						label : "Silver",
						borderColor : "#c45850",
						fill : false
					}, {
						data : [ 50, 110, 180, 182, 186, 188 ],
						label : "Platinum",
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

			new Chart(document.getElementById("canvas_pie_chart-seg"), {
				type : 'pie',
				data : {
					labels : [ "Gold", "Silver", "Platinum" ],
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