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
	<div>
		<form>
			<!-- 결제 정보 -->
			<p>나의 예약 정보</p>
			<table border="1px solid;" class="table table-bordered" style="width: 25%;">
				<tbody>
					<tr>
						<td width="40%">날짜/시간</td>
						<td width="60%">2018-12-20 11:49 ~ 2018-12-21 11:50</td>
					</tr>
					<tr>
						<td>선택 좌석정보</td>
						<td>개인석 A-3</td>
					</tr>
					<tr>
						<td>금액</td>
						<td>1,800원</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="button" class="btn btn-default">이전단계</button>&nbsp;
							<button type="button" class="btn btn-default">다음단계</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		
	</div>
	
	<div>
		<!-- 선택 정보 -->
	
	</div>

</div>

</body>
</html>