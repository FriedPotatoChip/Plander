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

<script>
	$(function() {
		$('#booknum').html(
				'<span>' + '${bvo.getStart_time() }'.substring(0,4)
				+ '${bvo.getStart_time() }'.substring(5,7)
				+ '${bvo.getStart_time() }'.substring(8,10) + '</span>');
		
		//시간에 따른 가격계산
		var startdate = new Date('${bvo.start_time }');
		var enddate = new Date('${bvo.end_time }');
		
		var start = startdate.toLocaleString('en-GB').substring(12,14);
		var end = enddate.toLocaleString('en-GB').substring(12,14);
		
		var sum = 0;
		var sct_idx = '${bvo.sct_idx }'; //방번호 확인
		var time_idx = '${bvo.time_idx }'; //정기권 확인
		var cabinet = '${bvo.cabinet }'; //사물함 사용여부 y/n
        
        //1. 1인실 sct_idx=1일 때
        if (sct_idx == 1) {
        	console.log('sct_idx : ' + sct_idx);
        	console.log('time_idx : ' + time_idx);
        	//정기권을 구입한 사람들
        	//정기권 2주 time_idx ==100
        	//사물함 선택 유무확인, 사물함 선택시 +2000
        	if (time_idx == 100) {
        		price = 18000;
				if (cabinet == 'y') {
					sum = price + 2000;
				} else {
					sum = price;
				}
			} else if (time_idx == 101) {
				//정기권 1개월
				price = 45000;
				sum = price;
			} else if (time_idx == 102) {
				//야간권 10:00 ~ 8:00
				price = 12000;
				sum = price;
			} else {
				//정기권 X
				for (var i=start; i<end; i++) {
					console.log('i : ' + i);
					if (8 <= i && i < 18) {
						var price = 1500;
						sum += price;
						console.log('8시~18 시 : ' + price);
						console.log('i : ' + i + ', sum : ' + sum);
					} else if (i >= 18 && i <= 22) {
						price = 2000;
						sum += price;
						console.log('18 시 이후 : ' + price);
						console.log('i : ' + i + ', sum : ' + sum);
					} else {
						console.log('여기까지 확인');
					}
				} //for문 끝
			}

		} else if (sct_idx == 2) {
			//4인실 일 때
			console.log('4인실 sct_idx : ' + sct_idx);
			for (var i = start; i < end; i++) {
				console.log('i : ' + i);
				if (8 <= i && i <= 22) {
					var price = 1800;
					sum += price;
					console.log('평일 8시~22 시 : ' + price);
					console.log('i : ' + i + ', sum : ' + sum);
				} else {
					console.log('4인실 여기까지 확인');
				}
			}
			
		} else if (sct_idx == 3) {
			//8인실 일 때
			console.log('8인실 sct_idx : ' + sct_idx);
			for (var i = start; i < end; i++) {
				console.log('i : ' + i);
				if (8 <= i && i <= 22) {
					var price = 2000;
					sum += price;
					console.log('평일 8시~22 시 : ' + price);
					console.log('i : ' + i + ', sum : ' + sum);
				} else {
					console.log('8인실 여기까지 확인');
				}
			}
			
		} else if (sct_idx == 4) {
			//12인실 일 때
			console.log('12인실 sct_idx : ' + sct_idx);
			for (var i = start; i < end; i++) {
				console.log('i : ' + i);
				if (8 <= i && i <= 22) {
					var price = 2200;
					sum += price;
					console.log('평일 8시~22 시 : ' + price);
					console.log('i : ' + i + ', sum : ' + sum);
				} else {
					console.log('12인실 여기까지 확인');
				}
			}
			
		} else {
			alert("담당자에게 연락주세여..");
		}
		
		console.log('최종 가격 확인 sum : ' + sum);
		$('#bookprice').html('<span>' + sum + '원</span>');

	});
</script>


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