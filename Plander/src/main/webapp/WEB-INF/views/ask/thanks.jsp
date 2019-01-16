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

img {
	display: block;
	margin: 20px auto;
}
</style>
</head>
<body>
	<div class="container">
		<img src="/resources/images/bigturtle.png"
			style="width: 10%; text-align: center;" alt="thanks">
		<h5 class="text-center">
			문의 전송이 완료되었습니다. <br>최대한 빠른 시일 내에 답변드리도록 하겠습니다. <br>감사합니다.
		</h5>
		<hr>
		<button type="button" class="btn centered"
			style="background-color: #475C7A; color: white;"
			onclick="location.href='/ask'">홈으로가기</button>
	</div>
</body>
</html>