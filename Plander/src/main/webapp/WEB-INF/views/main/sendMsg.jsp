<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 나눔스퀘어  -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
/* 나눔스퀘어 */
* {
	font-family: 'NanumSquare', sans-serif;
	margin: 0;
}

.normal { 
	font-weight: 400
}

.bold {
	font-weight: 700
}

.bolder {
	font-weight: 800
}

.light {
	font-weight: 300
}
</style>
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

	<h3>쪽지 보내기</h3>
	<hr>
	
	<form action="/TMS/sendMsg" method="post" id="msgForm">
		<input type="hidden" name="send_id" value="${usersVO.id }">
		<input type="hidden" name="recv_id" value="${recv_user.id }">
		<table>
			<tr>
				<th>받는이</th>
				<td>
					<c:if test='${empty recv_user.user_profileImagePath }'>
						<img class="user" src="/resources/images/users.png" alt="user" style="width:30px; height: 30px; border-radius: 50%;"/>
					</c:if>
					<c:if test='${not empty recv_user.user_profileImagePath }'>
						<img class="user" src="${recv_user.user_profileImagePath }" alt="user" style="width:30px; height: 30px; border-radius: 50%;"/>
					</c:if> 
					${recv_user.id }
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="" id="title" placeholder="title"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="12" cols="50" name="content" id='content' placeholder="content" style="width: 100%;"></textarea></td>
			</tr>
		</table>
		<input type="button" value="닫기" onclick="closeMsg()">
		<input type="button" value="보내기" onclick="sendMsg()">
	</form>

<script>
$(function(){
	$("#title").focus();
});
function closeMsg(){
	window.close();
}	
function sendMsg(){
	var title = $("#title").val();
	var content = $("#content").val();
	console.log("title: "+ title);
	console.log("content: "+ content);
	if (title == ""){
		alert("제목을 입력해 주세요.");
		$("#title").focus();
		return false;
	}
	if (content == ""){
		alert("내용을 입력해 주세요");
		$("#content").focus();
		return false;
	}
	var formData = $("#msgForm").serialize();
	$.ajax({
		url: '/sendMsg',
		type: 'post',
		data: formData,
		dataType: 'text',
		success: function(result){
			if (result == 'success'){
				alert("쪽지를 보냈습니다.");
				window.close();
			} else {
				alert("쪽지를 보내는데 실패했습니다.")
			}
		}, error: function(error){
				alert("쪽지를 보내는데 실패했습니다.")
		}
	})
}
</script>
</body>
</html>