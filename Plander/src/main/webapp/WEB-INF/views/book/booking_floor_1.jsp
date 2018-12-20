<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		//var size = document.getElementsByName('s_col').length;
		var bookroomlist = '<c:out value='${bookroomlist}' />';
		var size = '${fn:length(bookroomlist) }';
		alert("bookroomlist.legnth : " + size); //예약된 좌석 수
		
		for (var i=0; i<= size; i++) {
			<c:forEach var='k' items='${bookroomlist }'>
				var bookseat = '${k.s_col }';
				var sct = '${k.sct_idx }';
				
				
				//예약된 좌석과 디비의 s_col 값이 같은 건 disabled
				if ( bookseat == document.getElementsByName('s_col')[i].value) {
					alert("예약된 값 : " + bookseat );
					//$('#seatinfo').html("<span>A-" + document.getElementsByName('s_col')[i].value + "</span>");
					$(document.getElementsByName('s_col')[i]).attr('disabled', true);
					break;
				} 
			</c:forEach>
		}
		
		
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
	
	.boxoutside::after, #myselect::after {
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
	${bookroomlist }
	<div id="ticket">
		<div class="boxoutside" style="border: 1px solid;">
		<form method="get">
			
			<div>
				<h4><a href="">1층</a>&nbsp;&nbsp;&nbsp;
				<a href="">2층</a></h4>
				<p style="font-style: italic;">랩실은 4인실 기준 최소 3인 이상 단체예약만 가능합니다.</p>
				<span>인원 수 선택 : </span>
				<select id="people">
					<option value="1">단체</option>
				</select>
			</div>
			<hr>
			<script>
			function chkseat(frm) {
				//4인실 : sct_idx = 2
				//8인실 : sct_idx = 3
				//12인실 : sct_idx = 4
				//sct_idx 값이 2 : 4인실 빼고 체크박스 disabled, 3 : 8인실 빼고 disabled, 4 : 12인실 빼고 disabled
				
				if ( $('input:checkbox[id="4room"]').is(":checked") == true) {
					$('#sct_idx').val('2');
				} else if ( $('input:checkbox[id="8room"]').is(":checked") == true) {
					$('#sct_idx').val('3');
				} else if ( $('input:checkbox[id="12room"]').is(":checked") == true) {
					$('#sct_idx').val('4');
				} else {
					alert("ㅋㅋ ");
					return false;
				}
				
				frm.action = "/test.jsp";
				frm.submit();
			}
			</script>
			
		<div id="allseat">
			<input type="hidden" id="sct_idx" name="sct_idx" value="">
			<div>
				<div class="checkbox" style="width: 100%; display: table;">
					<div id="4people" style="display: inline-table; width: 20%; height: 100px; margin: 0 3% 0 3%; border: 1px solid;">
						<p><label><input type="checkbox" id="4room" name="s_col" value="1">4인실</label></p>
					</div>
					
					<div id="8people" style="display: inline-table; width: 25%; height: 100px; margin-right: 3%; border: 1px solid;">
						<p><label><input type="checkbox" id="8room" name="s_col" value="1">8인실</label></p>
					</div>
					
					<div id="8people" style="display: inline-table; width: 25%; height: 100px; margin-right: 3%; border: 1px solid;">
						<p><label><input type="checkbox" id="8room" name="s_col" value="2">8인실</label></p>
					</div>
				</div>
				<br>
				
				<div class="checkbox" style="width: 100%; display: table;">
					<div id="4people" style="display: inline-table; width: 20%; height: 100px; margin: 0 3% 0 3%; border: 1px solid;">
						<p><label><input type="checkbox" id="4room" name="s_col" value="2">4인실</label></p>
					</div>
					
					<div id="12people" style="display: inline-table; width: 53%; height: 100px; margin-right: 3%; border: 1px solid;">
						<p><label><input type="checkbox" id="12room" name="s_col" value="1">12인실</label></p>
					</div>
					
					<div id="4people" style="display: inline-table; width: 15%; height: 100px; margin-right: 3%; border: 1px solid;">
						<p><label><input type="checkbox" name="s_col" value="100">카페 터틀🐢</label></p>
					</div>
				</div>
				<br>
			</div> <!-- 1번 열 끝 -->
		</div>
		
			<!-- 선택 정보 -->
			<p>선택 정보</p>
			<table border="1px solid;" class="table table-bordered" style="width: 45%;">
				<tr>
					<td width="15%">날짜</td>
					<td width="15%">시간</td>
					<td width="15%">선택 좌석정보</td>
				</tr>
				<tr>
					<td>18/12/17 ~ 18/12/19</td>
					<td>PM 5:00 ~ 7:00</td>
					<td>4인실</td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="3" style="text-align: center;">
							<button type="button" class="btn btn-default" onclick="history.back(); return false;">이전단계</button>&nbsp;
							<button type="button" class="btn btn-default" onclick="chkseat(this.form)">다음단계</button>
						</td>
					</tr>
				</tfoot>
			</table>
			<br>
		</form>
		
		</div> <!-- 박스 아웃사이드 끝 -->
	</div> <!-- 티켓 끝 -->


</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>