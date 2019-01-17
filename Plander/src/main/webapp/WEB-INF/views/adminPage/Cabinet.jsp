<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8"> 
<title>관리자</title>
	
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">

<!-- 버튼 아이콘 링크 -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
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
	<script>
	$(document).ready(function() {
			
		$('.po_category').removeClass('on');
		$("div[value='${br_idx}']").addClass('on');
			
		$('.po_category').click(function() {
			
			//색변환
/* 			$('.po_category').removeClass('on');
			$(this).addClass('on'); */
			
			var code = $(this).attr('value');
			console.log('code : ' + code);
			
			location.href = '/TMS/admin/Cabinet?br_idx='+ code;
		});
		
		var list = new Array();
		<c:forEach var = "item" items="${cabinet}"> 
			var cb_num = '${item.cb_number}';
			var id = '${item.id}';
			var start = '${item.start_date.substring(0,10) }';
			var end = '${item.end_date.substring(0,10) }';
			$("#"+cb_num+"").attr("style", "background-color:#d0bfff;");
			$("#"+cb_num+"").html("<div><p>"+cb_num+". &nbsp&nbsp;<strong>"+id+"</strong></p> <i>"+start+"<br><span class='right'> ~ "+end+"</span></i></div>");
		</c:forEach>
	});
	
	</script>
<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/TMS/admin">Admin page</a>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/TMS/logout">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin"> <span data-feather="users"></span>
								Customers <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="/TMS/admin/Cabinet"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Chart"> <span data-feather="home"></span>
								Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Seats"> <span data-feather="bar-chart-2"></span>
								Seats
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Receipt"> <span data-feather="file"></span>
								Receipt
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Message"> <span data-feather="file"></span>
								Message
						</a></li>
					</ul>
				</div>
			</nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<h3 class="h3">개인 사물함 배치도</h3>
				<hr>
				<div class="use d-inline-flex"
					style="width: 4%; height: 3%; background-color: #d0bfff;"></div>
				<span>&nbsp;: 사용중</span>
				<div class="use d-inline-flex"
					style="width: 4%; height: 3%; background-color: #f8f9fa;"></div>
				<span>&nbsp;: 사용가능</span>

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
			
			<div class="table-responsive" style="margin-top: 1rem;">
				<div class="box">
					<c:forEach var="i" begin="1" end="40" step="1">
						<div class="item" id="${i }">
							<p>${i} &nbsp; <strong>빈 자리</strong></p>
						</div>
					</c:forEach>

				</div>
			</div>
			
			<div class="cabinet_situation">
				<span>전체 사물함 수 : 40</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>이용자
					수(오늘 날짜 기준) : ${count }</span>
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

</body>
</html>