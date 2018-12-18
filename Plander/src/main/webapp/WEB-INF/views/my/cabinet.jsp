<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cabinet</title>
</head>
<body>
	<tr>
		<th>CKB_IDX</th>
		<th>ID</th>
		<th>START_DATE</th>
		<th>END_DATE</th>
		<th>CB_NUMBER</th>
		<th>CKB_REGDATE</th>
	</tr>
		<c:forEach var="cabinet" items="${cabinet }">
		<tr>
			<td>${cabinet.ckb_idx }</td>
			<td>${cabinet.id }</td>
			<td>${cabinet.start_date }</td>
			<td>${cabinet.end_date }</td>
			<td>${cabinet.cb_number }</td>
			<td>${cabinet.ckb_regdate }</td>
		</tr>
	</c:forEach>
</body>
</html>