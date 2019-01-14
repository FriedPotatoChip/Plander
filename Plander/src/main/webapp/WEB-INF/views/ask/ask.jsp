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

.ask {
	width: 100px;
	height: 100px;
	margin: 70px auto;
}

.ask:hover {
	opacity: 0.5;
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<!-- Header -->
	<c:if test="${empty sessionScope.usersVO }">
		<jsp:include page="/commons/header.jsp" />
	</c:if>
	<c:if test="${not empty sessionScope.usersVO }">
		<c:if test="${sessionScope.usersVO.rank != 1 }">
			<jsp:include page="/commons/loginheader.jsp" />
		</c:if>
		<c:if test="${sessionScope.usersVO.rank == 1 }">
			<jsp:include page="/commons/adminLoginheader.jsp" />
		</c:if>
	</c:if>
	<!-- 헤더 끝 -->
	<div class="jumbotron jumbotron-fluid"
		style="background-color: #008374;">
		<div class="container">
			<%-- 			<a href="/TMS/board?ct_idx=${ct_idx }"> --%>
			<h1 id="boardType" class="center" style="color: white;">문의하기</h1>
		</div>
	</div>

	<div class="container" style="width: 70%; margin: 20px auto;">
		<div class="card-deck">
			<div class="card">
				<img src="/resources/images/call.png" class="card-img-top ask"
					alt="call">
				<div class="card-body">
					<button type="button" class="btn btn-lg btn-block"
						data-toggle="modal" data-target="#exampleModalCenter"
						style="background-color: #6762a6; color: white;">전화 문의</button>
				</div>
			</div>
			<div class="card">
				<img src="/resources/images/email.png" class="card-img-top ask"
					alt="email">
				<div class="card-body">
					<button type="button" class="btn btn-lg btn-block"
						onclick="location.href='/TMS/ask/mail'"
						style="background-color: #6762a6; color: white;">이메일 문의</button>
				</div>
			</div>
			<div class="card">
				<img src="/resources/images/chat.png" class="card-img-top ask"
					alt="chat">
				<div class="card-body">
					<button type="button" class="btn btn-lg btn-block"
						onclick="location.href='/TMS/sendMsg?recv_id=admin'"
						style="background-color: #6762a6; color: white;">쪽지 문의</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 전화문의 모달 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">전화문의</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<h3>거기스 신촌점</h3>
					<p>
						<a href="#">02-111-1111</a>
					</p>
					<hr>
					<h3>거기스 종로점</h3>
					<p>
						<a href="#">02-222-2222</a>
					</p>
					<hr>
					<h3>거기스 강남점</h3>
					<p>
						<a href="#">02-333-3333</a>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>