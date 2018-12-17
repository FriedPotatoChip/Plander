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
	/* .box { float: left; } */
	.boxoutside::after {
		content: "";
		clear: both;
		display: table;
	}
	
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
			
			<div>
				<h4><a href="">1층</a>&nbsp;&nbsp;&nbsp;
				<a href="">2층</a></h4>
			</div>
			<hr>
			
			<div id="seat" class="box checkbox">
				<table border="1px solid;">
					<tr>
						<td width="10%"><label><input type="checkbox" name="s_col" value="1">A-1</label></td>
						<td width="10%"><label><input type="checkbox" name="s_col" value="2">A-2</label></td>
						<td width="10%"><label><input type="checkbox" name="s_col" value="3">A-3</label></td>
						<td width="10%"><label><input type="checkbox" name="s_col" value="4">A-4</label></td>
						<td width="10%"><label><input type="checkbox" name="s_col" value="5">A-5</label></td>
					</tr>
				</table>
			</div>
			
			<!-- 선택 정보 -->
			<div id="myselect" class="box">
				<p>2층 개인석 A-3</p>
				<p>${BRidx }, ${SCTidx }</p>
				<p>가격 </p>
			</div>
			<button type="submit" class="btn btn-default btn-lg" onclick="">다음단계</button>
		</form>
		
		</div> <!-- 박스 아웃사이드 끝 -->
	</div> <!-- 티켓 끝 -->


</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>