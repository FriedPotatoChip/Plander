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

#home {
	font-family: 'East Sea Dokdo', cursive;
	font-size: 2em;
}

.center {
	text-align: center;
}

/* 여기 밑으로 예약 헤더 CSS */
#chk a {
	text-decoration: none;
}

#chk {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

ul>li {
	float: left;
	list-style-type: none;
	padding: 0 5% 0 5.5%;
	text-align: center;
	margin-bottom: 20px;
}

ul>li>a {
	font-size: 1.1em;
}

#chk::after {
	content: "";
	clear: both;
	display: table;
}
/* 선택 안할 시 */
.select {
	color: gray;
	
}

.back {
	background-color: gray;
	color: white;
	padding: 0 8px 0 8px;
	border-radius: 25px;
	font-size: 15px;
}

/* 현재 페이지 */
.click {
	color: #475C7A;
	font-size: 17px;
}

.noback {
	background-color: #D8737F;
	color: white;
	padding: 0 8px 0 8px;
	border-radius: 25px;
	font-size: 17px;
}
/* 예약 헤더 CSS 끝 */
/* 버튼 */
button {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 4px;
	font-size: 14px;
	text-align: center;
	background-color: white;
	border: 1px solid #D8737F;
	cursor: pointer;
}

button:hover {
	border: 1px solid #D8737F;
	background-color: #D8737F;
	color: white;
}
/* 버튼 끝 */
</style>

<script>
	function main() {
		window.opener.top.location.href = "/book";
		window.close();
	}

	function mypage() {
		window.opener.top.location.href = "/my";
		window.close();
	}
	
	function qna() {
		window.opener.top.location.href = "/ask";
		window.close();
	}
</script>
</head>
<body>
	<div id="container">
		<br>
		<!-- 예약 헤더 -->
		<div id="chk">
			<ul>
				<li><a class="menu" href="/book/booking"> <b><span
							id="num" class="back">STEP1</span> <span id="select"
							class="select">날짜선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu"> <b><span id="num" class="back">STEP2</span>
							<span id="select" class="select">좌석선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu"> <b> <span id="num" class="noback">STEP3</span>
							<span id="select" class="click">결제하기</span></b>
				</a></li>
			</ul>
		</div>
		<hr>
		<!-- 예약 헤더끝 -->

		<div class="center boxoutside">
			<br>
			<br>
			<br> <img src="/resources/images/turtle.png" alt="거북이">
			<h5 class="bold" style="color: #475C7A;">${uservo.name }님 예약이 완료되었습니다!</h5>

			<p>문의사항이 있으시다면 하단의 <strong style="color: #D8737F;">[ 문의하기 ]</strong> 버튼을 눌러주세요.</p>

			<!-- 예약정보 -->
			<div id="mybookinfo" style="padding: 10px;">
				<table border="1px solid;" class="table table-bordered"
					style="width: 100%; text-align: center;">
					<tbody>
						<tr>
							<td width="13%">예매번호</td>
							<td width="10%">예약자 이름</td>
							<td width="12%">연락처</td>
							<td width="30%">예약 날짜 및 시간</td>
							<td width="15%">선택 좌석정보</td>
							<td width="10%">사물함</td>
							<td width="10%">금액</td>
						</tr>
						<tr>
							<td id="booknum">${bvo.booknum }</td>
							<td>${uservo.name }</td>
							<td>${uservo.phone }</td>
							<td>${bvo.start_time }~ ${bvo.end_time }</td>
							<!-- 좌석 -->
							<c:choose>
								<c:when test="${bvo.sct_idx == 1 }">
									<td>${bvo.sct_name }-${test }</td>
								</c:when>
								<c:otherwise>
									<td>${bvo.sct_name }-${bvo.s_col }</td>
								</c:otherwise>
							</c:choose>
							<!-- 사물함 -->
							<c:choose>
								<c:when test="${cab == '0' }">
									<td id="cb_idx">사용안함</td>
								</c:when>
								<c:otherwise>
									<td id="cb_idx">${cab }번</td>
								</c:otherwise>
							</c:choose>
							<td id="bookprice">${bvo.price }원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 나의 예약 정보 끝 -->
			
			<br><br><br><hr>
			<div class="center" style="padding: 10px;">
				<button type="button" onclick="main()">메인으로</button>&nbsp;
				<button type="button" onclick="mypage()">마이페이지</button>&nbsp;
				<button type="button" onclick="qna()">문의하기</button>
			</div>
			<br>
			<br>
			<br>
		</div>

	</div>
	<!-- 바디 콘테이너 끝 -->
	<!--  -->
<%-- 	지금예약 : ${bvo } --%>
<%-- 	<br>${uservo }<br>${svo }<br>${idx }<br>${cb } --%>

</body>
</html>