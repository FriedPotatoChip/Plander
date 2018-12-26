<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제하기</title>
<!-- 부트스트랩 ================================================================================ -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
	.center { text-align: center; }
</style>


</head>
<body>
<div id="container">
	<div class="boxoutside" style="border: 1px solid;">
		<form method="get">
			<!-- 결제 정보 -->
			${bvo }<br>
			${myseat }<br>
			${uservo }
			<!--  -->
			
			<div style="padding: 10px;">
				<h5>예매자 확인</h5>
				<span>☑︎ 일정 및 인원에 변동사항이 있는 경우는 가능한 빨리 전화로 알려주세요.</span><br>
				<span>☑ 취소의 경우 하루 전 6시까지만 가능하며 당일 취소의 경우 최소 기본비용(최소인원*2시간)을 지불하셔야 합니다.</span><br>
				<span>☑ 시간 추가를 원하시는 경우 반드시 카운터에 문의 바랍니다.</span>
			</div> <!-- 예매자 확인 끝 -->
			
			<div id="mybookinfo" style="padding: 10px;">
				<h5>나의 예약 정보</h5>
				<table border="1px solid;" class="table table-bordered" style="width: 100%; text-align: center;">
					<tbody>
						<tr>
							<td width="15%">예매번호</td>
							<td width="10%">예약자 이름</td>
							<td width="15%">연락처</td>
							<td width="40%">예약 날짜 및 시간</td>
							<td width="10%">선택 좌석정보</td>
							<td width="10%">금액</td>
						</tr>
						<tr>
							<td id="booknum"></td>
							<td>${uservo.name }</td>
							<td>${uservo.phone }</td>
							<td>${bvo.start_time } ~ ${bvo.end_time }</td>
							<td>${bvo.sct_name } - ${bvo.s_col }</td>
							<td id="bookprice"></td>
						</tr>
					</tbody>
				</table>
			</div> <!-- 나의 예약 정보 끝 -->
			<!--  -->
			<script>
				$(function() {
					$('#booknum').html(
							'<span>' + ${bvo.getStart_time() }.subString(0,4)
							+ ${bvo.getStart_time() }.subString(5,7)
							+ ${bvo.getStart_time() }.subString(8,10) + '</span>');
					
					$('#bookprice').html(
							'<span>' + '원</span>');
				});
			</script>
			
			<!-- 결제방식 선택 -->
			<div id="pay" class="radio" style="padding: 10px;">
				<h5>결제방식 선택</h5>
				<label class="radio-inline"><input type="radio" name="pay" id="kakaopay" value="1">카카오페이</label>
				<label class="radio-inline"><input type="radio" name="pay" id="naverpay" value="2">네이버페이</label>
				<br>
				<div class="center" style="padding: 10px;">
					<button type="button" class="btn btn-default" onclick="history.back(); return false;">이전단계</button>&nbsp;
					<button type="submit" class="btn btn-default" onclick="">다음단계</button>
				</div>
			</div> <!-- 결제방식 선택 끝  -->
			
		</form>
		
	</div> <!-- 박스 아웃사이드 끝 -->
	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>