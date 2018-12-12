<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 비밀번호 찾기</title>
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
	#find { width: 50%; margin: auto; }
	
	.margintop { margin-top: 2%; }
</style>

</head>
<body>
<div id="container">
<!-- 헤더 -->
<c:if test="${empty user }"><jsp:include page="/commons/header.jsp"/></c:if>

<div id="find">
	<div>
		<h5>아이디 찾기</h5>
		<p>이름과 회원정보에 등록한 휴대전화번호를 입력해주세요.</p>
		<hr>
		<form method="post" action="/Plander/findId">
		<div style="border: 1px solid; padding: 20px;">
			<input type="text" name="name" class="form-control" placeholder="이름">
			<input type="text" name="phone" class="form-control margintop" placeholder="휴대전화번호">
			<button type="submit" class="btn btn-outline-secondary form-control margintop">찾기</button>
		</div>
		</form>
	</div>
	<br><br>
	<div>
		<h5>비밀번호 찾기</h5>
		<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
		<hr>
		<form method="post" action="/Plander/findPw">
		<div style="border: 1px solid; padding: 20px;">
			<input type="text" name="id" class="form-control" placeholder="아이디 입력">
			<button type="submit" class="btn btn-outline-secondary form-control margintop">찾기</button>
		</div>
		</form>
	</div>
</div>

<br><br><br><br>
<!-- 풋터 -->
<jsp:include page="/commons/footer.jsp"/>
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>