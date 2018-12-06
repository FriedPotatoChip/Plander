<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>

	<form action="/Plander/write/detail" method="post">
	<input type="hidden" value="${PlannerVO.p_idx }" name="p_idx">
		<table>
			<tr>
				<th>시작시간</th>
				<td><input type="time" name="pd_start_time"></td>
			</tr>
			<tr>
				<th>끝시간</th>
				<td><input type="time" name="pd_end_time"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="pd_content"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"></td>
			</tr>
		</table>
	</form>
	시작일: ${startD}<br>
	끝일: ${endD}
	
</body>
</html>