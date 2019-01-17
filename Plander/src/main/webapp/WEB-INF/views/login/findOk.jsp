<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
}

.center {
	text-align: center;
}

#find {
	width: 50%;
	margin: auto;
}

.margintop {
	margin-top: 2%;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<c:if test="${empty user }"><jsp:include
			page="/commons/header.jsp" /></c:if>

	<div id="find">
		<!-- 아이디 찾기: 찾은 아이디 값이 있을 때 -->
		<c:if test="${not empty findId }">
			<div style="margin-top: 50px;">
				<h3>아이디 찾기 결과</h3>
				<hr>
				<p class="center margintop">
					회원님의 아이디는 <b>${findId }</b> 입니다.
				</p>
				<div class="center margintop">
					<button type="button" class="btn btn-outline-dark btn-lg mr-2"
						onclick="location.href='/'">메인으로가기</button>
					<button type="button" class="btn btn-lg"
						style="background-color: #008374; color: white;"
						data-toggle="modal" href="#login">로그인하기</button>
				</div>
			</div>
		</c:if>
		<!-- 비밀번호 찾기 -->
		<c:if test="${not empty findpw }">
			<div style="margin-top: 50px;">
				<h3>비밀번호 찾기 결과</h3>
				<hr>
				<p class="center">입력하신 이메일로 임시 비밀번호를 발송했습니다.</p>
				<p class="center">로그인 후 반드시 비밀번호를 변경해주세요.</p>
				<div class="center margintop">
					<button type="button" class="btn btn-outline-dark btn-lg mr-2"
						onclick="location.href='/'">메인으로가기</button>
				</div>
			</div>
		</c:if>
	</div>

	<br>
	<br>
	<br>
	<br>
	<!-- 풋터 -->
	<%-- <jsp:include page="/commons/footer.jsp"/> --%>
</body>
</html>