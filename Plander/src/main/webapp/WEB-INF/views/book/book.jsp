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

#container {
	width: 80%;
	margin: auto;
}

* {
	text-decoration: none;
}

.center {
	text-align: center;
}

/* 지점 좌석 현황 및 요금 */
.boxoutside {
	width: 100%;
	height: auto;
}

.box {
	float: left;
}

.boximg {
	display: block;
	width: 75%;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
}

.boxoutside::after {
	content: "";
	clear: both;
	display: table;
}

.price {
	display: block;
	width: 75%;
	margin-left: auto;
	margin-right: auto;
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
	<br>
	<br>

	<div id="container">

		<div class="price">
			<p class="bold" style="color: #008374;">시간당 가격</p>
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
			<br>
			<p class="bold" style="color: #6762a6;">정기 이용권(1인실)</p>
			<hr>
			<table style="width: 100%;" id="ticket">
				<!-- 정기권 출력 -->
			</table>
		</div>
		<br>
		<script>
			function book(frm) {
				if ('${empty usersVO}' == 'true') {
					loginChk();
					return false;
				}
				var title = "bookingPage";
				window
						.open("", title,
								"width=1200, height=700, scrollbars=yes");

				frm.target = title;
				frm.action = "/TMS/book/booking";
				frm.submit();
			}
		</script>

		<div style="box-sizing: border-box;">
			<h3 class="text-center">1호점(신촌점)</h3>
			<hr>
			<div class="boxoutside">
				<div class="boximg text-center">
					<img alt="신촌점" src="/resources/images/main.jpg"
						style="width: 800px;">
				</div>
				<br>
				<form method="post">
					<input type="hidden" name="br_idx" value="1">
					<button type="button"
						class="btn btn-outline-secondary btn-lg btn-block"
						style="width: 60%; margin: 0 auto;" onclick="book(this.form)">예약하기</button>
				</form>
			</div>
			<!-- boxoutside 끝 -->
		</div>
		<!-- 1 호점 끝 -->

		<br> <br> <br>
		<div style="box-sizing: border-box;">
			<h3 class="text-center">2호점(종로점)</h3>
			<hr>
			<div class="boxoutside">
				<div class="boximg text-center">
					<img alt="종로점" src="/resources/images/main2.jpg"
						style="width: 800px;">
				</div>
				<br>
				<form method="post">
					<input type="hidden" name="br_idx" value="2">
					<button type="button"
						class="btn btn-outline-secondary btn-lg btn-block"
						style="width: 60%; margin: 0 auto;" onclick="book(this.form)">예약하기</button>
				</form>
			</div>
			<!-- boxoutside 끝 -->
		</div>
		<!-- 2 호점 끝 -->

		<br> <br> <br>
		<div style="box-sizing: border-box;">
			<h3 class="text-center">3호점(강남점)</h3>
			<hr>
			<div class="boxoutside">
				<div class="boximg text-center">
					<img alt="강남점" src="/resources/images/main3.jpg"
						style="width: 800px;">
				</div>
				<br>
				<form method="post">
					<input type="hidden" name="br_idx" value="3">
					<button type="button"
						class="btn btn-outline-secondary btn-lg btn-block"
						style="width: 60%; margin: 0 auto;" onclick="book(this.form)">예약하기</button>
				</form>
			</div>
			<!-- boxoutside 끝 -->
		</div>
		<!-- 3 호점 끝 -->

		<br>
		<!-- 풋터 -->

	</div>
	<!-- 바디 콘테이너 끝 -->
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
						var lab4Night = 1500;

						var lab8Am = 0;
						var lab8Pm = 0;
						var lab8Holiday = 0;
						var lab8Night = 1800;

						var lab12Am = 0;
						var lab12Pm = 0;
						var lab12Holiday = 0;
						var lab12Night = 2000;

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
						ticket += "<tr><th width='25%'>1일권</th><td width='75%'>";
						ticket += numberWithCommas(ticketDay) + "원";
						ticket += "</td></tr><tr><th>정기권 2주</th><td>";
						ticket += numberWithCommas(ticket2w)
								+ "원 (사물함 선택 시 +2,000원)</td>";
						ticket += "</tr><tr><th>정기권 1개월</th><td>";
						ticket += numberWithCommas(ticketMon)
								+ "원 (사물함 제공)</td>";
						ticket += "</tr><tr><th>야간권(22:00 <br>~ 익일 오전 8:00)</th><td>";
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
						price += "</tr><tr><td>심야 22:00 <br> ~ 익일 오전 8:00</td><td class='center'>1시간 "
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