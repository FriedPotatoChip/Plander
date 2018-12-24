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
	$().ready(function(){
		var size = document.getElementsByName('s_col').length;
		alert("size : " + size);
		var booklist = '<c:out value='${booklist}' />';
		
		<c:forEach var='k' items='${booklist }'>
			var bookseat = '${k.s_col }';
			console.log("s_col : " + bookseat);
				
			for (var i=0; i<= size; i++) {
				//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
				if ( bookseat == document.getElementsByName('s_col')[i].value) {
					alert("예약된 값 : " + bookseat );
					//$('#seatinfo').html("<span>A-" + document.getElementsByName('s_col')[i].value + "</span>");
					$(document.getElementsByName('s_col')[i]).attr('disabled', true);
					break;
				}
			}
		</c:forEach>
		
		//선택한 인원 수와 체크된 박스 수가 같을 때 나머지 체크박스 disabled
		$(":checkbox").change(function() {
			var cnt = $("#people").val(); //선택된 인원 수
			if (cnt == $(":checkbox:checked").length) {
				$(":checkbox:not(:checked)").attr("disabled", true);
			} else {
				$(":checkbox").removeAttr("disabled");
				<c:forEach var='k' items='${booklist }'>
					var bookseat = '${k.s_col }';
					console.log("s_col : " + bookseat);
					
					for (var i=0; i<= size; i++) {
						//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
						if ( bookseat == document.getElementsByName('s_col')[i].value) {
							$(document.getElementsByName('s_col')[i]).attr('disabled', true);
							break;
						}
					}
				</c:forEach>
			}
		});
		
	});

</script>
<script>
	//인원수를 바꾸면 : db에 값이 있는건 disabled, 나머지는 체크해제
	$("#people").change(function() {
		$(":checkbox").removeAttr("checked");
		$(":checkbox").removeAttr("disabled");
		
		var size = document.getElementsByName('s_col').length;
		alert("size : " + size);
		var booklist = '<c:out value='${booklist}' />';
		
		<c:forEach var='k' items='${booklist }'>
			var bookseat = '${k.s_col }';
				
			for (var i=0; i<= size; i++) {
				//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
				if ( bookseat == document.getElementsByName('s_col')[i].value) {
					$(document.getElementsByName('s_col')[i]).attr('disabled', true);
					break;
				}
			}
		</c:forEach>
		
	});

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
	.boxoutside::after, #allseat::after, #myselect::after {
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
	<h4><a href="/TMS/book/booking">날짜 선택</a></h4>
	<hr>
	
	<div id="ticket">
		<div class="boxoutside" style="border: 1px solid;">
		<form method="post" action="/TMS/book/pay">
			
			<div>
				<h4><a href="">1층</a>&nbsp;&nbsp;&nbsp;
				<a href="">2층</a></h4>
				<p style="font-style: italic;">1인 2석까지 예약 가능합니다.</p>
				<span>인원 수 선택 : </span>
				<select id="people">
					<option value="1">1명</option>
					<option value="2">2명</option>
				</select>
			</div>
			<hr>
			
		<div id="allseat">	
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="1" end="5" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="6" end="10" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="11" end="15" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="16" end="20" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="21" end="25" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="26" end="30" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						
					</table>
				</div>
			</div> <!-- 1번 열 끝 -->
			
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="31" end="33" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="34" end="36" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="49" end="51" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="52" end="54" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						
					</table>
				</div>
				
			</div> <!-- 2번 열 끝 -->
			
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="37" end="39" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="40" end="42" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
					</table>
				</div><br>
				
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="55" end="57" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="58" end="60" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
					</table>
				</div>
			</div> <!-- 3번 열 끝 -->
			
			<div id="row" class="box">
				<div id="seat" class="checkbox">
					<table border="1px solid;" class="table table-bordered">
						<tr>
							<c:forEach var="i" begin="43" end="45" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="46" end="48" step="1">
								<td><label><input type="checkbox" name="s_col" value="${i }">A-${i }</label></td>
							</c:forEach>
						</tr>
						
					</table>
				</div>
			</div> <!-- 4번 열 끝 -->
			
		</div>
		
			<!-- 선택 정보 -->
			<p>선택 정보</p>
			<table border="1px solid;" class="table table-bordered" style="width: 55%;">
				<tr>
					<td width="30%">날짜/시간</td>
					<td width="25%">선택 좌석정보</td>
				</tr>
				<tr>
					<td>${bvo.start_time } ~ ${bvo.end_time }</td>
					<td id="msg"></td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="3" style="text-align: center;">
							<button type="button" class="btn btn-default" onclick="history.back(); return false;">이전단계</button>&nbsp;
							<button type="submit" class="btn btn-default">다음단계</button>
						</td>
					</tr>
				</tfoot>
			</table>
			<br>
			예약한 새럼들 : ${booklist }
			<hr>
			지금 예약하는애 : ${bvo }
			<script>
				
			</script>
			
		</form>
		
		</div> <!-- 박스 아웃사이드 끝 -->
	</div> <!-- 티켓 끝 -->


</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>