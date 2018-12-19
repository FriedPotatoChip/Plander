<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 선택</title>
<!-- 부트스트랩 ================================================================================ -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- ========================================================================================= -->

<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<script>
	//DB에서 예약된 좌석이랑 비교해서 체크박스 disabled
	/* $().ready(function(){
		var size = document.getElementsByName('s_col').length;
		alert("size : " + size);
		
		var booklist = '<c:out value='${booklist}' />';
		
		for (var i=0; i<= size; i++) {
			<c:forEach var='k' items='${booklist }'>
				var bookseat = '${k.s_col }';
					if ( bookseat == document.getElementsByName('s_col')[i].value) {
						alert("예약된 값 : " + bookseat );
						//$('#seatinfo').html("<span>A-" + document.getElementsByName('s_col')[i].value + "</span>");
						$(document.getElementsByName('s_col')[i]).attr('disabled', true);
						break;
					}
			</c:forEach>
			
		}
		
	}); */
	

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
	.boxoutside::after, #allseat::after {
		content: "";
		clear: both;
		display: table;
	}
	#row { padding: 10px; }
	#allseat, #myselect { width: 93%; margin-left: auto; margin-right: auto; }
	
</style>

</head>
<body>
<div id="container" style="box-sizing: border-box;">
	<h4><a href="">날짜 선택</a>&nbsp;&nbsp;&nbsp;
	<a href="">좌석 선택</a></h4>
	<hr>
	
	<div id="ticket">
		<div class="boxoutside" style="border: 1px solid;">
		<form method="get" onsubmit="seatchk()">
			
			<div>
				<h4><a href="">1층</a>&nbsp;&nbsp;&nbsp;
				<a href="">2층</a></h4>
			</div>
			<hr>
			
		<div id="allseat">	
			<div id="row" class="box">
				<div class="4people checkbox" style="width: 100%;">
					<div id="room" style="width: 25%; height: 100px; margin: 0.5rem; padding: 0; border: 1px solid;">
						<p><label><input type="checkbox" name="s_col" value="">4인실</label></p>
					</div>
				</div>
				
				<div class="4people checkbox" style="width: 100%;">
					<div id="room" style="width: 25%; height: 100px; margin: 0.5rem; padding: 0; border: 1px solid;">
						<p><label><input type="checkbox" name="s_col" value="">4인실</label></p>
					</div>
				</div>
				
			</div> <!-- 1번 열 끝 -->
			
			<!-- 
			<div id="row" class="box">
				<div class="8people checkbox" style="display: table; table-layout: fixed; width: 100%;">
					<div id="room" style="display: inline-table; width: 50%; height: 100px; margin: 0.5rem; padding: 0; border: 1px solid;">
						<p><label><input type="checkbox" name="s_col" value="">8인실</label></p>
					</div>
				</div>
				
			</div> 2번 열 끝
			 -->
			
		</div>
		
			<!-- 선택 정보 -->
			<div id="myselect" style="border: 1px solid;">
				<h4>선택 정보</h4>
				<p id="seatinfo"></p>
				<p id="seatprice">2000원</p>
			</div>
			<br>
			<button type="submit" class="btn btn-default btn-lg"
				style="float: right; margin: 0 15px 15px 0;">다음단계</button>
			
		</form>
		
		</div> <!-- 박스 아웃사이드 끝 -->
	</div> <!-- 티켓 끝 -->


</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>