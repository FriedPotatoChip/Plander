<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
<title>거북이의기적</title>
<style>

#linker a {
	color: #002054;
}

#linker a:hover {
	font-weight: 800;
	color: #00539f;
}

#primaryNav li a h5 {
	color: black;
	font-weight: 700;
}

#primaryNav li a h5:hover {
	color: #00539f;
	font-weight: 800;
}
</style>
</head>
<body>
	${sessionScope.usersVO }
	<c:if test="${empty sessionScope.usersVO }">
		<jsp:include page="/commons/header.jsp" />
	</c:if>
	<c:if test="${not empty sessionScope.usersVO }">
		<jsp:include page="/commons/loginheader.jsp" />
	</c:if>

	<div id="linker" class="d-flex justify-content-center normal"
		style="padding-top: 10px; padding-bottom: 10px;">
		<a class="nav-link active" href="#">운영안내</a> <a class="nav-link"
			href="#">이용안내</a> <a class="nav-link" href="#">모집하기</a> <a
			class="nav-link" href="#">게시판</a> <a class="nav-link" href="#">예약하기</a>
		<a class="nav-link" href="#">세부공간보기</a> <a class="nav-link" href="#">찾아오시는길</a>
		<a class="nav-link" href="#" onclick="chkLogin()">모집게시판</a>
	</div>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="/resources/images/sr0.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/images/sr1.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/images/sr2.jpg"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<script>
		if ('${loginResult}' == 'admin') {
			alert("관리자 로그인에 성공하였습니다.");
		} else if ('${loginResult}' == 'user') {
			alert("로그인 성공");
		} else if ('${loginResult}' == 'fail') {
			alert("로그인에 실패하였습니다.");
		}

		function chkLogin() {
			if ("${usersVO}" == "") {
				alert("로그인 후 이용해주세요");
				return false;
			} else {
				location.href = "/TMS/recruit";
			}
		}
	</script>
</body>
</html>