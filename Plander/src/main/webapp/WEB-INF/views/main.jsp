<%@page import="com.bit.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PLANDER MAIN</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->

<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
	.center { text-align: center; }
	#mypage img { display: inline-block; }
	
	.card-padding { padding: 0 20px 0 20px; }
	
</style>
</head>
<body>
<div id="container">
<!-- 헤더 -->
<c:if test="${empty user }"><jsp:include page="/commons/header.jsp"/></c:if>
<c:if test="${not empty user }"><jsp:include page="/commons/loginheader.jsp"/></c:if>
	
<!-- 로그인 모달 -->

<div id="mainbox" class="center">
	<h1>특별한 나만의 계획표를 만들어보아요!</h1><br>
	<form class="form-group">
		<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>
				<input type="text" name="search">&nbsp;
				<button type="button" onclick="">검색</button>
			</td>
		</tr>
		<tr>
			<td style="text-align: left;">추천 플래너 : <a href="">연말계획</a>, <a href="">스터디</a></td>
		</tr>
		</table>
	</form>
</div>
<br><hr><br><br>

<!-- 로그인시 보여주는 마이페이지 -->
<c:if test="${not empty user }"><jsp:include page="/commons/mypageBar.jsp"/></c:if>

<!-- 인기 카테고리 -->
<div id="category">
<div class="row">
	<!-- 1번 카테고리 -->
	<div>
	
	</div>
</div>
</div>
<hr>

<!-- 인기 플래너 -->
<!-- 카드 바디 -->
<div id="popular">
<div class="row">
	<!-- 1번카드 -->
	<div class="col-md-3 col-sm-3 card-padding">
		<div class="card" style="width: 18rem;">
			<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
			<div class="card-body">
				<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
				<p style="text-align: right;">✓ 15  ♥ 40︎</p>
				<p class="card-text">2018/12/6<br>
				작성자 : 초록꿀매실</p>
			</div>
		</div>
	</div>
	
	<!-- 2번카드 -->
	<div class="col-md-3 col-sm-3 card-padding">
		<div class="card" style="width: 18rem;">
			<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
			<div class="card-body">
				<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
				<p style="text-align: right;">✓ 15  ♥ 40︎</p>
				<p class="card-text">2018/12/6<br>
				작성자 : 초록꿀매실</p>
			</div>
		</div>
	</div>
	
	<!-- 3번카드 -->
	<div class="col-md-3 col-sm-3 card-padding">
		<div class="card" style="width: 18rem;">
			<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
			<div class="card-body">
				<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
				<p style="text-align: right;">✓ 15  ♥ 40︎</p>
				<p class="card-text">2018/12/6<br>
				작성자 : 초록꿀매실</p>
			</div>
		</div>
	</div>
	
	<!-- 4번카드 -->
	<div class="col-md-3 col-sm-3 card-padding">
		<div class="card" style="width: 18rem;">
			<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
			<div class="card-body">
				<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
				<p style="text-align: right;">✓ 15  ♥ 40︎</p>
				<p class="card-text">2018/12/6<br>
				작성자 : 초록꿀매실</p>
			</div>
		</div>
	</div> <!-- 4번카드 끝 -->
</div>
</div> <!-- 카드 바디 끝 -->
<hr>

<!-- 풋터 -->
<jsp:include page="/commons/footer.jsp"/>	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>