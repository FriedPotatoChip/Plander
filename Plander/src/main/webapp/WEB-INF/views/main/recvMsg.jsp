<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
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

<body>

	<h3>받은 쪽지함</h3>
	<hr>
	
	<form action="/TMS/sendMsg" method="post" id="msgForm">
		<table>
			<tr>
				<th>보낸이</th>
				<td>
					<c:if test='${empty msg.user_profileImagePath }'>
						<img class="user" src="/resources/images/users.png" alt="user" style="width:30px; height: 30px; border-radius: 50%;"/>
					</c:if>
					<c:if test='${not empty msg.user_profileImagePath }'>
						<img class="user" src="${msg.user_profileImagePath }" alt="user" style="width:30px; height: 30px; border-radius: 50%;"/>
					</c:if> 
					${msg.send_id }&nbsp;<span style="font-size: 0.6em; color: gray;"><fmt:formatDate value="${msg.regdate }" pattern="yyyy-MM-dd HH:mm"/></span>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${msg.title }</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="12" cols="50" name="content" id='content' placeholder="content" style="width: 100%;" readonly>${msg.content }</textarea></td>
			</tr>
		</table>
		<input type="button" value="닫기" onclick="closeMsg()">
	</form>

<script>
$(function(){
});
function closeMsg(){
	window.close();
}	
</script>
</body>
</html>