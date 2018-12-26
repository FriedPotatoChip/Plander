<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main 화면</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<style>
@media screen and (max-width: 800px) .page-content h1 {
	font-size
	 
	
	:
	
	
	4
	.5vw
	
	
	;
	line-height
	
	
	:
	
	
	7
	vw
	;
	
	


}

@media screen and (max-width:1200px) .page-content h1 {
	padding-bottom
	
	
	:
	
	
	20
	px
	;
	
	
	
	
	font-family
	
	
	:
	
	 
	
	'
	NanumSquare
	
	
	'
	,
	sans-serif
	
	
	;
}

@media screen and (max-width: 800px) .page-content h2 {
	font-size
	
	
	:
	
	
	3
	.5vw
	
	
	;
	line-height
	
	
	:
	
	
	6
	vw
	;
	
	


}

@media screenand (max-width:1200px).page-content h2 {
	margin
	
	
	:
	
	
	020
	px
	;
	
	
	
	
	font-family
	
	
	:
	
	 
	
	'
	NanumSquare
	
	
	'
	,
	sans-serif
	
	
	;
}

body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
}

.page-content {
	overflow-y: hidden;
	width: 100%;
	display: table;
}

.home-1 {
	/* background-image: url(../resources/images/main2.jpg); */
	overflow: hidden;
	text-align: center;
	position:absolute;
	background: linear-gradient(rgba(0,0,0,.5), rgba(0,0,0,.5)), url(../resources/images/main2.jpg); 
	background-repeat: no-repeat;
	background-size: cover;
}



.page-content.active {
	filter: grayscale(0%);
	transition: all 1s ease;
}

.page-content>.content {
	display: table-cell;
	vertical-align: middle;
}

.home-1.content {
	position: relative;
	
}

.page-content h1 {
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	color: #fff;
	position: relative;
	z-index:3;
	
}

.page-content h2 {
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	color: #fff;
}

.text1 {
	width: 7rem;
	display: inline-block;
	border: 3px solid #e8590c;
	border-radius: 10px;
	padding: 20px 35px;
	margin-right: 20px;
	font-weight: bold;
}

.text2 {
	width: 7rem;
	display: inline-block;
	border: 3px solid #e03131;
	border-radius: 10px;
	padding: 20px 35px;
	margin-right: 20px;
	font-weight: bold;
}

.button {
	margin-bottom: 50px;
}

.home-1 a {
	color: #fff;
}

.text1:hover {
	background-color:#e8590c;
	color:white;
}

.text2:hover {
	background-color:#e03131;
	color:white;
}
</style>
</head>
<body>
<<<<<<< HEAD
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
			class="nav-link" href="#">게시판</a> <a class="nav-link" href="/TMS/book">예약하기</a>
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
=======
	<div class="page-content home-1 active"
		style="height: -webkit-fill-available;">
		<div class="content">
			<h1>거북이의 기적에 오신걸 환영합니다~!!!</h1>
			<h2>
				스터디 모집 <br> & <br> 룸 예약을 도와드립니다.
			</h2>
			<div class="button">
				<a href="#"> 
					<span class="text1">Login</span>
				</a> 
				<a href="#"> 
					<span class="text2">Learn More</span>
				</a>
>>>>>>> refs/remotes/origin/master
			</div>
		</div>
	</div>

</body>
</html>