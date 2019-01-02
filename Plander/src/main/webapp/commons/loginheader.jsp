<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
<style>
.user {
	width: 30px;
	height: 30px;
	border-radius: 50%;
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
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #e9ecef
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">

			<a class="navbar-brand" href="/TMS"><img
				src="/resources/images/logo.png" width="150px" height="50px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">운영안내</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/TMS/book">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link dropbtn" href="#">게시판</a>
							<div class="dropdown-content">
								<a href="#">공지사항</a> <a href="#">자유게시판</a> <a href="#">FAQ</a>
							</div>
						</div>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><c:if test="${not empty usersVO }">
							<div class="dropdown">
								<a class="nav-link dropbtn" href="#"> <c:if
										test='${empty usersVO.user_profileImagePath }'>
										<img class="user" src="/resources/images/users.png" alt="user" />
									</c:if> <c:if test='${not empty usersVO.user_profileImagePath }'>
										<img class="user" src="${usersVO.user_profileImagePath }"
											alt="user" />
									</c:if> <b>&nbsp;&nbsp;&nbsp;${usersVO.id }&nbsp;님 </b>
								</a>
								<div class="dropdown-content" style="right: 0;">
									<a href="/TMS/my" style="text-align: center;">마이페이지</a> <a href="/TMS/logout" style="text-align: center;">로그아웃</a>
								</div>
							</div>
						</c:if></li>
				</ul>
			</div>

		</div>
	</nav>
</body>