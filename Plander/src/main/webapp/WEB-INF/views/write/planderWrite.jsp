<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 작성 메인</title>
<script>

</script>
</head>
<body>
	<h1>플래너 작성 페이지 임돠</h1>
	
	<form action="/Plander/write" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="p_title"></td>
			</tr>
			<tr>
				<th>시작일</th>
				<td><input type="date" name="p_start_date"></td>
			</tr>
			<tr>
				<th>끝일</th>
				<td><input id="dateChk" type="date" name="p_end_date"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"></td>
			</tr>
		</table>
	</form>
	
	
	
	
	
	
	
	
	
	
</body>
</html>