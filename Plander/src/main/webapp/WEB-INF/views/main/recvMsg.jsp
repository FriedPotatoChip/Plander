<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 나눔스퀘어  -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="/commons/head.jsp"></jsp:include>

<style>
.container {
	width: 80%;
	margin: 50px auto;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}
</style>
</head>
</head>

<body>
	<div class="container"
		style="border: 1px solid lightgray; padding: 30px;">
		<h4 class="text-center"
			style="text-decoration: underline; color: #475C7A; margin-bottom: 20px;">
			쪽지</h4>
		<form action="/TMS/sendMsg" method="post" id="msgForm">
			<table>
				<tr>
					<th>보낸이</th>
					<td><c:if test='${empty msg.user_profileImagePath }'>
							<img class="user" src="/resources/images/users.png" alt="user"
								style="width: 30px; height: 30px; border-radius: 50%;" />
						</c:if> <c:if test='${not empty msg.user_profileImagePath }'>
							<img class="user" src="${msg.user_profileImagePath }" alt="user"
								style="width: 30px; height: 30px; border-radius: 50%;" />
						</c:if> ${msg.send_id }</td>
				</tr>
				<tr>
					<th>보낸날짜</th>
					<td><fmt:formatDate value="${msg.regdate }"
							pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${msg.title }</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="12" cols="50" name="content"
							id='content' placeholder="content" style="width: 100%;" readonly>${msg.content }</textarea></td>
				</tr>
			</table>
		</form>
		<div style="margin-top: 20px;">
			<p align="right">
				<button type="reset" onclick="closeMsg()"
					class="btn my-1 btn-inline"
					style="background-color: #685D79; color: white;">닫기</button>
			</p>
		</div>
	</div>

	<script>
		$(function() {
		});
		function closeMsg() {
			window.close();
		}
	</script>
</body>
</html>