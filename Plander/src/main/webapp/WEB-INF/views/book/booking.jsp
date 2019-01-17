<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />
<!-- 부트스트랩 캘린더 =========================================================================== -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?ver=1"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.0/moment-with-locales.js"></script>
<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/5a991bff/src/js/bootstrap-datetimepicker.js"></script>
<link href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/master/build/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />

<script>
	$(function() {
		$(document.getElementsByName('cabinet')).attr('disabled', true);
		
		var room = document.getElementsByName('roomnum');
		
		//개인석 클릭시 
		$(room[0]).click(function() {
			$('#userTicket').show();
		});
		
		//랩실 클릭시
		$(room[1]).click(function() {
			$('#userTicket').hide();
			$('#nope').prop("checked", true);
			$("input[name='start_time']").prop('value', '');
			$("input[name='end_time']").prop('value', '');
		});
		

		//정기권 1일권 체크
		$('#oneday').click(
			function() {
				//var startTime = $(document.getElementsByName('start_time')).val();
				console.log('start_time : ' + startTime);

				if (startTime == "") {
					alert('시작 날짜를 먼저 선택해주세요.');
					$(document.getElementsByName('start_time')).focus();
					return false;
				} else {
					//시작값이 있을 때
					function getTimeStamp() {

						var d = new Date(startTime);
						console.log('new date : ' + d);
						console.log('date 확인 : ' + d.toLocaleString());
						d.setDate(d.getDate() + 1);
						var day = d.toLocaleString();

						var s = leadingZeros(d.getFullYear(), 4) + '-'
								+ leadingZeros(d.getMonth() + 1, 2) + '-'
								+ leadingZeros(d.getDate(), 2) + ' '
								+ leadingZeros(d.getHours(), 2) + ':'
								+ leadingZeros(d.getMinutes(), 2);

						return s;
					}

					function leadingZeros(n, digits) {
						var zero = '';
						n = n.toString();

						if (n.length < digits) {
							for (i = 0; i < digits - n.length; i++)
								zero += '0';
						}
						return zero + n;
					}

					console.log('1일 뒤 날짜 확인 : ' + getTimeStamp());
					$("input[name='end_time']").prop('value', getTimeStamp());
					$(document.getElementsByName('cabinet')[1]).prop("checked", true);
					$(document.getElementsByName('cabinet')).attr('disabled', true);
				}
			});

		//정기권 2주 체크: endtime 자동으로 2주 뒤 날짜 클릭 생성
		$('#2weeks').click(
			function() {
				var startTime = $(document.getElementsByName('start_time')).val();
				console.log('start_time : ' + startTime);

				if (startTime == "") {
					alert('시작 날짜를 먼저 선택해주세요.');
					$(document.getElementsByName('start_time')).focus();
					return false;
				} else {
					//시작값이 있을 때
					function getTimeStamp() {

						var d = new Date(startTime);
						console.log('new date : ' + d);
						console.log('date 확인 : ' + d.toLocaleString());
						d.setDate(d.getDate() + 13);
						var day = d.toLocaleString();

						var s = leadingZeros(d.getFullYear(), 4) + '-'
								+ leadingZeros(d.getMonth() + 1, 2) + '-'
								+ leadingZeros(d.getDate(), 2) + ' '
								+ leadingZeros(d.getHours(), 2) + ':'
								+ leadingZeros(d.getMinutes(), 2);

						return s;
					}

					function leadingZeros(n, digits) {
						var zero = '';
						n = n.toString();

						if (n.length < digits) {
							for (i = 0; i < digits - n.length; i++)
								zero += '0';
						}
						return zero + n;
					}

					console.log('2주 뒤 날짜 확인 : ' + getTimeStamp());
					$("input[name='end_time']").prop('value', getTimeStamp());
					$(document.getElementsByName('cabinet')).removeAttr("disabled");
				}
			});

		//정기권 1개월 체크: endtime 자동으로 30일 뒤 날짜 클릭 생성
		$('#1month').click(
			function() {
				//alert("정기권 1개월 클릭");
				var startTime = $(document.getElementsByName('start_time')).val();
				console.log('start_time : ' + startTime);

				if (startTime == "") {
					alert('시작 날짜를 먼저 선택해주세요.');
					$(document.getElementsByName('start_time')).focus();
					return false;
				} else {
					function getTimeStamp() {

						var d = new Date(startTime);
						console.log('new date : ' + d);
						console.log('date 확인 : ' + d.toLocaleString());
						d.setDate(d.getDate() + 29);
						var day = d.toLocaleString();

						var s = leadingZeros(d.getFullYear(), 4) + '-'
								+ leadingZeros(d.getMonth() + 1, 2) + '-'
								+ leadingZeros(d.getDate(), 2) + ' '
								+ leadingZeros(d.getHours(), 2) + ':'
								+ leadingZeros(d.getMinutes(), 2);

						return s;
					}

					function leadingZeros(n, digits) {
						var zero = '';
						n = n.toString();

						if (n.length < digits) {
							for (i = 0; i < digits - n.length; i++)
								zero += '0';
						}
						return zero + n;
					}

					console.log('30일 뒤 날짜 확인 : ' + getTimeStamp());
					$("input[name='end_time']").prop('value', getTimeStamp());
					$(document.getElementsByName('cabinet')).removeAttr("disabled");
					$(document.getElementsByName('cabinet')[0]).prop("checked", true);
					$(document.getElementsByName('cabinet')[1]).prop("disabled", true);
				}
			});

		//야간권 클릭시 
		$('#night').click(
			function() {
				//시작날짜 오늘 22:00
				//끝나는 날짜 다음 날 8:00
				var startTime = $(document.getElementsByName('start_time')).val();
				console.log('start_time : ' + startTime);

				if (startTime == "") {
					alert('시작 날짜를 먼저 선택해주세요.');
					$(document.getElementsByName('start_time')).focus();
					return false;
				} else {
					var d = new Date(startTime);

					function getTimeStamp() {
						d.setHours(22);
						console.log("시간확인 : " + d.getHours());

						var day = d.toLocaleString();
						var s = leadingZeros(d.getFullYear(), 4) + '-'
								+ leadingZeros(d.getMonth() + 1, 2) + '-'
								+ leadingZeros(d.getDate(), 2) + ' '
								+ leadingZeros(d.getHours(), 2) + ':'
								+ leadingZeros(d.getMinutes(), 2);

						return s;
					}

					//마감 날짜 세팅
					function getEndTimeStamp() {
						d.setDate(d.getDate() + 1);
						d.setHours(8);
						console.log("날짜(일)확인 : " + d.getDate() + ", 시간확인 : " + d.getHours());

						var day = d.toLocaleString();
						var s = leadingZeros(d.getFullYear(), 4) + '-'
								+ leadingZeros(d.getMonth() + 1, 2) + '-'
								+ leadingZeros(d.getDate(), 2) + ' '
								+ leadingZeros(d.getHours(), 2) + ':'
								+ leadingZeros(d.getMinutes(), 2);

						return s;
					}

					function leadingZeros(n, digits) {
						var zero = '';
						n = n.toString();

						if (n.length < digits) {
							for (i = 0; i < digits - n.length; i++)
								zero += '0';
						}
						return zero + n;
					}

					console.log('야간권 : ' + getTimeStamp());
					$("input[name='start_time']").prop('value', getTimeStamp());
					$("input[name='end_time']").prop('value', getEndTimeStamp());

					$(document.getElementsByName('cabinet')[1]).prop("checked", true);
					$(document.getElementsByName('cabinet')).attr('disabled', true);
				}

			});

		//정기권 사용 안함 클릭 시 
		$('#nope').click(function() {
			$("input[name='end_time']").prop('value', '');
			$(document.getElementsByName('cabinet')[1]).prop("checked", true);
			$(document.getElementsByName('cabinet')).attr('disabled', true);
		});
		
	});
	
</script>
<script type="text/javascript">
	//부트스트랩 캘린더
	$(function() {
		$('#datetimepicker6').datetimepicker({
			format : 'YYYY-MM-DD HH:00',
			minDate : moment()
		});
		$('#datetimepicker7').datetimepicker({
			format : 'YYYY-MM-DD HH:00',
			useCurrent : false
		});
		$("#datetimepicker6").on("dp.change", function(e) {
			$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
		});
		$("#datetimepicker7").on("dp.change", function(e) {
			$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
		});
	});
</script>
<script>
	function floorChk(frm) {
		if (!frm.start_time.value) {
			alert("예약 시작 날짜를 선택해주세요.");
			frm.start_time.focus();
			return false;
		}
		if (!frm.end_time.value) {
			alert("예약 마감 날짜를 선택해주세요.");
			frm.end_time.focus();
			return false;
		}
		var ti_idx = $("input:radio[name=time_idx]:checked").val();
		var startGetTime = new Date($(document.getElementsByName('start_time')).val()).getTime();
		var endGetTime = new Date($(document.getElementsByName('end_time')).val()).getTime();
		if (ti_idx == 0) {
			if ((endGetTime - startGetTime) > 86400000) {
				alert("정기권을 이용하지 않을 시 최대 24시간까지 예약하실 수 있습니다.")
				$("input[name='end_time']").prop('value', '');
				return false;
			}
		}
		var chk = $(":input:radio[name=roomnum]:checked").val();
		if (chk == null) {
			alert("좌석 종류(개인실/랩실) 선택은 필수입니다.");
			return false;
		} else {
			frm.action = "/book/selectSeat";
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
	
	.center { text-align: center; }
	
	/* #container { width: 75%; margin: auto; } */
	.boxoutside {
		width: 100%;
		height: auto;
	}
	
	.box { float: left; }
	.boxoutside::after {
		content: "";
		clear: both;
		display: table;
	}
	
	#calendar, #selectSeat { padding: 20px; }
	#calendar { width: 30%; }
	
	/* 여기 밑으로 예약 헤더 CSS */
	#chk a { text-decoration: none; }
	#chk {
		width: 100%;
		margin: 0 auto;
	}
	
	#chk ul>li {
		float: left;
		list-style-type: none;
		padding: 0 5% 0 5.5%;
		text-align: center;
		margin-bottom: 20px;
	}
	
	#chk ul>li>a { font-size: 1.1em; }
	#chk::after {
		content: "";
		clear: both;
		display: table;
	}
	
	/* 선택 안할 시 */
	.select { color: gray; }
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
	
	#ticket { background-color: #f8f9fa; }
	/* 버튼 끝 */
</style>

</head>
<body>
	<div id="container">
		<br>
		<!-- 예약 헤더 -->
		<div id="chk">
			<ul>
				<li><a class="menu" href="#">
					<b><span id="num" class="noback">STEP1</span>
					<span id="select" class="click">날짜선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu" href="#">
					<b><span id="num" class="back">STEP2</span>
					<span id="select" class="select">좌석선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu" href="#">
					<b><span id="num" class="back">STEP3</span>
					<span id="select" class="select">결제하기</span></b>
				</a></li>
			</ul>
		</div>
		<!-- 예약 헤더끝 -->

		<div id="ticket" style="box-sizing: border-box;">
		
			<div class="boxoutside">
				<form method="post">
					<!-- 달력 -->
					<br>
					<div style="margin: 10px; border: 1px solid lightgray;">
						<div id="calendar" class="container">
							<div class="form-group">
								<div class='input-group date' id='datetimepicker6'>
									<input type='text' name="start_time" class="form-control" />
									<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class='input-group date' id='datetimepicker7'>
									<input type='text' name="end_time" class="form-control" />
									<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 달력 div -->

					<!-- 좌석 선택 -->
					<div id="selectSeat">
						<h4 class="bold">이용안내</h4>
						<p>☑ <b style="color: #D8737F;">[ 정기권 2주 ]</b> 를 구입하시는 분들 중 사물함 사용을 원하시는 분들만 체크 바랍니다.
							<b style="color: #D8737F;">(사물함 선택 시 +5,000원)</b></p>
						<p>☑ <b style="color: #D8737F;">[ 정기권 1개월 ]</b> 을 구입하시는 분들에게는 사물함이 무료로 제공됩니다.</p>
						<p>☑ 일정 및 인원에 변동사항이 있는 경우는 가능한 빨리 전화로 알려주세요.</p>
						<p>☑ 취소의 경우 하루 전 6시까지만 가능하며 당일 취소의 경우 최소 기본비용(최소인원*2시간)을 지불하셔야 합니다.</p>
						<p>☑ 시간 추가를 원하시는 경우 반드시 카운터에 문의 바랍니다.</p>
						<hr>

						<input type="hidden" name="br_idx" value="${svo.br_idx }">
						<table class="table table-bordered" style="width: 100%; background-color: white;">
							<tr>
								<th style="text-align: center; width: 30%;">좌석 종류 선택</th>
								<th style="text-align: center; width: 40%;">정기 이용권(1인실)</th>
								<th style="text-align: center; width: 30%;">사물함 사용여부</th>
							</tr>
							<tr height="150px;">
								<td>
									<div class="radio">
										<label><input type="radio" name="roomnum" id="oneseat" value="1">개인석</label><br>
										<label><input type="radio" name="roomnum" id="rab" value="2">랩실</label>
									</div>
								</td>
								<td>
									<div class="radio">
										<label><input type="radio" id="nope" name="time_idx" value="0" checked="checked">정기권 사용안함</label><br>
										<div id="userTicket">
											<label><input type="radio" id="oneday" name="time_idx" value="103">1일권</label><br>
											<label><input type="radio" id="2weeks" name="time_idx" value="100">정기권 2주</label><br>
											<label><input type="radio" id="1month" name="time_idx" value="101">정기권 1개월</label><br>
											<label><input type="radio" id="night" name="time_idx" value="102">야간권(22:00~08:00)</label>
										</div>
									</div>
								</td>
								<td>
									<div>
										<label><input type="radio" name="cabinet" value="1">사용</label><br>
										<label><input type="radio" name="cabinet" value="0" checked="checked">사용안함</label>
									</div>
								</td>
							</tr>

						</table>

						<div class="center" style="padding: 10px;">
							<button type="button" class="btn btn-default" disabled="disabled">이전단계</button>&nbsp;
							<button type="button" onclick="floorChk(this.form)">다음단계</button>
						</div>

					</div>
					<!-- 좌석 선택 끝 -->

				</form>
			</div>
		</div>
	</div>
	<!-- 바디 끝 -->
</body>
</html>