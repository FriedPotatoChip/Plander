<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/commons/head.jsp" />
<style>
.container {
	width: 60%;
	margin: 100px auto;
}

.centered {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}
</style>
</head>
<body>
	<div class="container">
		<h4 class="text-center">문의 전송이 완료되었습니다.</h4>
		<hr>
		<button type="button" class="btn centered" style="background-color: #475C7A; color: white;"
			onclick="location.href='/TMS/ask'">홈으로가기</button>
	</div>
</body>
</html>