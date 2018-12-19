<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board</title>
</head>
<body>
	<tr>
		<th>RC_IDX</th>
		<th>RC_TITLE</th>
		<th>RC_CONTENT</th>
		<th>ID</th>
		<th>CUR_MEM</th>
		<th>MAX_MEM</th>
		<th>RC_REGDATE</th>
	</tr>
	<c:forEach var="board" items="${board2 }">
		<tr>
			<td>${board.rc_idx }</td>
			<td>${board.rc_title }</td>
			<td>${board.rc_content }</td>
			<td>${board.id }</td>
			<td>${board.cur_mem }</td>
			<td>${board.max_mem }</td>
			<td>${board.rc_regdate }</td>
		</tr>
	</c:forEach>
</body>
</html>