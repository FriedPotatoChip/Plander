<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">
<!-- ======================================================================================== -->

<style>
.box {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.box .item {
	display: inline-table;
	width:10%;
	height:100px;
	margin:0.5rem;
	padding:0;
	background-color:#f8f9fa;
}

h3 {
	margin-top:2rem;
	text-align:center;
}

.right {
	float:right;
}

.cabinet_situation {
	text-align :center;
	font-size : 150%;
}

</style>
</head>

<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Admin page</a>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link" href="#">
								<span data-feather="users"></span> Customers <span
								class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="/WEB-INF/views/Cabinet"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="home"></span> Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="bar-chart-2"></span> Visitors
						</a></li>
					</ul>
				</div>
			</nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h3 class="h3">개인 사물함 배치도</h3>
			<div class="use d-inline-flex" style="width:4%; height:3%; background-color:#d0bfff;"></div><span>&nbsp;: 사용중</span>
			<div class="use d-inline-flex" style="width:4%; height:3%; background-color:#f8f9fa;"></div><span>&nbsp;: 사용가능</span>
			<div class="table-responsive" style="margin-top: 1rem;">
				<div class="box">
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br><span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br><span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item" style="background-color:#d0bfff;">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br><span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br><span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br> <span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br> <span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br> <span class="right">2018/11/12</span></i>
					</div>
					
					<div class="item">
						<p>BK_IDX.&nbsp; <strong>test</strong></p>
						<i>2018/11/11 ~ <br> <span class="right">2018/11/12</span></i>
					</div>
				
					<div class="item">1</div>
					<div class="item">2</div>
					<div class="item">3</div>
					<div class="item">4</div>
					<div class="item">5</div>
					<div class="item">6</div>
					<div class="item">7</div>
					<div class="item">8</div>
				
					<div class="item">1</div>
					<div class="item">2</div>
					<div class="item">3</div>
					<div class="item">4</div>
					<div class="item">5</div>
					<div class="item">6</div>
					<div class="item">7</div>
					<div class="item">8</div>
				
					<div class="item">1</div>
					<div class="item">2</div>
					<div class="item">3</div>
					<div class="item">4</div>
					<div class="item">5</div>
					<div class="item">6</div>
					<div class="item">7</div>
					<div class="item">8</div>
				
					<div class="item">1</div>
					<div class="item">2</div>
					<div class="item">3</div>
					<div class="item">4</div>
					<div class="item">5</div>
					<div class="item">6</div>
					<div class="item">7</div>
					<div class="item">8</div>
				</div>
			
			</div>
			<div class="cabinet_situation">
				<span>전체 사물함 수 : 40</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>이용자 수(오늘 날짜 기준) : 20</span>
			</div>
			</main>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('_$tag____________________________________________________$tag_____')
	</script>
	<script src="../../resources/js/popper.min.js"></script>
	<script src="../../resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>

	Graphs
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script>
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ "Sunday", "Monday", "Tuesday", "Wednesday",
						"Thursday", "Friday", "Saturday" ],
				datasets : [ {
					data : [ 15339, 21345, 18483, 24003, 23489, 24092, 12034 ],
					lineTension : 0,
					backgroundColor : 'transparent',
					borderColor : '#007bff',
					borderWidth : 4,
					pointBackgroundColor : '#007bff'
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : false
						}
					} ]
				},
				legend : {
					display : false,
				}
			}
		});
	</script>
</body>
</html>