<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />
<style>
body {
	width: 80%;
	margin: 0 auto;
	background-image: linear-gradient(to left, #00dbde, #505cfd);
}

.container {
	margin-top: 50px;
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
	<div class="container">
		<button type="button" class="btn btn-dark" style="float: right;"
			onclick="location.href='/TMS'">홈으로가기</button>
		<h1 style="text-align: center; margin-bottom: 50px;">문의하기</h1>
		<div class="card-deck">
			<div class="card">
				<img src="/resources/images/call.png" class="card-img-top ask"
					alt="call">
				<div class="card-body">
					<h5 class="card-title text-center">전화문의</h5>
					<hr>
					<p class="card-text">
						가장 빠르고 정확하게<br> 심야를 제외하고 언제든지 가능합니다.
					</p>
					<button type="button" class="btn btn-primary btn-lg btn-block"
						data-toggle="modal" data-target="#exampleModalCenter">문의하기</button>
				</div>
			</div>
			<div class="card">
				<img src="/resources/images/email.png" class="card-img-top ask"
					alt="email">
				<div class="card-body">
					<h5 class="card-title text-center">이메일문의</h5>
					<hr>
					<p class="card-text">최대한 빠른 답변을 드리기 위해 노력하고 있으나 다소 시간이 걸릴 수
						있습니다.</p>
					<button type="button" class="btn btn-primary btn-lg btn-block"
						onclick="location.href='/TMS/ask/mail'">문의하기</button>
				</div>
			</div>
			<div class="card">
				<img src="/resources/images/chat.png" class="card-img-top ask"
					alt="chat">
				<div class="card-body">
					<h5 class="card-title text-center">쪽지문의</h5>
					<hr>
					<p class="card-text">쪽지로도 빠르게 질문할 수 있습니다.</p>
					<button type="button" class="btn btn-primary btn-lg btn-block"
					onclick="location.href='/TMS/sendMsg?recv_id=admin'">문의하기</button>
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