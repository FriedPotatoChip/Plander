<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 완료</title>
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
	function main() {
		window.opener.top.location.href="/TMS/book";
		window.close();
	}
	
	function mypage() {
		window.opener.top.location.href="/TMS/my";
		window.close();
	}
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
	
	<div class="center boxoutside" style="border: 1px solid;">
		<br><br><br>
		<img src="/resources/images/turtle.png" alt="거북이">
		<h4>${uservo.name } 님 예약이 완료되었습니다!</h4>
		
		<p>문의사항이 있으시다면 [ Q&A ] 로 문의하시기 바랍니다.</p>
		
		<!-- 예약정보 -->
		<div id="mybookinfo" style="padding: 10px;">
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
						<td id="booknum">${bvo.booknum }</td>
						<td>${uservo.name }</td>
						<td>${uservo.phone }</td>
						<td>${bvo.start_time } ~ ${bvo.end_time }</td>
						<td>${bvo.sct_name } - ${bvo.s_col }</td>
						<td>${cb.cb_idx }</td>
						<td id="bookprice">${bvo.price }</td>
					</tr>
				</tbody>
			</table>
		</div> <!-- 나의 예약 정보 끝 -->
		
		<div class="center" style="padding: 10px;">
			<button type="button" onclick="main()">메인으로</button>
			<button type="button" onclick="mypage()">마이페이지</button>
		</div>
		<br><br><br>
	</div>
	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>