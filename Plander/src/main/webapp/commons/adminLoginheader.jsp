<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* .modal-body {
	max-height: calc(100vh - 210px);
	overflow-y: auto;
} */
a {
	font-weight: 700;
	font-size: 16px;
	color: #666;
}

.dropbtn {
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content2 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-weight: 400;
}

.dropdown-content a:hover {
	background-color: #FCBB6D;
	color: black;
	font-weight: 400;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>

<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">

	<div class="container-fluid">

		<a class="navbar-brand" href="/"><img
			src="/resources/images/logo.png" width="150px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">운영안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="/book">예약하기</a></li>
				<li class="nav-item"><a class="nav-link" href="/recruit">모집게시판</a></li>
				<li class="nav-item">
					<div class="dropdown">
						<a class="nav-link dropbtn" href="#">게시판</a>
						<div class="dropdown-content">
							<a href="/board?ct_idx=1">공지사항</a> <a
								href="/board?ct_idx=2">자유게시판</a><a
								href="/board?ct_idx=3">후기게시판</a> <a href="/ask">문의하기</a>
						</div>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav ml-auto" id="primaryNav">
				<li class="nav-item"><a class="nav-link"
					style="color: #FCBB6D;" href="/admin">관리자페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</ul>

		</div>
	</div>
</nav>

<script>
	function loginChk() {
		console.log("여기 들어옴");
		if ('${empty usersVO}' == 'true') {
			alert("로그인 후 이용해주세요");
			$("#myModal").modal();
			$("#idInput").focus();
		} else {
			location.href = "/book";
		}
	}
</script>