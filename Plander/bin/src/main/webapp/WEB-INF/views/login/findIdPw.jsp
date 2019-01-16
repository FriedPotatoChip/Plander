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
	height: 100%;
	margin: auto;
}

.margintop {
	margin-top: 2%;
}
</style>
<script>
	if ('${result}' == 'fail') {
		alert("일치하는 회원이 없습니다.\n다시 입력하시거나 회원가입을 진행해주세요.");
	}
</script>
</head>
<body>
	<div id="container">
		<!-- 헤더 -->
		<c:if test="${empty user }"><jsp:include
				page="/commons/header.jsp" /></c:if>

		<div id="find">
			<div style="margin-top: 50px;">
				<h5>아이디 찾기</h5>
				<p>이름과 회원정보에 등록한 휴대전화번호를 입력해주세요.</p>
				<hr>
				<form method="post" action="/TMS/findId">
					<div style="border: 1px solid; padding: 20px;">
						<input type="text" name="name"
							class="form-control form-control-lg" placeholder="이름"> <input
							type="text" name="email"
							class="form-control form-control-lg margintop" placeholder="이메일">
						<button type="submit" class="btn form-control margintop btn-lg"
							style="background-color: #008374; color: white;">찾기</button>
					</div>
				</form>
			</div>
			<br> <br>
			<div>
				<h5>비밀번호 찾기</h5>
				<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
				<hr>
				<form method="post" action="/TMS/findPw">
					<div style="border: 1px solid; padding: 20px;">
						<input type="text" name="id" class="form-control form-control-lg"
							placeholder="아이디"> <input type="text" name="email"
							class="form-control form-control-lg margintop" placeholder="이메일">
						<button type="submit"
							class="btn btn-outline-secondary form-control btn-lg margintop"
							style="background-color: #008374; color: white;">찾기</button>
					</div>
				</form>
			</div>
		</div>

	</div>
	<!-- 바디 콘테이너 끝 -->

</body>
</html>