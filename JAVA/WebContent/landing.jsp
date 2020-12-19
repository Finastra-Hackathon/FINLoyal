<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/header.jsp"%>

<!-- https://tobiasahlin.com/blog/chartjs-charts-to-get-you-started/ -->

<script>
	(function() {
		console.log('Landing page loaded.');
	})();
	
	function toggleContentChartsCommon() {
		$("#landing-user-charts-common-div").toggle();
		$("#landing-user-charts-common-div1").toggle();
	}
	
	function toggleContentChartsGeo() {
		$("#landing-user-charts-geo-div").toggle();
		$("#landing-user-charts-geo-div1").toggle();
	}
	
	function toggleContentChartsSeg() {
		$("#landing-user-charts-seg-div").toggle();
		$("#landing-user-charts-seg-div1").toggle();
	}
	
	function toggleContentChartsBias() {
		$("#landing-user-charts-bias-div").toggle();
		$("#landing-user-charts-bias-div1").toggle();
	}
	
	function toggleContentChartsFraud() {
		$("#landing-user-charts-fraud-div").toggle();
		$("#landing-user-charts-fraud-div1").toggle();
	}
</script>

</head>
<body class="container">
	<%@ include file="parts/appHeader.jsp"%>

	<!-- User Search section start -->
	<section>
		<%@ include file="parts/landing-user-search-section.jsp"%>
	</section>
	<!-- User Search section end -->

	<!-- Charts section user list start -->
	<section>
		<%@ include file="parts/landing-user-list.jsp"%>
	</section>
	<!-- Charts section user list end -->

	<!-- Charts section start -->
	<section>
		<%@ include file="parts/landing-user-charts-fraud.jsp"%>
	</section>
	<!-- Charts section end -->

	<!-- Charts section start -->
	<section>
		<%@ include file="parts/landing-user-charts-bias.jsp"%>
	</section>
	<!-- Charts section end -->

	<!-- Charts section start -->
	<section>
		<%@ include file="parts/landing-user-charts-common.jsp"%>
	</section>
	<!-- Charts section end -->

	<!-- Charts section segments start -->
	<section>
		<%@ include file="parts/landing-user-charts-segments.jsp"%>
	</section>
	<!-- Charts section segments end -->

	<!-- Charts section geography start -->
	<section>
		<%@ include file="parts/landing-user-charts-geography.jsp"%>
	</section>
	<!-- Charts section geography end -->

</body>
</html>