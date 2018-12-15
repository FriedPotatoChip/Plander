<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 페이지</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->

<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
	.center { text-align: center; }
	
	/* 지점 좌석 현황 및 요금 */
	.boxoutside {
		width: 100%;
		height: auto;
	}
	.box { float: left; }
	.boximg { width: 60%; height: 312px; overflow: hidden; }
	.boxprice { width: 40%; padding: 10px; }
	.boxoutside::after {
		content: "";
		clear: both;
		display: table;
	}
	
</style>

</head>
<body>
<div id="container">
<!-- 헤더 --><br>

<div style="box-sizing: border-box;">
	<h3>1호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="box boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do1.jpg" style="width: auto; height: auto;">
		</div>
		
		<div class="box boxprice">
			<p>예약가능 좌석</p>
			<p>개인석 16 석<br>
			랩실 4인실 1 석 / 8인실 0 석 / 12인실 1 석</p>
			<hr>
			<table border="1px solid" style="width: 100%;">
				<thead>
					<tr>
						<td width="30%;"></td>
						<th width="35%;" class="center">1인/2인</th>
						<th width="35%;" class="center">3인 이상</th>
					</tr>
				</thead>
				<tr>
					<td>평일 8:00 ~ 18:00</td>
					<td class="center">1시간 1,900원</td>
					<td class="center">1시간 1,500원</td>
				</tr>
				<tr>
					<td>평일 18:00 이후</td>
					<td class="center">1시간 1,800원</td>
					<td class="center">1시간 2,500원</td>
				</tr>
				<tr>
					<td>주말/공휴일</td>
					<td class="center">1시간 2,500원</td>
					<td class="center">1시간 1,800원</td>
				</tr>
			</table><br>
			<button type="button" class="btn btn-outline-secondary"
				onclick="">예약하기</button>
		</div>
	</div>
</div> <!-- 1 호점 끝 -->

<br><br><br>
<div style="box-sizing: border-box;">
	<h3>2호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="box boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do2.jpg" style="width: auto; height: auto;">
		</div>
		
		<div class="box boxprice">
			<p>예약가능 좌석</p>
			<p>개인석 35 석<br>
			랩실 4인실 1 석 / 8인실 2 석 / 12인실 0 석</p>
			<hr>
			<table border="1px solid" style="width: 100%;">
				<thead>
					<tr>
						<td width="30%;"></td>
						<th width="35%;" class="center">1인/2인</th>
						<th width="35%;" class="center">3인 이상</th>
					</tr>
				</thead>
				<tr>
					<td>평일 8:00 ~ 18:00</td>
					<td class="center">1시간 1,900원</td>
					<td class="center">1시간 1,500원</td>
				</tr>
				<tr>
					<td>평일 18:00 이후</td>
					<td class="center">1시간 1,800원</td>
					<td class="center">1시간 2,500원</td>
				</tr>
				<tr>
					<td>주말/공휴일</td>
					<td class="center">1시간 2,500원</td>
					<td class="center">1시간 1,800원</td>
				</tr>
			</table><br>
			<button type="button" class="btn btn-outline-secondary">예약하기</button>
		</div>
	</div>
</div> <!-- 2 호점 끝 -->

<br><br><br>
<div style="box-sizing: border-box;">
	<h3>3호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="box boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do3.jpeg" style="width: auto; height: auto;">
		</div>
		
		<div class="box boxprice">
			<p>예약가능 좌석</p>
			<p>개인석 35 석<br>
			랩실 4인실 1 석 / 8인실 2 석 / 12인실 0 석</p>
			<hr>
			<table border="1px solid" style="width: 100%;">
				<thead>
					<tr>
						<td width="30%;"></td>
						<th width="35%;" class="center">1인/2인</th>
						<th width="35%;" class="center">3인 이상</th>
					</tr>
				</thead>
				<tr>
					<td>평일 8:00 ~ 18:00</td>
					<td class="center">1시간 1,900원</td>
					<td class="center">1시간 1,500원</td>
				</tr>
				<tr>
					<td>평일 18:00 이후</td>
					<td class="center">1시간 1,800원</td>
					<td class="center">1시간 2,500원</td>
				</tr>
				<tr>
					<td>주말/공휴일</td>
					<td class="center">1시간 2,500원</td>
					<td class="center">1시간 1,800원</td>
				</tr>
			</table><br>
			<button type="button" class="btn btn-outline-secondary">예약하기</button>
		</div>
	</div>
</div> <!-- 3 호점 끝 -->

<br>
<!-- 풋터 -->

</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>