<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/commons/head.jsp" />
<title>이용안내</title>
<style>
footer {
	background-color: #3f3f3f;
	color: #d5d5d5;
	padding-top: 2rem;
}

footer a {
	color: #d5d5d5;
}

hr.light {
	border-top: 1px solid #d5d5d5;
	width: 75%;
	margin-top: .8rem;
	margin-bottom: 1rem;
}

hr.light-100 {
	border-top: 1px solid #d5d5d5;
	width: 100%;
	margin-top: .8rem;
	margin-bottom: 1rem;
}

.content {
	width: 80%;
	min-height: 650px;
	padding: 0 90px 100px;
	margin: 0 auto;
	box-sizing: border-box;
}

.uio_title {
	display: inline-block;
	position: relative;
	font-size: 20px;
	margin-bottom: 40px;
	font-weight: 400;
	letter-spacing: -.8px;
	color: #999;
}

.uio_title:after {
	position: absolute;
	left: 0;
	right: 0;
	bottom: -10px;
	content: '';
	width: 100%;
	height: 1px;
	background-color: #ebebeb;
}

h3 {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.uio_title_bullet {
	position: absolute;
	left: 0;
	bottom: -10px;
	width: 100%;
	height: 1px;
	z-index: 1;
}

.card {
	margin-top: 2rem;
	border: none;
}

.theme_color {
	color: #6c4a3f;
}
</style>

</head>
<body>
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
	<!-- Header 끝 -->

	<br>
	<br>
	<!-- 본문  -->
	<!-- 게시판 제목 -->
	<div class="fc_content content _content_body">
		<p class="bold" style="color: #475C7A; font-size: 18px;">이용안내</p>
		<hr>
		<p>- 예약하기와 모집 게시판 이용은 로그인한 회원만 가능합니다.</p>
		<p>- 자유게시판은 회원 여부에 상관없이 누구나 작성 및 열람이 가능합니다.</p>
		<p>- 후기게시판은 회원 중 해당 홈페이지로 예약 후 한 번이라도 이용을 마친 고객에 한하여 작성 가능합니다.</p>
		<p>- 문의사항이 있으시면 먼저 공지사항에 올라온 글을 확인해주시고, 그래도 원하는 답변이 없을 시
		전화, 쪽지, 이메일을 통한 문의를 하실 수 있습니다.</p>
		
		<br><br>
		<div class="price">
			<p class="bold" style="color: #475C7A; font-size: 18px;">시간당 가격</p>
			<hr>
			<table border="1px solid" style="width: 100%;">
				<thead>
					<tr>
						<td width="10%;"></td>
						<th width="10%;" class="center">개인석(1인)</th>
						<th width="10%;" class="center">4인실</th>
						<th width="10%;" class="center">8인실</th>
						<th width="10%;" class="center">12인실</th>
					</tr>
				</thead>
				<tbody id="priceCell">
					<!-- 가격표 출력 -->
				</tbody>
			</table>
			<br> <br>
			<p class="bold" style="color: #475C7A; font-size: 18px;">정기
				이용권(1인실)</p>
			<hr>
			<table style="width: 100%;" id="ticket">
				<!-- 정기권 출력 -->
			</table>
		</div>

		<br> <br>
		<p class="bold" style="color: #475C7A; font-size: 18px;">건물 내부 사진</p>
		<hr>
		<p class="bold" style="color: #FCBB6D; font-size: 17px;">안내데스크</p>
		<img src="/resources/images/m0.jpg"> <br> <br>
		<p class="bold" style="color: #FCBB6D; font-size: 17px;">개인실 좌석</p>
		<p class="bold">- 오픈형</p>
		<img src="/resources/images/m1.jpg"> <br> <br>
		<p class="bold">- 칸막이형</p>
		<img src="/resources/images/m3.jpg"> <br> <br>
		<p class="bold" style="color: #FCBB6D; font-size: 17px;">스터디룸</p>
		<p class="bold">- 4인실</p>
		<img src="/resources/images/4seat.jpg"> <br> <br>
		<p class="bold">- 8인실</p>
		<img src="/resources/images/8seat.jpg"> <br> <br>
		<p class="bold">- 12인실</p>
		<img src="/resources/images/12seat.jpg"> <br> <br>
		<p class="bold" style="color: #FCBB6D; font-size: 17px;">사물함</p>
		<img src="/resources/images/cabinet.jpg">
	</div>
	<!-- 본문 끝 -->


	<!--- Footer -->
	<footer>
		<div class="container-fluid padding">
			<div class="row text-center">
				<div class="col-md-4">
					<hr class="light">
					<h5>거북이의 기적</h5>
					<hr class="light">
					<p>010-4434-1507</p>
					<p>turtlesmiracle@gmail.com</p>
					<p>
						서울 서대문구 연세로5나길 8 <br> (서울 서대문구 창천동 57-23)
					</p>
				</div>
				<div class="col-md-4">
					<hr class="light">
					<h5>운영시간</h5>
					<hr class="light">
					<p>오전, 오후: 08am - 06pm</p>
					<p>저녁: 06pm - 10pm</p>
					<p>야간: 10pm - 08am</p>
					<p>365일 24시간 운영합니다.</p>
				</div>
				<div class="col-md-4">
					<hr class="light">
					<h5>지점</h5>
					<hr class="light">
					<p>거북이의 기적 신촌점(본점)</p>
					<p>거북이의 기적 종로점</p>
					<p>거북이의 기적 강남점</p>
				</div>
				<div class="col-12">
					<hr class="light-100">
					<h5>&copy; turtlesmiracle</h5>
				</div>
			</div>
		</div>
	</footer>

	<script>
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		//가격표 가져오는 ajax
		$
				.ajax({
					url : "/getPrice",
					type : "get",
					dataType : 'json',
					success : function(result) {
						var ticket2w = 0;
						var ticketMon = 0;
						var ticketNight = 0;
						var ticketDay = 0;

						var privateAm = 0;
						var privatePm = 0;
						var privateHoliday = 0;
						var privateNight = 1200;

						var lab4Am = 0;
						var lab4Pm = 0;
						var lab4Holiday = 0;
						var lab4Night = 4500;

						var lab8Am = 0;
						var lab8Pm = 0;
						var lab8Holiday = 0;
						var lab8Night = 7000;

						var lab12Am = 0;
						var lab12Pm = 0;
						var lab12Holiday = 0;
						var lab12Night = 9000;

						$.each(result, function(index, value) {
							// 정기권 가격
							if (value.time_idx == 100) {
								ticket2w = value.price;
							} else if (value.time_idx == 101) {
								ticketMon = value.price;
							} else if (value.time_idx == 102) {
								ticketNight = value.price;
							} else if (value.time_idx == 103) {
								ticketDay = value.price;
							}
							// 개인실 가격
							if (value.sct_idx == 1) {
								if (value.time_idx == 1) {
									privateAm = value.price;
								} else if (value.time_idx == 2) {
									privatePm = value.price;
								} else if (value.time_idx == 3) {
									privateHoliday = value.price;
								}
							}
							// 랩실 가격
							if (value.sct_idx == 2) {
								if (value.time_idx == 1) {
									lab4Am = value.price;
								} else if (value.time_idx == 2) {
									lab4Pm = value.price;
								} else if (value.time_idx == 3) {
									lab4Holiday = value.price;
								}
							}
							if (value.sct_idx == 3) {
								if (value.time_idx == 1) {
									lab8Am = value.price;
								} else if (value.time_idx == 2) {
									lab8Pm = value.price;
								} else if (value.time_idx == 3) {
									lab8Holiday = value.price;
								}
							}
							if (value.sct_idx == 4) {
								if (value.time_idx == 1) {
									lab12Am = value.price;
								} else if (value.time_idx == 2) {
									lab12Pm = value.price;
								} else if (value.time_idx == 3) {
									lab12Holiday = value.price;
								}
							}
						})

						var ticket = "";
						ticket += "<tr><th width='30%'>1일권</th><td width='70%'>";
						ticket += numberWithCommas(ticketDay) + "원";
						ticket += "</td></tr><tr><th>정기권 2주</th><td>";
						ticket += numberWithCommas(ticket2w)
								+ "원 (사물함 선택 시 +5,000원)</td>";
						ticket += "</tr><tr><th>정기권 1개월</th><td>";
						ticket += numberWithCommas(ticketMon)
								+ "원 (사물함 제공)</td>";
						ticket += "</tr><tr><th>야간권(22:00 ~ 익일 오전 8:00)</th><td>";
						ticket += numberWithCommas(ticketNight) + "원</td></tr>";
						$("#ticket").html(ticket);

						var price = "";
						price += "<tr>\<td>평일 8:00 ~ 18:00</td><td class='center'>1시간 "
								+ numberWithCommas(privateAm) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab4Am) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab8Am) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab12Am) + "원</td>";
						price += "</tr><tr><td>평일 18:00 ~ 22:00</td><td class='center'>1시간 "
								+ numberWithCommas(privatePm) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab4Pm) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab8Pm) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab12Pm) + "원</td>";
						price += "</tr><tr><td>심야 22:00 ~ 익일 오전 8:00</td><td class='center'>1시간 "
								+ numberWithCommas(privateNight) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab4Night) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab8Night) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab12Night) + "원</td>";
						price += "</tr><tr><td>주말(토,일)</td><td class='center'>1시간 "
								+ numberWithCommas(privateHoliday) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab4Holiday) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab8Holiday) + "원</td>";
						price += "<td class='center'>1시간 "
								+ numberWithCommas(lab12Holiday)
								+ "원</td></tr>";
						$("#priceCell").html(price);
					},
					error : function(error) {

					}
				});
	</script>
</body>
</html>