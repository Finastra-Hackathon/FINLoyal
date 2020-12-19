<%@ page
  language="java"
  contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/header.jsp"%>
<style>
.switch label input[type=checkbox]:checked+.lever {
	background-color: #fa3;
}

.switch label input[type=checkbox]:checked+.lever:after {
	background-color: #f93;
}
</style>
<script>
	gender_score_data = [ 42, 23, 63, 24 ];
	income_score_data = [ 17, 23, 63, -24 ];
	demo_score_data = [ 42, 23, 63, 24 ];
	age_score_data = [ 42, 23, 63, -24 ];
	size_score_data = [ 42, 23, 63, 24 ];
	emp_score_data = [ 42, 23, 63, 24 ];

	signals_text_data = [ "<p>Abnormal transaction volume or frequency.</p>",
			"<p>Abnormal prior recalibration.</p>",
			"<p>Abnormal transaction volume or frequency.</p>",
			"<p>Abnormal prior recalibration.</p>" ];

	threshold_data = [ 25, 16, 17, 18, 19, 20 ];
	range_date = [ 20, 5, 6, 7, 4, 8 ];

	window
			.addEventListener(
					'load',
					function() {
						console.log("Page loaded!")

						setCardInfo(age_score_data[0], threshold_data[0],
								range_date[0], 'age-score-text', 'age-score');
						setCardInfo(income_score_data[0], threshold_data[1],
								range_date[1], 'income-score-text',
								'income-score');
						setCardInfo(gender_score_data[0], threshold_data[2],
								range_date[2], 'gender-score-text',
								'gender-score');
						setCardInfo(demo_score_data[0], threshold_data[3],
								range_date[3], 'demo-score-text', 'demo-score');
						setCardInfo(size_score_data[0], threshold_data[4],
								range_date[4], 'size-score-text', 'size-score');
						setCardInfo(emp_score_data[0], threshold_data[5],
								range_date[5], 'emp-score-text', 'emp-score');

						var fraudIdentifier = document.getElementById(
								'trans-table').getElementsByTagName('tr')[1]
								.getElementsByTagName('td')[2].textContent

						document.getElementById('current_points').textContent = document
								.getElementById('trans-table')
								.getElementsByTagName('tr')[1]
								.getElementsByTagName('td')[1].textContent

						var ageScoreTextEle = document
								.getElementById('age-score-text')
						var singalText = document.getElementById('signals')

						if (fraudIdentifier.toLowerCase() === 'yes') {
							singalText.innerHTML = signals_text_data[0]
						}

						if (fraudIdentifier.toLowerCase() === 'no') {
							singalText.innerHTML = "<ul><li>There are no fraud signals detected.</li></ul>"
						}

						document.getElementById('age-score-range').textContent = (threshold_data[0] - range_date[0])
								+ ' - ' + (threshold_data[0] + range_date[0])
						document.getElementById('income-score-range').textContent = (threshold_data[1] - range_date[1])
								+ ' - ' + (threshold_data[1] + range_date[1])
						document.getElementById('gender-score-range').textContent = (threshold_data[2] - range_date[2])
								+ ' - ' + (threshold_data[2] + range_date[2])
						document.getElementById('demo-score-range').textContent = (threshold_data[3] - range_date[3])
								+ ' - ' + (threshold_data[3] + range_date[3])
						document.getElementById('size-score-range').textContent = (threshold_data[4] - range_date[4])
								+ ' - ' + (threshold_data[4] + range_date[4])
						document.getElementById('emp-score-range').textContent = (threshold_data[5] - range_date[5])
								+ ' - ' + (threshold_data[5] + range_date[5])

						var suspect_status = document
								.getElementById('fraud-status').textContent
						var fraud_checkbox = document
								.getElementById('fraud-checkbox')
						var checkBox = document.getElementById("fraud-checkbox-lever");

						if (suspect_status.toLowerCase() === 'suspect') {
							if (fraud_checkbox.checked == false) {
								fraud_checkbox.checked = true
								checkBox.classList.add("red");
								checkBox.classList.remove("green");
							}
						} else {
							if (fraud_checkbox.checked == true) {
								fraud_checkbox.checked = false
								checkBox.classList.add("green");
								checkBox.classList.remove("red");
							}
						}

					})

	function toggleContent() {
		$("#charts-div").toggle();
		$("#charts-div1").toggle();
	}

	function setCardInfo(score, threshold, range, textEle, scoreEle) {
		document.getElementById(scoreEle).textContent = score

		var ele = document.getElementById(textEle)

		if (score > (threshold - range - 1) && score < (threshold + range + 1)) {
			ele.textContent = 'Recalibration not required';
			ele.classList.add("green-text");
			ele.classList.remove("red-text");
		} else {
			ele.textContent = 'Recalibration required';
			ele.classList.add("red-text");
			ele.classList.remove("green-text");
		}
	}

	function updateData(x) {

		setCardInfo(age_score_data[x.rowIndex - 1], threshold_data[0],
				range_date[0], 'age-score-text', 'age-score');
		setCardInfo(income_score_data[x.rowIndex - 1], threshold_data[1],
				range_date[1], 'income-score-text', 'income-score');
		setCardInfo(gender_score_data[x.rowIndex - 1], threshold_data[2],
				range_date[2], 'gender-score-text', 'gender-score');
		setCardInfo(demo_score_data[x.rowIndex - 1], threshold_data[3],
				range_date[3], 'demo-score-text', 'demo-score');
		setCardInfo(size_score_data[x.rowIndex - 1], threshold_data[4],
				range_date[4], 'size-score-text', 'size-score');
		setCardInfo(emp_score_data[x.rowIndex - 1], threshold_data[5],
				range_date[5], 'emp-score-text', 'emp-score');

		var fraudIdentifier = x.getElementsByTagName('td')[2].textContent

		document.getElementById('current_points').textContent = x
				.getElementsByTagName('td')[1].textContent

		var ageScoreTextEle = document.getElementById('age-score-text')
		var singalText = document.getElementById('signals')

		if (fraudIdentifier.toLowerCase() === 'yes') {
			singalText.innerHTML = signals_text_data[x.rowIndex - 1]
		}

		if (fraudIdentifier.toLowerCase() === 'no') {
			singalText.innerHTML = "<ul><li>There are no fraud signals detected.</li></ul>"
		}

	}

	function toggleBackground() {

		var checkBox = document.getElementById("fraud-checkbox-lever");
		var fraud_checkbox = document
		.getElementById('fraud-checkbox')

		if (fraud_checkbox.checked == true) {
			checkBox.classList.add("red");
			checkBox.classList.remove("green");
		} else {
			checkBox.classList.add("green");
			checkBox.classList.remove("red");
		}
	}
</script>
</head>
<body class="container">
  <%@ include file="parts/appHeader.jsp"%>
  <!-- user-details start -->
  <section id="user-details">
    <div class="row card indigo lighten-5">
      <div class="col s5">
        <div class="row">
          <div
            class="col s12"
            style="margin: 2px 2px 2px 2px; padding: 20px 5px 0px 30px;">
            <img
              class="circle responsive-img z-depth-5"
              src="images/woman-cir-1.png"
               width="200" height="200">
          </div>
          <div class="col s12 indigo-text">
            <h5 style="margin: 1px 1px 1px 1px; padding: 15px 1px 15px 50px;">Linda Hamilton</h5>
            <div style="marging: 1px 1px 1px 1px; padding: 1px 0px 0px 25px;">
              <i class="tiny material-icons">perm_contact_calendar</i> &nbsp; 06 June 1992 (28 years)<br /> <i class="tiny material-icons">location_city</i> &nbsp; 301, Leonard Street <br /> &nbsp; &nbsp; &nbsp; Jersey City, New Jersey, 07097&nbsp; <br /> <i class="tiny material-icons">local_phone</i> &nbsp; 307-299-3040<br /> <i class="tiny material-icons">email</i> &nbsp; &nbsp;linda@example.com
            </div>
          </div>
        </div>
      </div>
      <!-- User details end -->
      <div class="col s4">
        <div class="row indigo-text">
          <div class="col s12">
            <h5>Relationship details</h5>
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Customer since</b><br /> 12 June 2015
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Products</b><br /> recurring_deposit_01, <br />check_in_02, savings_02, loan_01
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Customer segment</b><br /> seg_01, seg_02, silver
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Notes</b><br /> Lower income household <br /> Frequent flyer
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Fraud suspect status</b><br /> <span
              class="green-text"
              id="fraud-status">Not a suspect</span>
          </div>
        </div>
      </div>
      <!-- Realtionship end -->
      <div class="col s3">
        <div class="row indigo-text">
          <div class="col s12">
            &nbsp;<br /> <br />
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <h6>Loyalty points</h6>
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Lifetime points</b><br /> 2108
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Last year points</b><br /> 290
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Last month points</b><br /> 56
          </div>
        </div>
        <div class="row indigo-text">
          <div class="col s12">
            <b>Last transaction points</b><br /> 6
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- user-details end -->
  <!-- Charts section start -->
  <section id="user-charts">
    <div class="row card grey lighten-5">
      <div class="row indigo-text indigo lighten-5">
        <div
          class="col s8 indigo-text"
          style="padding: 0px 10px 5px 10px;">
          <h5>Loyalty points details</h5>
        </div>
        <div
          class="col s4 right-align"
          style="padding: 10px;">
          <button
            class="btn small-btn indigo"
            onclick="toggleContent()">Show details</button>
        </div>
      </div>
      <div
        class="row"
        id="charts-div"
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
        id="charts-div1"
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
  </section>
  <!-- Charts section end -->
  <section>
    <div class="row card grey lighten-5">
      <div
        class="row indigo-text indigo lighten-5"
        style="padding: 5px 10px 5px 15px;">
        <h5>Transactions by user</h5>
      </div>
      <div class="row indigo-text">
        <table
          class="highlight centered responsive-table"
          id="trans-table">
          <thead>
            <tr>
              <th>Date</th>
              <th>Points earned</th>
              <th>Suspected fraud</th>
            </tr>
          </thead>
          <tbody>
            <tr onclick="updateData(this)">
              <td>27 Nov 2020</td>
              <td>10</td>
              <td class="green-text">No</td>
            </tr>
            <tr onclick="updateData(this)">
              <td>13 Dec 2020</td>
              <td>12</td>
              <td class="green-text">No</td>
            </tr>
            <tr onclick="updateData(this)">
              <td>15 Dec 2020</td>
              <td>4</td>
              <td class="green-text">No</td>
            </tr>
            <tr onclick="updateData(this)">
              <td>17 Dec 2020</td>
              <td>6</td>
              <td class="green-text">No</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </section>
  <!-- Signals section start -->
  <section id="user-signels">
    <div class="row card grey lighten-5">
      <div
        class="row indigo-text indigo lighten-5"
        style="padding: 5px 10px 5px 15px;">
        <h5>Loyalty points signals information</h5>
      </div>
      <div class="row indigo-text">
        <div class="col s4">
          <div
            class="row card"
            style="margin: 2px 2px 2px 5px; padding: 10px 2px 1px 15px;">
            <div class="row">
              <div class="col s12">
                <b>Age group score</b>
              </div>
            </div>
            <div class="row">
              <div class="col s6">
                <i>Score range</i>
              </div>
              <div
                class="col s6"
                id="age-score-range">21</div>
              <div class="col s6">
                <i>Customer score</i>
              </div>
              <div
                class="col s6"
                id="age-score">21</div>
              <div class="col s12 red-text lighten-3">&nbsp;</div>
              <div
                class="col s12 green-text lighten-3"
                id="age-score-text">Recalibration not required</div>
            </div>
          </div>
        </div>
        <div class="col s4">
          <div
            class="row card"
            style="margin: 2px 2px 2px 2px; padding: 10px 2px 1px 15px;">
            <div class="row">
              <div class="col s12">
                <b>Household income group score</b>
              </div>
            </div>
            <div class="row">
              <div class="col s6">
                <i>Score range</i>
              </div>
              <div
                class="col s6"
                id="income-score-range">21</div>
              <div class="col s6">
                <i>Customer score</i>
              </div>
              <div
                class="col s6"
                id="income-score">-9</div>
              <div class="col s12 red-text lighten-3">&nbsp;</div>
              <div
                class="col s12 red-text lighten-3"
                id="income-score-text">Recalibration required</div>
            </div>
          </div>
        </div>
        <div class="col s4">
          <div
            class="row card"
            style="margin: 2px 5px 2px 2px; padding: 10px 2px 1px 15px;">
            <div class="row">
              <div class="col s12">
                <b>Gender group score</b>
              </div>
            </div>
            <div class="row">
              <div class="col s6">
                <i>Score range</i>
              </div>
              <div
                class="col s6"
                id="gender-score-range">21</div>
              <div class="col s6">
                <i>Customer score</i>
              </div>
              <div
                class="col s6"
                id="gender-score">15</div>
              <div class="col s12 red-text lighten-3">&nbsp;</div>
              <div
                class="col s12 green-text lighten-3"
                id="gender-score-text">Recalibration not required</div>
            </div>
          </div>
        </div>
      </div>
      <div class="row indigo-text">
        <div class="col s4">
          <div
            class="row card"
            style="margin: 2px 2px 2px 5px; padding: 10px 2px 1px 15px;">
            <div class="row">
              <div class="col s12">
                <b>Demography group score</b>
              </div>
            </div>
            <div class="row">
              <div class="col s6">
                <i>Score range</i>
              </div>
              <div
                class="col s6"
                id="demo-score-range">21</div>
              <div class="col s6">
                <i>Customer score</i>
              </div>
              <div
                class="col s6"
                id="demo-score">21</div>
              <div class="col s12 red-text lighten-3">&nbsp;</div>
              <div
                class="col s12 green-text lighten-3"
                id="demo-score-text">Recalibration not required</div>
            </div>
          </div>
        </div>
        <div class="col s4">
          <div
            class="row card"
            style="margin: 2px 2px 2px 2px; padding: 10px 2px 1px 15px;">
            <div class="row">
              <div class="col s12">
                <b>Household size group score</b>
              </div>
            </div>
            <div class="row">
              <div class="col s6">
                <i>Score range</i>
              </div>
              <div
                class="col s6"
                id="size-score-range">21</div>
              <div class="col s6">
                <i>Customer score</i>
              </div>
              <div
                class="col s6"
                id="size-score">17</div>
              <div class="col s12 red-text lighten-3">&nbsp;</div>
              <div
                class="col s12 green-text lighten-3"
                id="size-score-text">Recalibration not required</div>
            </div>
          </div>
        </div>
        <div class="col s4">
          <div
            class="row card"
            style="margin: 2px 5px 2px 2px; padding: 10px 2px 1px 15px;">
            <div class="row">
              <div class="col s12">
                <b>Employment status group score</b>
              </div>
            </div>
            <div class="row">
              <div class="col s6">
                <i>Score range</i>
              </div>
              <div
                class="col s6"
                id="emp-score-range">21</div>
              <div class="col s6">
                <i>Customer score</i>
              </div>
              <div
                class="col s6"
                id="emp-score">-15</div>
              <div class="col s12 red-text lighten-3">&nbsp;</div>
              <div
                class="col s12 red-text lighten-3"
                id="emp-score-text">Recalibration required</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Signals section end -->
  <!-- Fraud section end -->
  <section id="user-signels-update">
    <div class="row card grey lighten-5">
      <div class="row indigo-text">
        <div class="col s12 indigo lighten-5">
          <H5>Fraud signals</H5>
        </div>
      </div>
      <div class="row indigo-text">
        <div
          class="col s12"
          id="signals">
          <ol>
            <li>Signal 1</li>
            <li>Signal 2</li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <!-- Fraud section end -->
  <!-- Update section end -->
  <section id="user-signels-update">
    <div class="row card grey lighten-5">
      <div class="row indigo-text">
        <div class="col s12 indigo lighten-5">
          <H5>Update loyalty points</H5>
        </div>
      </div>
      <div class="row indigo-text">
        <div class="col s4">
          <p>
            <b>Current points for selected transaction</b>
          </p>
          <p>
            <b>Recommanded points</b>
          </p>
        </div>
        <div class="col s3">
          <p id="current_points">13</p>
          <p id="current_points_range">6 - 10</p>
        </div>
        <div
          class="col s5"
          style="padding: 10px 0px 0px 0px;">
          <div class="switch">
            <label class="indigo-text"> Genuine <input
              type="checkbox"
              id="fraud-checkbox"
              class="indigo"
              onclick="toggleBackground()"> <span
              class="lever"
              id="fraud-checkbox-lever"></span> Fraud
            </label>
          </div>
        </div>
      </div>
      <div class="row indigo-text">
        <div class="col s4">
          <p>&nbsp;</p>
        </div>
        <div class="col s3">
          <p>Update loyalty points</p>
        </div>
        <div class="col s3">
          <input
            type='text'
            name='userPoints'
            id='userPoints' />
        </div>
        <div class="col s2">
          <button
            type='submit'
            name='btn_login'
            class='col btn btn-small waves-effect indigo'
            name="updatePointsBtn"
            id="updatePointsBtn"
            onclick="updatePoints('')">Update</button>
        </div>
      </div>
    </div>
  </section>
  <!-- Update section end -->
  <script>
			new Chart(document.getElementById("canvas_bar_chart"), {
				type : 'bar',
				data : {
					labels : [ "Octobar", "November", "December" ],
					datasets : [ {
						label : "Loyalty points",
						backgroundColor : [ "#e8c3b9", "#c45850", "#3cba9f" ],
						data : [ 27, 47, 37 ]
					} ]
				},
				options : {
					legend : {
						display : false
					},
					title : {
						display : true,
						text : "Loyalty points (Current quarter)"
					}
				}
			});

			new Chart(document.getElementById("canvas_line_chart"), {
				type : 'line',
				data : {
					labels : [ 50, 100, 150 ],
					datasets : [ {
						data : [ 10, 11, 06 ],
						label : "Octobar",
						borderColor : "#e8c3b9",
						fill : false
					}, {
						data : [ 14, 16, 17 ],
						label : "November",
						borderColor : "#c45850",
						fill : false
					}, {
						data : [ 8, 19, 10 ],
						label : "December",
						borderColor : "#3cba9f",
						fill : false
					} ]
				},
				options : {
					title : {
						display : true,
						text : "Loyalty points trend (Current quarter)"
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
						data : [ 2478, 5267, 734 ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : "Loyality point distribution (Current quarter)"
					}
				}
			});
		</script>
</body>
</html>