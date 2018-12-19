<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_comment</title>
</head>
<body>
	<tr>
		<th>C_IDX</th>
		<th>C_CONTENT</th>
		<th>B_IDX</th>
		<th>ID</th>
		<th>C_REGDATE</th>
		<th>RP_IDX</th>
		<th>RC_IDX</th>
	</tr>
	<c:forEach var="board_comment" items="${board_comment }">
		<tr>
			<td>${board_comment.c_idx }</td>
			<td>${board_comment.c_content }</td>
			<td>${board_comment.b_idx }</td>
			<td>${board_comment.id }</td>
			<td>${board_comment.c_regdate }</td>
			<td>${board_comment.rp_idx }</td>
			<td>${board_comment.rc_idx }</td>
		</tr>
	</c:forEach>
</body>
</html>