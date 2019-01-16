<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 완료</title>
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR"
	rel="stylesheet">

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->

<style>
body, html {
	width: 90%;
	margin: auto;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

#home {
	font-family: 'East Sea Dokdo', cursive;
	font-size: 2em;
}

.center {
	text-align: center;
}
</style>
</head>
<body>
	<div id="container">
		<!-- 헤더 -->
		<jsp:include page="/commons/header.jsp" />
		<br><br><br><br><br>
		<h3 class="center">회원가입 완료</h3>
		<hr>
		<p class="center">${name }
			님, 회원가입을 축하드립니다!<br> 로그인을 해서 플랜더의 다양한 컨텐츠를 이용해보세요.
		</p>

		<p class="center" style="width: 50%; margin: auto;">
			<button type="button" class="btn btn-outline-secondary"
				data-toggle="modal" href="#login">로그인</button>
			<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='/'">메인화면</button>
		</p>

		<br><br><br><br>
		<!-- 풋터 -->
		<%-- <jsp:include page="/commons/footer.jsp"/>	 --%>
	</div>
	<!-- 바디 콘테이너 끝 -->

</body>
</html>