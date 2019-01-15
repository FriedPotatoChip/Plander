<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/commons/head.jsp" />
<script>
	//DB에서 예약된 좌석이랑 비교해서 체크박스 disabled
	$()
			.ready(
					function() {
						var size = document.getElementsByName('s_col').length; //6개
						var bookroomlist = '<c:out value='${bookroomlist}' />'; //예약된 좌석 리스트 
						console.log("총 좌석 수  : " + size + ", 예약된 좌석 : "
								+ bookroomlist);

						<c:forEach var='k' items='${bookroomlist }'>
						var bookseat = '${k.s_col }'; //예약된 좌석 번호
						console.log("s_col : " + bookseat);

						for (var i = 0; i <= size; i++) {
							//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
							if (bookseat == document.getElementsByName('s_col')[i].value) {
								console.log("예약된 값 : " + bookseat);
								$(document.getElementsByName('s_col')[i]).attr(
										'disabled', true);
								break;
							}
						}
						</c:forEach>

						//체크박스 클릭했을 때 
						$(":checkbox")
								.change(
										function() {
											var cnt = 1;

											//체크된 박스 수가 1일 때 나머지 체크박스 disabled
											if (cnt == $(":checkbox:checked").length) {
												$(":checkbox:not(:checked)")
														.attr("disabled", true); //같으면 나머지 체크박스 disabled
												console
														.log("체크된 좌석 : "
																+ $(
																		":checkbox:checked")
																		.val()); //체크값 확인ok
												$("#msg")
														.html(
																"<span>"
																		+ $(
																				":checkbox:checked")
																				.val()
																		+ "호</span>");
											} else {
												$(":checkbox").removeAttr(
														"disabled");
												$("#msg").html("");
												<c:forEach var='k' items='${bookroomlist }'>
												var bookseat = '${k.s_col }'; //예약된 좌석 번호
												console.log("s_col : "
														+ bookseat);

												for (var i = 0; i <= size; i++) {
													if (bookseat == document
															.getElementsByName('s_col')[i].value) {
														$(
																document
																		.getElementsByName('s_col')[i])
																.attr(
																		'disabled',
																		true);
														console
																.log("if문 안의 s_col : "
																		+ bookseat);
														break;
													}
												}
												</c:forEach>

											}
										});

					});
</script>
<script>
	$(function() {
		var val = "";
		$(".4room").change(function() {
			document.getElementsByName('sct_idx').value = 2;
			val = document.getElementsByName('sct_idx').value;
			$("input[name='sct_idx']").attr('value', val);
			$("input[name='sct_name']").attr('value', '4인실');
			console.log("확인 : " + val);
		});

		$(".8room").change(function() {
			document.getElementsByName('sct_idx').value = 3;
			val = document.getElementsByName('sct_idx').value;
			$("input[name='sct_idx']").attr('value', val);
			$("input[name='sct_name']").attr('value', '8인실');
			console.log("확인 : " + val);
		});

		$(".12room").change(function() {
			document.getElementsByName('sct_idx').value = 4;
			val = document.getElementsByName('sct_idx').value;
			$("input[name='sct_idx']").attr('value', val);
			$("input[name='sct_name']").attr('value', '12인실');
			console.log("확인 : " + val);
		});

	});

	function next(frm) {

		frm.action = "/TMS/book/pay";
		frm.submit();
	}
</script>


<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
}

.center {
	text-align: center;
}

/* #container { width: 75%; margin: auto; } */
.boxoutside {
	width: 100%;
	height: auto;
}

.boxoutside::after, #myselect::after {
	content: "";
	clear: both;
	display: table;
}

#row {
	padding: 10px;
}

#allseat, #myselect {
	width: 93%;
	margin-left: auto;
	margin-right: auto;
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

</head>
<body>
	<div id="container" style="box-sizing: border-box;">
		<br>
		<!-- 예약 헤더 -->
		<div id="chk">
			<ul>
				<li><a class="menu" href="/TMS/book/booking"> <b><span
							id="num" class="back">STEP1</span> <span id="select"
							class="select">날짜선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu" href="/TMS/book/selectSeat"> <b><span
							id="num" class="noback">STEP2</span> <span id="select"
							class="click">좌석선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu" href="#"> <b> <span
							id="num" class="back">STEP3</span> <span id="select"
							class="select">결제하기</span></b>
				</a></li>
			</ul>
		</div>
		<hr>
		<!-- 예약 헤더끝 -->

		<div id="ticket">
			<div class="boxoutside" style="border: 1px solid lightgray;">
				<form method="post">
					<div>
						<h5>☑ 랩실은 4인실 기준 최소 3인 이상 단체예약만 가능합니다.</h5>
					</div>
					<hr>

					<div id="allseat">
						<div>
							<div class="checkbox" style="width: 100%; display: table;">
								<div id="4people"
									style="display: inline-table; width: 20%; height: 100px; margin: 0 3% 0 3%; border: 1px solid;">
									<p>
										<label><input type="checkbox" class="4room"
											name="s_col" value="201">201호(4인실)</label>
									</p>
								</div>

								<div id="8people"
									style="display: inline-table; width: 25%; height: 100px; margin-right: 3%; border: 1px solid;">
									<p>
										<label><input type="checkbox" class="8room"
											name="s_col" value="301">301호(8인실)</label>
									</p>
								</div>

								<div id="8people"
									style="display: inline-table; width: 25%; height: 100px; margin-right: 3%; border: 1px solid;">
									<p>
										<label><input type="checkbox" class="8room"
											name="s_col" value="302">302호(8인실)</label>
									</p>
								</div>
							</div>
							<br>

							<div class="checkbox" style="width: 100%; display: table;">
								<div id="4people"
									style="display: inline-table; width: 20%; height: 100px; margin: 0 3% 0 3%; border: 1px solid;">
									<p>
										<label><input type="checkbox" class="4room"
											name="s_col" value="202">202호(4인실)</label>
									</p>
								</div>

								<div id="12people"
									style="display: inline-table; width: 53%; height: 100px; margin-right: 3%; border: 1px solid;">
									<p>
										<label><input type="checkbox" class="12room"
											name="s_col" value="401">401호(12인실)</label>
									</p>
								</div>

								<div id="4people"
									style="display: inline-table; width: 15%; height: 100px; margin-right: 3%; border: 1px solid;">
									<p>
										<label>카페 터틀🐢</label>
									</p>
								</div>
							</div>
							<br>
						</div>
						<!-- 1번 열 끝 -->
					</div>

					<!-- 선택 정보 -->
					<hr>
					<table class="table center"
						style="width: 100%; margin-left: auto; margin-right: auto;">
						<tr>
							<th width="50%" class="center">날짜/시간</th>
							<th width="50%" class="center">선택 좌석정보</th>
						</tr>
						<tr>
							<td>${bvo.start_time }~${bvo.end_time }</td>
							<td id="msg"></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
					</table>
					<!-- 선택 정보 끝 -->

					<div class="center" style="padding: 10px;">
						<button type="button" onclick="location.href='/TMS/book/booking'">이전단계</button>
						&nbsp;
						<button type="button" onclick="next(this.form)">다음단계</button>
					</div>
					<br> <br> <input type="hidden" name="br_idx"
						value="${bvo.br_idx }"> <input type="hidden"
						name="roomnum" value="${bvo.roomnum }"> <input
						type="hidden" name="sct_idx" value=""> <input
						type="hidden" name="sct_name" value=""> <input
						type="hidden" name="time_idx" value="${bvo.time_idx }"> <input
						type="hidden" name="cabinet" value="${bvo.cabinet }"> <input
						type="hidden" name="start_time" value="${bvo.start_time }">
					<input type="hidden" name="end_time" value="${bvo.end_time }">
					<input type="hidden" name="s_idx" value="${bvo.s_idx }">
				</form>

			</div>
			<!-- 박스 아웃사이드 끝 -->
		</div>
		<!-- 티켓 끝 -->
	</div>
	<!-- 바디 콘테이너 끝 -->
</body>
</html>