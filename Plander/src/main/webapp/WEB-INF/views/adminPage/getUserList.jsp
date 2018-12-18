<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS-->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="../../resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="../../resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../resources/css/sb-admin.css" rel="stylesheet">
<!-- ======================================================================================== -->
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<img src="../../resources/images/turtle.png" alt=""
			style="width: 4%; height: 4%"> <a class="navbar-brand mr-1"
			href="#">Admin Page</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<div class="input-group"></div>
		<button type="button" class="btn btn-outline-danger">로그인</button>
	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>시간대별 예약현황</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>오늘 방문자 수</span>
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="/TMS/admin/getUserList"> <i
					class="fas fa-fw fa-chart-area"></i> <span>회원관리</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-table"></i> <span>사물함 현황</span>
			</a></li>
		</ul>
	</div>

	<!-- /#wrapper -->


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Core plugin JavaScript-->
	<script src="../resourcesvendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/js/sb-admin.min.js"></script>

</body>
</html>