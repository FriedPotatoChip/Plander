<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="/resources/images/favicon-16x16.png" sizes="16x16" />
<meta charset="UTF-8">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">


<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<!--차트용  -->
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<!-- Step 2) Load billboard.js with style -->
<script src="/resources/js/billboard.js"></script>
<script src="/resources/js/Chart.min.js"></script>
<!-- Load with base style -->
<link href="/resources/css/billboard.css" rel="stylesheet">
<!-- Or load different theme style -->
<link href="/resources/css/insight.css" rel="stylesheet">
<!-- ======================================================================================== -->

<style>
.box {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.box .item {
	display: inline-table;
	width: 10%;
	height: 100px;
	margin: 0.5rem;
	padding: 0;
	background-color: #f8f9fa;
}

.box .itembg {
	display: inline-table;
	width: 10%;
	height: 100px;
	margin: 0.5rem;
	padding: 0;
	background-color: #d0bfff;
}

h3 {
	margin-top: 2rem;
	text-align: center;
}

.right {
	float: right;
}

.cabinet_situation {
	text-align: center;
	font-size: 150%;
}

.area_planner {
	width: 100%;
	padding: 1%;
}

.planner_tap {
	float: right;
}

.po_category {
	font-weight: normal;
	cursor: pointer;
	float: left;
	font-size: 70%;
}

.po_category.on {
	color: #b197fc;
}

.po_line {
	float: left;
	width: 1px;
	height: 12%;
	background: #cbcbcb;
	margin-left: 15px;
	margin-right: 15px;
}

.wrap {
	width: 100%;
	margin: 0 auto;
	position: relative;
}

.clear {
	clear: both
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/admin">Admin page</a>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link" href="/admin">
								<span data-feather="users"></span> Customers <span
								class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Cabinet"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="/admin/Chart"> <span data-feather="home"></span>
								Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Seats"> <span data-feather="bar-chart-2"></span>
								Seats
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Receipt"> <span data-feather="file"></span>
								Receipt
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Message"> <span data-feather="file"></span>
								Message
						</a></li>
					</ul>
				</div>
			</nav>

			<!-- 메인 시작 -->
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h3 class="h3">예약현황</h3>
			<hr>
			<!-- Markup -->
			<div class="container">
				<p style="text-align: center; font-size: 150%;">
					<b>[현재 지점별 이용률]</b>
				</p>
				<div class="row">
					<div class="col">
						<p style="text-align: center; font-size: 120%;">지점 A
						<div id="GaugeChart"></div>
						</p>
					</div>
					<div class="col">
						<p style="text-align: center; font-size: 120%;">지점 B
						<div id="GaugeChart1"></div>
						</p>
					</div>
					<div class="col">
						<p style="text-align: center; font-size: 120%;">지점 C
						<div id="GaugeChart2"></div>
						</p>
					</div>
				</div>
				<br> <br> <br>
				<div class="row">
					<div class="col">
						<p style="text-align: center; font-size: 150%;">
							<b>[월별 예약 현황]</b>
							<section class="charts">
								<div class="card-body">
									<canvas id="barChartExample"></canvas>
								</div>
							</section>
						</p>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script> -->

	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>
	<script>
		var chart = bb.generate({
			data : {
				columns : [ [ "지점A", "${chartA}" ] ],
				type : "gauge",
				onclick : function(d, i) {
					console.log("onclick", d, i);
				},
				onover : function(d, i) {
					console.log("onover", d, i);
				},
				onout : function(d, i) {
					console.log("onout", d, i);
				}
			},
			gauge : {},
			color : {
				pattern : [ "#a61e4d", "#f783ac", "#3bc9db", "#20c997" ],
				threshold : {
					values : [ 30, 60, 90, 100 ]
				}
			},
			size : {
				height : 180
			},
			bindto : "#GaugeChart"
		});

		var chart = bb.generate({
			data : {
				columns : [ [ "지점 B", "${chartB}" ] ],
				type : "gauge",
				onclick : function(d, i) {
					console.log("onclick", d, i);
				},
				onover : function(d, i) {
					console.log("onover", d, i);
				},
				onout : function(d, i) {
					console.log("onout", d, i);
				}
			},
			gauge : {},
			color : {
				pattern : [ "#a61e4d", "#f783ac", "#3bc9db", "#20c997" ],
				threshold : {
					values : [ 30, 60, 90, 100 ]
				}
			},
			size : {
				height : 180
			},
			bindto : "#GaugeChart1"
		});

		var chart = bb.generate({
			data : {
				columns : [ [ "지점C", "${chartC}" ] ],
				type : "gauge",
				onclick : function(d, i) {
					console.log("onclick", d, i);
				},
				onover : function(d, i) {
					console.log("onover", d, i);
				},
				onout : function(d, i) {
					console.log("onout", d, i);
				}
			},
			gauge : {},
			color : {
				pattern : [ "#a61e4d", "#f783ac", "#3bc9db", "#20c997" ],
				threshold : {
					values : [ 30, 60, 90, 100 ]
				}
			},
			size : {
				height : 180
			},
			bindto : "#GaugeChart2"
		});

		/* 막대그래프 */
		$(document).ready(
				function() {

					var brandPrimary = 'rgba(51, 51, 51, 1)';

					var BARCHARTEXMPLE = $('#barChartExample');

					var barChartExample = new Chart(BARCHARTEXMPLE,
							{
								type : 'bar',
								data : {
									labels : [ "월", "화", "수", "목", "금", "토", "일"],
									datasets : [ {
										label : "count",
										backgroundColor : [
												'#91a7ff',
												'#91a7ff',
												'#91a7ff',
												'#91a7ff',
												'#91a7ff',
												'#91a7ff',
												'#91a7ff'],
										borderColor : [
												'#91a7ff',
												'#91a7ff',
												'#91a7ff',
												'#91a7ff',
												'91a7ff',
												'#91a7ff',
												'#91a7ff'],
										borderWidth : 1,
										data : [ 
												"${monday}",
												"${tuesday}",
												"${wednesday}",
												"${thursday}",
												"${friday}",
												"${saturday}",
												"${sunday}"]
									} ]
								}
							});

				});
	</script>
</body>
</html>