<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />
<script>
	//DB에서 예약된 좌석이랑 비교해서 체크박스 disabled
	$().ready(function() {
		var size = document.getElementsByName('s_col').length;
		console.log("size : " + size);
		var booklist = '<c:out value='${booklist}' />';
	
		<c:forEach var='k' items='${booklist }'>
		var bookseat = '${k.s_col }';
	
		for (var i = 0; i <= size; i++) {
			//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
			if (bookseat == document.getElementsByName('s_col')[i].value) {
				console.log("예약된 값 : " + bookseat);
				$(document.getElementsByName('s_col')[i]).attr('disabled', true);
				$(document.getElementsByName('s_col')[i]).parents("td").addClass('eq');
				break;
			}
		}
		</c:forEach>
	
		//선택한 인원 수와 체크된 박스 수가 같을 때 나머지 체크박스 disabled
		$(":checkbox").change(function() {
			var cnt = $("#people").val(); //선택된 인원 수
			console.log("체크된 좌석 : " + $(":checkbox:checked").val()); //체크값 확인ok

			var chkVal = $(":checkbox:checked");
			var chkLen = $(":checkbox:checked").length;
			console.log("chkLen : " + chkLen);
			if (cnt == 1) {
				$("#msg").html("<span>A-" + $(":checkbox:checked").val() + "</span>");

				document.form1.test.value = $( ":checkbox:checked").val();
				document.form1.chkLen.value = cnt;
				document.form1.s_col_2.value = 0; //두번째 값

			} else {
				if (chkLen == 2) {
					var test = "";
					for (var i = 0; i < 2; i++) {
						if (i == 0) {
							test += chkVal[i].value + ",";
						} else {
							test += chkVal[i].value + "";
						}
					}
					$("#msg").html("<span>A-" + test + "</span>");
					console.log("선택한 좌석: " + test);
					document.form1.test.value = test;
					document.form1.chkLen.value = chkLen;

					var arr = new Array;
					arr = test.split(',');
					console.log("arr : " + arr);
					var fv = arr[0];
					var sv = arr[1];
					console.log("fv : " + fv + ", sv : " + sv);
					document.form1.s_col_2.value = sv; //두번째 값

				}

			}

			if (cnt == $(":checkbox:checked").length) {
				$(":checkbox:not(:checked)").attr("disabled", true);

			} else {
				$(":checkbox").removeAttr("disabled");
				$("#msg").html("");

				<c:forEach var='k' items='${booklist }'>
				var bookseat = '${k.s_col }';
				for (var i = 0; i <= size; i++) {
					//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
					if (bookseat == document.getElementsByName('s_col')[i].value) {
						$(document.getElementsByName('s_col')[i]).attr('disabled', true);
						$(document.getElementsByName('s_col')[i]).parents("td").addClass('eq');
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
		//인원수를 바꾸면 : db에 값이 있는건 disabled, 나머지는 체크해제
		$("#people").change(function() {
			$(":checkbox").removeAttr("checked");
			$(":checkbox").removeAttr("disabled");
			$("#msg").html("");

			var size = document.getElementsByName('s_col').length;
			console.log("size : " + size);
			var booklist = '<c:out value='${booklist}' />';

			<c:forEach var='k' items='${booklist }'>
			var bookseat = '${k.s_col }';

			for (var i = 0; i <= size; i++) {
				//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
				if (bookseat == document
						.getElementsByName('s_col')[i].value) {
					$(document.getElementsByName('s_col')[i]).attr('disabled', true);
					break;
				}
			}
			</c:forEach>

		});
	});
</script>

<script>
	function next(frm) {
		var chk = $('input:checkbox[name="s_col"]').is(":checked");

		if (!chk) {
			alert('좌석을 선택해주세요.');
			return false;
		} else {
			frm.action = "/book/pay"
			frm.submit();
		}
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

.box {
	float: left;
}

.boxoutside::after, #allseat::after, #myselect::after {
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
.opt {
	display: inline-block;
	padding: 1px 2px;
	font-weight: 400;
	line-height: 1.5;
	color: #4d4d4d;
	vertical-align: middle;
	border-radius: .25rem;
}

#seat_table {
	background-color: #f8f9fa;
}

.eq { background-color: #D8737F; opacity: 0.8; color: white; }
</style>

</head>
<body>
	<div id="container" style="box-sizing: border-box;">
		<br>
		<!-- 예약 헤더 -->
		<div id="chk">
			<ul>
<<<<<<< HEAD
				<li><a class="menu" href="/book/booking">
					<b><span id="num" class="back">STEP1</span>
					<span id="select" class="select">날짜선택</span></b>
					</a>
				</li>
=======
				<li><a class="menu" href="/book/booking?br_idx=${bvo.br_idx }"> <b><span
							id="num" class="back">STEP1</span> <span id="select"
							class="select">날짜선택</span></b>
				</a></li>
>>>>>>> refs/remotes/origin/master
				<li>&gt;</li>
				<li><a class="menu" href="#">
					<b><span id="num" class="noback">STEP2</span>
					<span id="select" class="click">좌석선택</span></b>
					</a>
				</li>
				<li>&gt;</li>
				<li><a class="menu" href="#">
					<b><span id="num" class="back">STEP3</span>
					<span id="select" class="select">결제하기</span></b>
					</a>
				</li>
			</ul>
		</div>
		<hr>
		<!-- 예약 헤더끝 -->

		<div id="ticket">
			<div class="boxoutside">
				<form method="post" name="form1">
					<div style="margin-left: 20px;">
						<p>☑ 1인 2석까지 예약 가능합니다.</p>
						<div>
							<span>☑ 인원 수 선택 :</span> <select id="people" class="opt">
								<option value="1">1명</option>
								<option value="2">2명</option>
							</select>
						</div>
					</div>
				<br>					
					<div id="seat_table">
						<div id="allseat">
							<div id="row" class="box">
								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="1" end="5" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="6" end="10" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
									</table>
								</div>
								<br>

								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="11" end="15" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="16" end="20" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
									</table>
								</div>
								<br>

								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="21" end="25" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="26" end="30" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
									</table>
								</div>
							</div>
							<!-- 1번 열 끝 -->

							<div id="row" class="box">
								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="31" end="33" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="34" end="36" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
									</table>
								</div>
								<br>

								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="49" end="51" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="52" end="54" step="1">
												<td>
													<label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label>
												</td>
											</c:forEach>
										</tr>
									</table>
								</div>

							</div>
							<!-- 2번 열 끝 -->

							<div id="row" class="box">
								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="37" end="39" step="1">
												<td><label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label></td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="40" end="42" step="1">
												<td><label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label></td>
											</c:forEach>
										</tr>
									</table>
								</div>
								<br>

								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="55" end="57" step="1">
												<td><label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label></td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="58" end="60" step="1">
												<td><label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label></td>
											</c:forEach>
										</tr>
									</table>
								</div>
							</div>
							<!-- 3번 열 끝 -->

							<div id="row" class="box">
								<div id="seat" class="checkbox">
									<table border="1px solid;" class="table table-bordered">
										<tr>
											<c:forEach var="i" begin="43" end="45" step="1">
												<td><label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label></td>
											</c:forEach>
										</tr>
										<tr>
											<c:forEach var="i" begin="46" end="48" step="1">
												<td><label><input type="checkbox" name="s_col"
														value="${i }">A-${i }</label></td>
											</c:forEach>
										</tr>
									</table>
								</div>
							</div>
							<!-- 4번 열 끝 -->
						</div>
						<!-- allseat 끝 -->
					</div>

					<!-- 선택 정보 -->
					<br>
					<table class="table center option"
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
						<button type="button" onclick="location.href='/book/booking?br_idx=${bvo.br_idx }'">이전단계</button>&nbsp;
						<button type="button" onclick="next(this.form)">다음단계</button>
					</div>
					<br><br>
					<input type="hidden" name="br_idx" value="${bvo.br_idx }">
					<input type="hidden" name="roomnum" value="${bvo.roomnum }">
					<input type="hidden" name="sct_idx" value="1">
					<input type="hidden" name="sct_name" value="1인실">
					<input type="hidden" name="time_idx" value="${bvo.time_idx }">
					<input type="hidden" name="cabinet" value="${bvo.cabinet }">
					<input type="hidden" name="start_time" value="${bvo.start_time }">
					<input type="hidden" name="end_time" value="${bvo.end_time }">
					<input type="hidden" name="s_idx" value="${bvo.s_idx }">
					<input type="hidden" name="test" value="">
					<input type="hidden" name="chkLen" value="">
					<input type="hidden" name="s_col_2" value="">
				</form>

			</div><!-- 박스 아웃사이드 끝 -->
		</div>
	</div><!-- 바디 콘테이너 끝 -->
</body>
</html>