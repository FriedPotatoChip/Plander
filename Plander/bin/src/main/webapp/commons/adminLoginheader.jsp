<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <div id="header" class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
		<a href="/Plander" id="home">플랜더</a>&nbsp;&nbsp;
		<a href="">전체 플래너</a>&nbsp;
		<a href="">플래너 작성</a>&nbsp;
		<a href="">이용방법</a>&nbsp;
	</div>
	<div class="col-xs-6 col-md-4" style="text-align: right; padding-top: 0.8%;">
		<a href="">☺ ︎관리자</a>
		<a href="/Plander/logout">로그아웃</a>&nbsp;
		<select name="language">
			<option value="ko">한국어</option>
			<option value="en">영어</option>
		</select>
	</div>
</div> -->
<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
	<div class="container-fluid">

		<a class="navbar-brand" href="#"><img
			src="/resources/images/logo.png" width="150px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">운영안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#">예약하기</a></li>
				<!-- 삭제 -->
				<!-- <li class="nav-item"><a class="nav-link" href="#">모집하기</a></li> -->
				<!-- 이용안내에 넣기 -->
				<!-- <li class="nav-item"><a class="nav-link" href="#">세부공간보기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">찾아오시는길</a></li> -->
				<li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">게시판</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">자유게시판</a> <a class="dropdown-item"
							href="#">FAQ</a>
					</div>
				</div>
			</ul>
		</div>
		<!-- <a class="navbar-brand" href="/TMS"><img
		src="/resources/images/turtle.png" width="30" height="30"
		class="d-inline-block align-top ml-4" alt="거북이">
		<h1 class="light ml-3" id="title_name">거북이의기적</h1></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button> -->

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

			</ul>
			<ul class="nav justify-content-end" id="primaryNav">
				<li class="nav-item"><a class="nav-link" href="/TMS/admin"><h5>관리자페이지</h5></a></li>
				<li class="nav-item"><a class="nav-link" href="/TMS/logout"><h5>로그아웃</h5></a></li>
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img src="/resources/images/global.png"></a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#"><h5>한국어</h5></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"><h5>English</h5></a>
					</div></li>
			</ul>
		</div>
</nav>