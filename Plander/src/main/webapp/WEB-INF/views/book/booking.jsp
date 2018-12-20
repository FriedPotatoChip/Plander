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

<script type="text/javascript">
	//부트스트랩 캘린더
	$(function() {
		$('#datetimepicker6').datetimepicker({
			format: 'YYYY-MM-DD HH:mm'
		});
		$('#datetimepicker7').datetimepicker({
			format: 'YYYY-MM-DD HH:mm',
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
		var chk = $(":input:radio[name=sct_idx]:checked").val();
		if (chk==1) {
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
	<h4><a href="">날짜 선택</a>&nbsp;&nbsp;&nbsp;
	<a href="">좌석 선택</a></h4>
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
						<label><input type="radio" name="sct_idx" value="">랩실</label><br>
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