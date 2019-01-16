<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
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
	<br>
	<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 700; font-size: 2em; background-color: #AB6C82;
		color: white;">
		문의하기
	</p>

	<div class="container" style="width: 70%; margin: 20px auto;">
		<div class="card-deck">
			<div class="card">
				<img src="/resources/images/call.png" class="card-img-top ask"
					alt="call">
				<div class="card-body">
					<h5 class="card-title">전화 문의</h5>
					<p class="card-text">심야 시간(당일 10pm - 익일 08am)을 제외하고 언제든지 전화로 문의 가능합니다.</p>
					<button type="button" class="btn btn-lg btn-block"
						data-toggle="modal" data-target="#exampleModalCenter"
						style="background-color: #AB6C82; color: white;">문의하기</button>
				</div>
			</div>
			<div class="card">
				<img src="/resources/images/email.png" class="card-img-top ask"
					alt="email">
				<div class="card-body">
					<h5 class="card-title">이메일 문의</h5>
					<p class="card-text">전화나 쪽지 문의보다 다소 시간이 걸릴 수 있는 점 양해 부탁드립니다.</p>
					<button type="button" class="btn btn-lg btn-block"
						onclick="window.open('/ask/mail', '이메일 문의', 'width=1100, height=800'); return false;"
						style="background-color: #AB6C82; color: white;">문의하기</button>
				</div>
			</div>
			<div class="card">
				<img src="/resources/images/chat.png" class="card-img-top ask"
					alt="chat">
				<div class="card-body">
					<h5 class="card-title">쪽지 문의</h5>
					<p class="card-text">전화 문의가 어렵거나 메일 문의가 다소 불편하신 분들은 쪽지로 문의 주세요.</p>
					<button type="button" class="btn btn-lg btn-block"
						onclick="window.open('/sendMsg?recv_id=admin', '쪽지 보내기', 'width=500, height=600'); return false;"
						style="background-color: #AB6C82; color: white;">문의하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 전화문의 모달 -->
	<div class="modal fade bd-example-modal-sm" id="exampleModalCenter"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">전화문의</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<p>거북이의기적 신촌점</p>
					<a href="#" class="bold">010-4434-1507</a>
					<hr>
					<p>거북이의기적 종로점</p>
					<a href="#" class="bold">02-722-1481</a>
					<hr>
					<p>거북이의기적 강남점</p>
					<a href="#" class="bold">02-3453-5404</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" style="background-color: #AB6C82; color: white;"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<hr>
	<!-- 허해서 넣은 풋터 -->
		<p class="center" style="font-size: 17px;">© turtlesmiracle</p><br><br>
	<!-- 허해서 넣은 풋터 끝 -->
</body>
</html>