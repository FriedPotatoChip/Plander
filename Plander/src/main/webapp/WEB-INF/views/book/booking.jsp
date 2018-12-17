<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- ========================================================================================= -->
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<script type="text/javascript">
	//부트스트랩 캘린더
	$(function() {
		$('#datetimepicker12').datepicker({
			inline : true,
			sideBySide : true,
			todayHighlight : true,
			language : "kr", format: 'yy-mm-dd'
		});
	});
	
	
	//한국어 설정
	!function(a) {
		a.fn.datepicker.dates.kr = {
			days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
			monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			titleFormat : "yyyy년 MM", /* Leverages same syntax as 'format' */
		}
	}(jQuery);
	
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
			<form method="post" action="/TMS/book/selectSeat" onsubmit="">
				<!-- 달력 -->
				<div style="overflow: hidden;" id="calendar" class="box">
					<div class="form-group">
						<div class="row">
							<div class="col-md-8 col-sm-6">
								<div id="datetimepicker12"></div>
								<input type="hidden" id="textdate" name="date" value="" class="form-control">
								<script>
									//input 박스에 넣어서 값 넘기기
									$('#datetimepicker12').on('changeDate', function(){
										$('#textdate').val(
											$('#datetimepicker12').datepicker('getFormattedDate')
										);
									});
								</script>
							</div>
						</div>
					</div>
				</div> <!-- 달력 div -->
			
				<!-- 좌석 선택 -->
				<div id="selectSeat" class="box">
					<h4>선택 날짜별 좌석 현황</h4>
					<div class="checkbox">
						<label><input type="checkbox" name="sct_idx" value="1">개인석</label><br>
						<label><input type="checkbox" name="sct_idx" value="2">4인실</label><br>
						<label><input type="checkbox" name="sct_idx" value="3">8인실</label><br>
						<label><input type="checkbox" name="sct_idx" value="4">12인실</label>
					</div>
					<hr>
					<input type="hidden" name="br_idx" value="${BRidx }">
					<button type="submit" class="btn btn-default btn-lg" onclick="">다음단계</button>
				</div>
				
			</form>
		</div>
	</div>
</div> <!-- 바디 끝 -->
</body>
</html>