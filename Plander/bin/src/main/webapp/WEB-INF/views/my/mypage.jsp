<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<style>
.my_info {
	width: 45%;
	float: left;
}

.myBook {
	width: 45%;
	float: right;
}

.myRecruit {
	width: 90%;
	clear: left;
}
</style>

<body>
	<nav>
		<button type="button" class="btn btn-dark" style="float: right;"
			onclick="location.href='/TMS'">홈으로가기</button>
	</nav>

	<div class="my_info">
		<h3>내정보</h3>
		<button type="button" class="btn btn-dark"
			onclick="location.href='/TMS/my/userUpdate'">회원정보수정</button>
		<table class="table">
			<tr>
				<th>회원아이디</th>
				<td>${user.id }</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>${user.name }</td>
			</tr>
			<tr>
				<th>회원등록일</th>
				<td>${user.regdate }</td>
			</tr>
			<tr>
				<th>회원연락처</th>
				<td>${user.phone }</td>
			</tr>
			<tr>
				<th>회원이메일</th>
				<td>${user.email }</td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td>${user.zipNo }&nbsp;${user.roadAddrPart1 }&nbsp;${user.addrDetail }</td>
			</tr>
		</table>
	</div>

	<div class="myBook">
		<h3>내예약</h3>
		<strong><a href="#"
			onclick="fetchPage('/TMS/my/my_seat', userUpdate)">좌석예약내역</a></strong>
		<button type="button" class="btn btn-dark"
			onclick="location.href='/TMS/book/seat'">좌석예약하러가기</button>
		<table id="myBookSeat"></table>
		<strong><a href="#"
			onclick="fetchPage('/TMS/my/my_cabinet', my_cabinet)">사물함예약내역</a></strong>
		<button type="button" class="btn btn-dark"
			onclick="location.href='/TMS/book/cabinet'">사물함예약하러가기</button>
		<table id="myBookCabinet"></table>
	</div>

	<div class="myRecruit">
		<h3>내스터디모집</h3>
		<button type="button" class="btn btn-dark"
			onclick="location.href='/TMS/my/userUpdate'">모집글 작성하기</button>
		<strong><a href="#"
			onclick="fetchPage('/TMS/my/my_recruit', my_recruit)">내모집글</a></strong>
		<table id="myRecruit"></table>
		<strong><a href="#"
			onclick="fetchPage('/TMS/my/applyList', applyList)">내모집글 신청현황</a></strong>
		<table id="applyList"></table>
		<strong><a href="#"
			onclick="fetchPage('/TMS/my/my_recruit_comment', my_recruit_comment)">내모집글에
				달린 댓글</a></strong>
		<table id="myRecruitComment"></table>
	</div>

	<script>
		function fetchPage(name, keyword) {
			fetch(name)
					.then(
							function(response) {
								response
										.text()
										.then(
												function(text) {
													if (keyword == "userUpdate") {
														document
																.querySelector('#myBookSeat').innerHTML = text;
													} else if (keyword == "my_cabinet") {
														document
																.querySelector('#myBookCabinet').innerHTML = text;
													} else if (keyword == "my_recruit") {
														document
																.querySelector('#myBookCabinet').innerHTML = text;
													} else if (keyword == "applyList") {
														document
																.querySelector('#applyList').innerHTML = text;
													} else if (keyword == "my_recruit_comment") {
														document
																.querySelector('#"myRecruitComment"').innerHTML = text;
													}
												})
							});
		}
	</script>
</body>
</html>
