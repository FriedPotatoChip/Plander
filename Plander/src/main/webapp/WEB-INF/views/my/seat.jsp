<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seat</title>
</head>
<body>
	<tr>
		<th>BK_IDX</th>
		<th>ID</th>
		<th>S_ROW</th>
		<th>S_COL</th>
		<th>START_TIME</th>
		<th>END_TIME</th>
		<th>BK_REGDATE</th>
	</tr>
	<c:forEach var="seat" items="${seat }">
		<tr>
			<td>${seat.bk_idx }</td>
			<td>${seat.id }</td>
			<td>${seat.s_row }</td>
			<td>${seat.s_col }</td>
			<td>${seat.start_time }</td>
			<td>${seat.end_time }</td>
			<td>${seat.bk_regdate }</td>
		</tr>
	</c:forEach>
</body>
</html>