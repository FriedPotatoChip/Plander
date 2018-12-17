<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<tr>
		<td>${vo.rc_idx }</td>
		<td>${vo.rc_title }</td>
		<td>${vo.rc_content }</td>
		<td>${vo.id }</td>
		<td>${vo.cur_mem }</td>
		<td>${vo.max_mem }</td>
		<td>${vo.rc_regdate }</td>
	</tr>
</body>
</html>