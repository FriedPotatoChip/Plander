<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 비밀번호 찾기 결과</title>
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
<!-- 헤더 -->
<c:if test="${empty user }"><jsp:include page="/commons/header.jsp"/></c:if>

	<div id="find">
		<!-- 아이디 찾기: 찾은 아이디 값이 있을 때 -->
		<c:if test="${not empty findid }">
			<div>
				<h5>아이디 찾기 결과</h5>
				<hr>
				<p class="center">회원님의 아이디는 <b>${findid.id }</b> 입니다.</p>
			</div>
		</c:if>
		<!-- 비밀번호 찾기 -->
		<c:if test="${not empty findpw }">
			<div>
				<h5>비밀번호 찾기 결과</h5>
				<hr>
				<p class="center">회원님의 비밀번호는 <b>${findpw.password }</b> 입니다.</p>
			</div>
		</c:if>
	</div>

<br><br><br><br>
<!-- 풋터 -->
<jsp:include page="/commons/footer.jsp"/>
</body>
</html>