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
	.boximg {
		display: block;
		width: 75%; height: auto;
		margin-left: auto; margin-right: auto;
		overflow: hidden;
	}
	
	.boxoutside::after {
		content: "";
		clear: both;
		display: table;
	}
	
	.price {
		display: block;
		width: 75%;
		margin-left: auto; margin-right: auto;
	}
	
</style>

</head>
<body>
<div id="container">
<!-- 헤더 --><br>

<div class="price">
	<table border="1px solid" style="width: 100%;">
		<thead>
			<tr>
				<td width="30%;"></td>
				<th width="35%;" class="center">개인석(1인)</th>
				<th width="35%;" class="center">4인/8인/12인</th>
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
	</table>
</div>
<br>

<div style="box-sizing: border-box;">
	<h3>1호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do1.jpg" style="width: auto; height: auto;">
		</div>
		<br>
		<form method="post" action="/TMS/book/booking" onsubmit="">
			<input type="hidden" name="br_idx" value="1">
			<button type="submit" class="btn btn-outline-secondary" style="float: right;">예약하기</button>
		</form>
	</div> <!-- boxoutside 끝 -->
</div> <!-- 1 호점 끝 -->

<br><br><br>
<div style="box-sizing: border-box;">
	<h3>2호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do2.jpg" style="width: auto; height: auto;">
		</div>
		<br>
		<form method="post" action="/TMS/book/booking" onsubmit="">
			<input type="hidden" name="br_idx" value="2">
			<button type="submit" class="btn btn-outline-secondary" style="float: right;">예약하기</button>
		</form>
	</div> <!-- boxoutside 끝 -->
</div> <!-- 2 호점 끝 -->

<br><br><br>
<div style="box-sizing: border-box;">
	<h3>3호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do3.jpeg" style="width: auto; height: auto;">
		</div>
		<br>
		<form method="post" action="/TMS/book/booking" onsubmit="">
			<input type="hidden" name="br_idx" value="3">
			<button type="submit" class="btn btn-outline-secondary" style="float: right;">예약하기</button>
		</form>
	</div> <!-- boxoutside 끝 -->
</div> <!-- 3 호점 끝 -->

<br>
<!-- 풋터 -->

</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>