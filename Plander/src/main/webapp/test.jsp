<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트입니다.</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?ver=1"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.0/moment-with-locales.js"></script>
<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/5a991bff/src/js/bootstrap-datetimepicker.js"></script>
<link href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/master/build/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {
		$('#datetimepicker6').datetimepicker({
			format: 'YYYY-MM-DD HH:00',
			minDate : moment()
		});
		$('#datetimepicker7').datetimepicker({
			format: 'YYYY-MM-DD HH:00',
			useCurrent : false
		//Important! See issue #1075
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
	function test(frm) {
		if (!frm.startdate.value) {
			alert("예약 시작 날짜를 선택해주세요.");
			frm.startdate.focus();
			return false;
		}
		if (!frm.enddate.value) {
			alert("예약 마감 날짜를 선택해주세요.");
			frm.enddate.focus();
			return false;
		}
		
		alert("테스트 성공 !");
		frm.action = "/test.jsp"
		frm.submit();
		
		
	}
</script>


</head>
<body>
<br>
<form method="get">
	<div class="container">
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date' id='datetimepicker6'>
					<input type='text' name="startdate" class="form-control" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date' id='datetimepicker7'>
					<input type='text' name="enddate" class="form-control" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
	</div>
	<button type="button" onclick="test(this.form)">다음으로</button>
</form>



<hr>


<hr>
<div class="container">
	<div class="row">
		<div class='col-sm-6'>
			<input type='text' class="form-control" id='datetimepicker4' />
		</div>
		<script type="text/javascript">
           $(function () {
               $('#datetimepicker4').datetimepicker();
           });
       </script>
	</div>
</div>

<hr>
<p>1인 2석까지 예약 가능합니다.</p>
<span>인원 수 선택 : </span>
<select id="people">
	<option value="1">1명</option>
	<option value="2">2명</option>
</select>


<hr>
<p id="msg">데이터 값 : </p>

<hr>
<p>정기 이용권(1인실)</p>
<table border="1px solid" style="width: 100%;">
	<tr>
		<th width="20%">정기권 2주</th>
		<td width="">18,000원(사물함 선택 시 +2,000원)</td>
	</tr>
	<tr>
		<th>정기권 1개월</th>
		<td>45,000원(사물함 제공)</td>
	</tr>
	<tr>
		<th>야간권(22:00 ~ 다음날 8:00)</th>
		<td>12,000원</td>
	</tr>
</table>






</body>
</html>