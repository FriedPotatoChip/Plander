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
	
	/* 여기 밑으로 예약 헤더 CSS */
	#chk a { text-decoration: none; }
	#chk { width: 100%; margin-left: auto; margin-right: auto; }
	ul>li {
		float: left;
		list-style-type: none;
		padding: 0 5% 0 5.5%;
		text-align: center;
		margin-bottom: 20px;
	}
	ul>li>a { font-size: 1.1em; }
	
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
	.click { color: black; }
	.noback {
		background-color: rebeccapurple;
		color: white;
		padding: 0 8px 0 8px;
		border-radius: 25px;
		font-size: 15px;
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
		border: 1px solid rebeccapurple;cursor: pointer;
	}
	button:hover {
		border: 1px solid rebeccapurple;
		background-color: rebeccapurple;
		color: white;
	}
	/* 버튼 끝 */
</style>

<script>
	$(function() {
		$('#booknum').html(
				'<span>' + '${bvo.getStart_time() }'.substring(2,4)
				+ '${bvo.getStart_time() }'.substring(5,7)
				+ '${bvo.getStart_time() }'.substring(8,10)
				+ '-' + '${bvo.getStart_time() }'.substring(11,13)
				+ '${bvo.getStart_time() }'.substring(14,16) + '${bvo.s_col}'
				+ '</span>');
		var bookval = '${bvo.getStart_time() }'.substring(2,4)
						+ '${bvo.getStart_time() }'.substring(5,7)
						+ '${bvo.getStart_time() }'.substring(8,10)
						+ '-' + '${bvo.getStart_time() }'.substring(11,13)
						+ '${bvo.getStart_time() }'.substring(14,16) + '${bvo.s_col}';
		$("input[name='booknum']").attr('value', bookval);
		
		//사물함 사용여부
		var bookCab = '${cb.cb_idx }';
		console.log("cb_idx 확인 : " + bookCab);
		

		if (bookCab != "") {
			$('#cb_idx').html('<span>' + bookCab + '번</span>');
			$("input[name='cb_idx']").attr('value', bookCab);
		} else {
			$('#cb_idx').html('<span>사용안함</span>');
			$("input[name='cb_idx']").attr('value', 0);
		}
		
		//시간에 따른 가격계산
		var startdate = new Date('${bvo.start_time }');
		var enddate = new Date('${bvo.end_time }');
		var startday = startdate.getDay();
		var endday = enddate.getDay();
		
		var start = startdate.toLocaleString('en-GB').substring(12,14);
		var end = enddate.toLocaleString('en-GB').substring(12,14);
		
		window.sum = 0;
		window.sct_idx = '${bvo.sct_idx }'; //방번호 확인
		var time_idx = '${bvo.time_idx }'; //정기권 확인
		var cabinet = '${bvo.cabinet }'; //사물함 사용여부 y/n
        
		// 가격표 가져오는 ajax
		$.ajax({
			url: "/getPrice",
			type: "get",
			dataType: 'json',
			success: function(result){
				var ticket2w = 0;
				var ticketMon = 0;
				var ticketNight = 0;
				var ticketDay = 0;
				
				var privateAm = 0;
				var privatePm = 0;
				var privateHoliday = 0;
				var privateNight = 1200;
				
				var labAm = 0;
				var labPm = 0;
				var labHoliday = 0;
				var labNight = 0;
					
				$.each(result, function(index, value){
					
					// 정기권 가격
					if (value.time_idx == 100){
						ticket2w = value.price;
					} else if (value.time_idx == 101){
						ticketMon = value.price;
					} else if (value.time_idx == 102){
						ticketNight = value.price;
					} else if (value.time_idx == 103){
						ticketDay = value.price;
					}

					// 개인실 가격
					if (value.sct_idx == 1){
						if (value.time_idx == 1){
							privateAm = value.price;
						} else if (value.time_idx == 2){
							privatePm = value.price;
						} else if (value.time_idx == 3){
							privateHoliday = value.price;
						}
					}
					// 랩실 가격
					if (sct_idx == 2){
						labNight = 1500;
					} else if (sct_idx == 3){
						labNight = 1800;
					} else if (sct_idx == '4'){
						labNight = 2000;
					}
					if (sct_idx >= 2 && sct_idx <= 4){
						if (sct_idx == value.sct_idx){
							if (value.time_idx == 1){
								labAm = value.price;
							} else if (value.time_idx == 2){
								labPm = value.price;
							} else if (value.time_idx == 3){
								labHoliday = value.price;
							}
						}
					}
					
				})
				
				
		        //1. 1인실 sct_idx=1일 때
		        if (sct_idx == 1) {
		        	console.log('sct_idx : ' + sct_idx);
		        	console.log('time_idx : ' + time_idx);
		        	//정기권을 구입한 사람들
		        	//정기권 2주 time_idx ==100
		        	//사물함 선택 유무확인, 사물함 선택시 +2000
		        	if (time_idx == 100) {
		        		sum = ticket2w;
						if (cabinet == 'y') {
							sum += 2000;
						}
					} else if (time_idx > 100) {
						//정기권 1개월
						//야간권 10:00 ~ 8:00
						//1일권
						var tic = 0;
						if (time_idx == 101){
							tic = ticketMon;
						} else if (time_idx == 102){
							tic = ticketNight;
						} else if (time_idx == 103){
							tic = ticketDay;
						}
						sum = tic;
					}
					else {
						//정기권 X 평일일때
						if (startday != 0 && startday != 6 && endday != 0 && endday != 6){
							if (end > start){
								for (var i=start; i<end; i++) {
									console.log('i : ' + i);
									if (8 <= i && i < 18) {
										sum += privateAm;
										console.log('i : ' + i + ', sum : ' + sum);
									} else if (i >= 18 && i < 22) {
										sum += privatePm;
										console.log('i : ' + i + ', sum : ' + sum);
									} else {
										sum += privateNight;
										console.log('여기까지 확인');
									}
								} //for문 끝
							} else {
								for (var i=start; i<24; i++) {
									console.log('i : ' + i);
									if (8 <= i && i < 18) {
										sum += privateAm;
										console.log('i : ' + i + ', sum : ' + sum);
									} else if (i >= 18 && i < 22) {
										sum += privatePm;
										console.log('i : ' + i + ', sum : ' + sum);
									} else {
										sum += privateNight;
										console.log('여기까지 확인');
									}
								} //for문 끝
								for (var i=0; i<end; i++) {
									console.log('i : ' + i);
									if (8 <= i && i < 18) {
										sum += privateAm;
										console.log('i : ' + i + ', sum : ' + sum);
									} else if (i >= 18 && i < 22) {
										sum += privatePm;
										console.log('i : ' + i + ', sum : ' + sum);
									} else {
										sum += privateNight;
										console.log('여기까지 확인');
									}
								} //for문 끝
							} // 평일 계산 끝
						} else if ((startday == 6 && endday == 0) || (startday == 6 && endday == 6) || (startday == 0 && endday == 0)){ // (토, 일), 토, 일 일때
							if (end > start){
								for (var i=start; i<end; i++) {
									sum += privateHoliday;
								} //for문 끝
							} else {
								for (var i=start; i<24; i++){
									sum += privateHoliday;
								}
								for (var i=0; i<end; i++){
									sum += privateHoliday;
								}
							}
						} else if (endday == 6 && startday == 5){ // 금, 토 일때
							for (var i=start; i<24; i++) {
								console.log('i : ' + i);
								console.log("금, 토 들어옴");
								if (8 <= i && i < 18) {
									sum += privateAm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else if (i >= 18 && i < 22) {
									sum += privatePm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else {
									sum += privateNight;
									console.log('여기까지 확인');
								}
							} //for문 끝
							for (var i=0; i<end; i++){
								sum += privateHoliday;
							}
						} else if (startday == 0 && endday == 1){ // 일, 월 일때
							for (var i=0; i<end; i++) {
								console.log('i : ' + i);
								if (8 <= i && i < 18) {
									sum += privateAm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else if (i >= 18 && i < 22) {
									sum += privatePm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else {
									sum += privateNight;
									console.log('여기까지 확인');
								}
							} //for문 끝
							for (var i=start; i<24; i++){
								sum += privateHoliday;
							}
						}
					}

		
		        } else if (sct_idx >= 2 && sct_idx <= 4) {
					//랩실 일 때
					console.log('랩실 sct_idx : ' + sct_idx);
					if (startday != 0 && startday != 6 && endday != 0 && endday != 6){ // 평일일때
						if (end > start){
							for (var i = start; i < end; i++) {
								console.log('i : ' + i);
								if (8 <= i && i < 22) {
									sum += labAm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else {
									sum += labNight;
									console.log('4인실 여기까지 확인');
								}
							}
						} else {
							for (var i=start; i<24; i++){
								sum += labAm;
							}
							for (var i=0; i<end; i++){
								sum += labAm;
							}
						}
					} else if ((startday == 6 && endday == 0) || (startday == 6 && endday == 6) || (startday == 0 && endday == 0)){ // (토, 일), 토, 일 일때
						if (end > start){
							for (var i=start; i<end; i++){
								sum += labHoliday;
							}
						} else {
							for (var i=start; i<24; i++){
								sum += labHoliday;
							}
							for (var i=0; i<end; i++){
								sum += labHoliday;
							}
						}
					} else if (endday == 6 && startday == 5){ // 금, 토 일때
						for (var i=start; i<24; i++){
							if (8 <= i && i < 22) {
								sum += labAm;
								console.log('i : ' + i + ', sum : ' + sum);
							} else {
								sum += labNight;
								console.log('4인실 여기까지 확인');
							}
						}
						for (var i=0; i<end; i++){
							sum += labHoliday;
						}
					} else if (startday == 0 && endday == 1){ // 일, 월 일때
						for (var i=0; i<end; i++){
							if (8 <= i && i < 22) {
								sum += labAm;
								console.log('평일 8시~22 시 : ' + price);
								console.log('i : ' + i + ', sum : ' + sum);
							} else {
								sum += labNight;
								console.log('4인실 여기까지 확인');
							}
						}
						for (var i=start; i<24; i++){
							sum += labNight;
						}
					}

		        } else {
					alert("담당자에게 연락주세여..");
				}
				
				console.log('최종 가격 확인 sum : ' + sum);
				$('#bookprice').html('<span>' + sum + '원</span>');
				
				$("input[name='price']").attr('value', sum);
				console.log("확인 price : " + sum + ", booknum : " + bookval);
					

			}, error: function(error){
				
			}
		})

	});
</script>

</head>
<body>
<div id="container">
	<br><br><br>
	<!-- 예약 헤더 -->
	<div id="chk">
		<ul>
			<li>
				<a class="menu" href="/TMS/book/booking">
					<b><span id="num" class="back">STEP1</span>
					<span id="select" class="select">날짜선택</span></b>
				</a>
			</li>
			<li>&gt;</li>
			<li>
				<a class="menu">
					<b><span id="num" class="back">STEP2</span>
					<span id="select" class="select">좌석선택</span></b>
				</a>
			</li>
			<li>&gt;</li>
			<li>
				<a class="menu">
					<b> <span id="num" class="noback">STEP3</span>
					<span id="select" class="click">결제하기</span></b>
				</a>
			</li>
		</ul>
	</div> <!-- 예약 헤더끝 -->
	
	<div class="boxoutside" style="border: 1px solid;">
		<form method="post" action="/TMS/book/payok">

			<div style="padding: 10px;">
				<h5>예매자 확인</h5>
				<span>☑ 일정 및 인원에 변동사항이 있는 경우는 가능한 빨리 전화로 알려주세요.</span><br>
				<span>☑ 취소의 경우 하루 전 6시까지만 가능하며 당일 취소의 경우 최소 기본비용(최소인원*2시간)을 지불하셔야 합니다.</span><br>
				<span>☑ 시간 추가를 원하시는 경우 반드시 카운터에 문의 바랍니다.</span>
			</div> <!-- 예매자 확인 끝 -->
			
			<div id="mybookinfo" style="padding: 10px;">
				<h5>나의 예약 정보</h5>
				<table border="1px solid;" class="table table-bordered" style="width: 100%; text-align: center;">
					<tbody>
						<tr>
							<td width="13%">예매번호</td>
							<td width="10%">예약자 이름</td>
							<td width="12%">연락처</td>
							<td width="30%">예약 날짜 및 시간</td>
							<td width="15%">선택 좌석정보</td>
							<td width="10%">사물함</td>
							<td width="10%">금액</td>
						</tr>
						<tr>
							<td id="booknum"></td>
							<td>${uservo.name }</td>
							<td>${uservo.phone }</td>
							<td>${bvo.start_time } ~ ${bvo.end_time }</td>
							<td>${bvo.sct_name } - ${bvo.s_col }</td>
							<td id="cb_idx"></td>
							<td id="bookprice"></td>
						</tr>
					</tbody>
				</table>
			</div> <!-- 나의 예약 정보 끝 -->
			<!--  -->
			<!-- 결제방식 선택 -->
			<div id="pay" class="radio" style="padding: 10px;">
				<h5>사용 가능한 쿠폰</h5>
				<select id="coupon">
					<option value="0">------</option>
				</select>
				<span id="finPrice"></span>
				<h5>결제방식 선택</h5>
				<label class="radio-inline"><input type="radio" name="pay" id="kakaopay" value="1">카카오페이</label>
				<label class="radio-inline"><input type="radio" name="pay" id="naverpay" value="2">네이버페이</label>
				<br>
				<div class="center" style="padding: 10px;">
					<button type="button" onclick="history.back(); return false;">이전단계</button>&nbsp;
					<button type="button" onclick="nextSubmit(this.form)">다음단계</button>
				</div>
				
				<input type="hidden" name="s_idx" value="${svo.s_idx }">
				<input type="hidden" name="start_time" value="${bvo.start_time }">
				<input type="hidden" name="end_time" value="${bvo.end_time }">
				<input type="hidden" name="booknum" value="">
				<input type="hidden" name="price" value="" id="hiddenPrice">
				<input type="hidden" name="s_col" value="${bvo.s_col }">
				<input type="hidden" name="sct_name" value="${bvo.sct_name }">
				<input type="hidden" name="cb_idx" value="">
				<input type="hidden" name="chkLen" value="">
			</div> <!-- 결제방식 선택 끝  -->
		</form>
		
	</div> <!-- 박스 아웃사이드 끝 --><br><br><br>
	<!--  -->지금예약 : ${bvo }<br>${uservo }<br>${svo }<br>${idx }<br>${cb }
	
</div> <!-- 바디 콘테이너 끝 -->
<script>
window.finalPrice = 0;
$(document).ready(function(){
	
	$.ajax({
		url: "/couponList",
		type: "get",
		data: {"id":"${usersVO.id}"},
		dataType: "json",
		success: function(result){
			
			var html = "";
			if (result == ""){
				html += "<option value='0' type='0' price='0'>없음</option>";
			}else {
				$.each(result, function(index, value){
					if ((value.cb_roomtype == 'LAB' && sct_idx != 1) || (value.cb_roomtype == 'PRIVATE' && sct_idx == 1)){
						html += "<option value='"+value.cp_idx+"' type='"+value.cb_distype+ "' price='"+value.cb_discount+"'>"+ value.cb_name+ " "+ value.cb_discount;
						if (value.cb_distype == 'PERCENT'){
							html += "%";
						}else if (value.cb_idstype == 'PRICE'){
							html += "원";
						}
						html += "("+value.cp_quantity+" 개)";
						html += "</option>";
					}
				});
			}
			$("#coupon").append(html);
			
		}, error: function(error){
			
		}
	});
});

$("#coupon").on("change", function(){
	fianlPrice = sum;
	var option = $('option:selected', this);
	window.cp_idx = option.attr("value");
	var type = option.attr("type");
	var price = option.attr("price");
	console.log("cp_idx: "+ cp_idx);
	var couponPrice = "";
	// 퍼센트 쿠폰
	if (type == 'PERCENT'){
		finalPrice = (finalPrice * (100 - price)) / 100;
		couponPrice += "쿠폰 적용 가격: "+ sum+ " * "+ ((100 - price) / 100) + " = <span style='color: red;'>"+ finalPrice+ "</span> 원";
	}
	
	// 금액 쿠폰
	if (type == 'PRICE'){
		finalPrice -= price;
		couponPrice += "쿠폰 적용 가격: "+ sum+ " - "+ price + " = <span style='color: red;'>"+ finalPrice+ "</span> 원";
	}
	finalPrice = Math.floor(finalPrice);
	$("#finPrice").html(couponPrice);
})

function nextSubmit(frm){
	if (fianlPrice == 0){
		finalPrice = sum;
	}
	$("#hiddenPrice").val(finalPrice);
	console.log("여긴 온다");
	$.ajax({
		url: '/minusCoupon',
		type: 'get',
		data: {'cp_idx':cp_idx},
		dataType: 'text',
		success: function(result){
			if (result == 'success'){
				console.log("성공");
				frm.submit();
			} else if(result == 'fail') {
				alert("예매 진행에 실패하였습니다.\n관리자에게 문의 해주세요.");
				return false;
			}
		}, error: function(error){
			alert("예매 진행에 실패하였습니다.\n관리자에게 문의 해주세요.");
			return false;
		}
	})
}
</script>
</body>
</html>