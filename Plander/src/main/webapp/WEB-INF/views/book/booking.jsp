<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
<!-- 부트스트랩 ================================================================================ -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!-- 부트스트랩 캘린더 =========================================================================== -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?ver=1"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.0/moment-with-locales.js"></script>
<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/5a991bff/src/js/bootstrap-datetimepicker.js"></script>
<link href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/master/build/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>

<!-- ========================================================================================= -->
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">


<script>
	$(function() {
		
		//정기권 2주 체크시 endtime 자동으로 2주 뒤 날짜 클릭 생성
		$('#2weeks').click(function() {
			//alert("정기권 2주 클릭");
			var startTime = $(document.getElementsByName('start_time')).val();
			console.log('start_time : ' + startTime);
			
			if (startTime =="") {
				alert('시작 날짜를 먼저 선택해주세요.');
				$(document.getElementsByName('start_time')).focus();
				return false;
			} else {
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
				$("input[name='end_time']").attr('value', getTimeStamp());
			}
		});
		
		//정기권 1개월 체크시 endtime 자동으로 30일 뒤 날짜 클릭 생성
		$('#1month').click(function() {
			//alert("정기권 1개월 클릭");
			var startTime = $(document.getElementsByName('start_time')).val();
			console.log('start_time : ' + startTime);
			
			if (startTime =="") {
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
				$("input[name='end_time']").attr('value', getTimeStamp());
			}
		});
		
		//야간권 클릭시 
		$('#night').click(function() {
			//일단 빈문자열 !!
			$("input[name='end_time']").attr('value', '');
		});
		//정기권 사용 안함 클릭 시 
		$('#nope').click(function() {
			$("input[name='end_time']").attr('value', '');
		});
		
	});
		
</script>
<script type="text/javascript">
	//부트스트랩 캘린더
	$(function() {
		$('#datetimepicker6').datetimepicker({
			format: 'YYYY-MM-DD HH:00',
			minDate : moment()
		});
		$('#datetimepicker7').datetimepicker({
			format: 'YYYY-MM-DD HH:00',
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
		
		var chk = $(":input:radio[name=sct_idx]:checked").val();
		if (chk==null) {
			alert("개인실/랩실 선택은 필수입니다.");
			return false;
		} else if (chk==1) {
			frm.action = "/TMS/book/oneseat";
			frm.submit();
		} else {
			frm.action = "/TMS/book/roomseat";
			frm.submit();
		}
	}
</script>

<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
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
	#selectSeat { width: 70%; }
</style>

</head>
<body>
<div id="container">
	<h4><a href="/TMS/book/booking">날짜 선택</a></h4>
	<hr>
	
	<div id="ticket" style="box-sizing: border-box;">
		<div class="boxoutside" style="border: 1px solid;">
			<form method="post">
				<!-- 달력 -->
				<div id="calendar" class="box">
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
				</div> <!-- 달력 div -->
			
				<!-- 좌석 선택 -->
				<div id="selectSeat" class="box">
					<h4>선택 날짜별 좌석 현황</h4>
					<input type="hidden" name="br_idx" value="${svo.br_idx }">
					<div class="radio">
						<label><input type="radio" name="sct_idx" value="1">개인석</label><br>
						<label><input type="radio" name="sct_idx" value="0">랩실</label><br>
					</div>
					<hr>
					
					<h4>정기 이용권(1인실)</h4>
					<div class="radio">
						<label><input type="radio" id="nope" name="time_idx" value="0" checked="checked">정기권 사용안함</label>&nbsp;
						<label><input type="radio" id="2weeks" name="time_idx" value="100">정기권 2주</label>&nbsp;
						<label><input type="radio" id="1month" name="time_idx" value="101">정기권 1개월</label>&nbsp;
						<label><input type="radio" id="night" name="time_idx" value="102">야간권(22:00~08:00)</label>
						<hr>
						<h5>사물함 사용여부</h5>
						<p>*** <b>[ 정기권 2주 ]</b> 를 구입하시는 분들 중 사물함 사용을 원하시는 분들만 체크 바랍니다.</p>
						<label><input type="radio" name="cabinet" value="y">사용</label>&nbsp;
						<label><input type="radio" name="cabinet" value="n" checked="checked">사용안함</label><br>
					</div>
					<hr>
					
					<button type="button" class="btn btn-default btn-lg"
							onclick="floorChk(this.form)">다음단계</button>
				</div>
				
			</form>
		</div>
	</div>
</div> <!-- 바디 끝 -->
</body>
</html>