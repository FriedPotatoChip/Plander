<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">

<!-- 버튼 아이콘 링크 -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- ======================================================================================== -->
<style>
<
style>body, html {
	width: 90%;
	margin: auto;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

#home {
	font-family: 'East Sea Dokdo', cursive;
	font-size: 2em;
}

.center {
	text-align: center;
}

/* #container { width: 75%; margin: auto; } */
.boxoutside {
	width: 100%;
	height: auto;
}

.box {
	float: left;
}

.boxoutside::after, #allseat::after, #myselect::after {
	content: "";
	clear: both;
	display: table;
}

#row {
	padding: 10px;
}

#allseat, #myselect {
	width: 93%;
	margin-left: auto;
	margin-right: auto;
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
	height: 2.5%;
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

.h4 h4 {
	text-align: center;
	margin-top: 1%;
}

.td a {
	width: 100%;
	display: block;
	text-decoration: none;
	text-align: center;
}

.td:hover {
	background-color: #faa2c1;
}

.td a:link {
	color: black;
}

.td a:visited {
	color: black;
	text-decoration: none;
}

.td a:hover {
	color: white;
	text-decoration: none;
}
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Admin page</a>


		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/TMS">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link" href="/TMS/admin">
								<span data-feather="users"></span> Customers <span
								class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Cabinet?br_idx=1"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Chart"> <span data-feather="home"></span>
								Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="/TMS/admin/Seats?sct_idx=1"> <span
								data-feather="bar-chart-2"></span> Seats
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h2 style="text-align: center;" class="mb-5">개인실 좌석 현황</h2>
			<div id="container" style="box-sizing: border-box;">

				<div id="ticket">
					<div class="boxoutside" style="border: 1px solid;">
						<form method="post">
							<div class="h4">
								<h4>
									<a href="">개인실</a>&nbsp;&nbsp;/&nbsp; <a href=""> 랩실</a>
								</h4>
							</div>
							<div class="area_planner">
								<div class="wrap">
									<div class="planner_tap">
										<div class="po_category on" value="1">지점A</div>
										<div class="po_line">&nbsp;</div>
										<div class="po_category" value="2">지점B</div>
										<div class="po_line">&nbsp;</div>
										<div class="po_category" value="3">지점C</div>
									</div>
									<div class="clear" />
								</div>
							</div>
							<hr>


							<div id="allseat">
								<div>
									<div class="checkbox" style="width: 100%; display: table;">
										<div id="4people" onclick="check(201)"
											style="display: inline-table; width: 20%; height: 100px; margin: 0 3% 0 3%; border: 1px solid; cursor:pointer;">
											<p>
												<label><input type="hidden" class="4room"
													name="s_col" value="201">201호(4인실)</label>
											</p>
										</div>

										<div id="8people" onclick="check(301)"
											style="display: inline-table; width: 25%; height: 100px; margin-right: 3%; border: 1px solid; cursor:pointer;">
											<p>
												<label><input type="hidden" class="8room"
													name="s_col" value="301">301호(8인실)</label>
											</p>
										</div>

										<div id="8people" onclick="check(302)"
											style="display: inline-table; width: 25%; height: 100px; margin-right: 3%; border: 1px solid; cursor:pointer;">
											<p>
												<label><input type="hidden" class="8room"
													name="s_col" value="302">302호(8인실)</label>
											</p>
										</div>
									</div>
									<br>

									<div class="checkbox" style="width: 100%; display: table;">
										<div id="4people" onclick="check(202)"
											style="display: inline-table; width: 20%; height: 100px; margin: 0 3% 0 3%; border: 1px solid; cursor:pointer;">
											<p>
												<label><input type="hidden" class="4room"
													name="s_col" value="202">202호(4인실)</label>
											</p>
										</div>

										<div id="12people" onclick="check(401)"
											style="display: inline-table; width: 53%; height: 100px; margin-right: 3%; border: 1px solid; cursor:pointer;">
											<p>
												<label><input type="hidden" class="12room"
													name="s_col" value="401">401호(12인실)</label>
											</p>
										</div>

										<div id="4people"
											style="display: inline-table; width: 15%; height: 100px; margin-right: 3%; border: 1px solid; cursor:pointer;">
											<p>
												<label>카페 터틀🐢</label>
											</p>
										</div>
									</div>
									<br>
								</div>
								<!-- 1번 열 끝 -->
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModalLong" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLongTitle"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">

											<!-- modal header  -->
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle"></h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<!-- modal body -->
											<div class="modal-body">
												<table border="1" style="text-align: center;">
													<tr>
														<th>ID</th>
														<th>START_TIME</th>
														<th>END_TIME</th>
														<th>이동</th>
													</tr>

													<tbody id="tr">
													</tbody>

												</table>
											</div>

											<!-- modal footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary">Save
													changes</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 선택 정보 -->
							<input type="hidden" name="br_idx" value="${bvo.br_idx }">
							<input type="hidden" name="sct_idx" value="${bvo.sct_idx }">
							<input type="hidden" name="time_idx" value="${bvo.time_idx }">
							<input type="hidden" name="cabinet" value="${bvo.cabinet }">
							<input type="hidden" name="sct_name" value="1인실"> <input
								type="hidden" name="start_time" value="${bvo.start_time }">
							<input type="hidden" name="end_time" value="${bvo.end_time }">
							<br>
						</form>
					</div>
					<!-- 박스 아웃사이드 끝 -->
				</div>
				<!-- 티켓 끝 -->
			</div>
			<!-- 바디 콘테이너 끝 --> </main>
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
						.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>
	<script>
		function check(a) {
			console.log('안농');
			var i = a;
			var html = "";
			console.log(i);
			
			<c:forEach var="s" items="${BookingSeats }">
				var s_col = "${s.s_col}";
				var id = "${s.id}";
				var start_time = "${s.start_time}";
				var end_time = "${s.end_time}";
				console.log(s_col);
				
				if(i == s_col) {
					html += '<tr><td class="id">'+ id + '</td> <td class="start_time">'+ start_time + '</td> <td class="end_time">' + end_time + '</td> <td><button type="button" class="btn btn-outline-danger">이동</button></td></tr>';
				}
			</c:forEach>
			$('#exampleModalLong').modal();
		    $('#exampleModalLongTitle').text(i + '번 좌석 예약현황');
			$('#tr').html(html);
		}
	</script>

</body>

</html>