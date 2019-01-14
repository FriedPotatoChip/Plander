<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/commons/head.jsp"></jsp:include>

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
}

.container {
	width: 60%;
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

<body>
	<div class="container">
		<h1 class="text-center">쪽지 보내기</h1>
		<hr>
		<form action="/TMS/sendMsg" method="post" id="msgForm">
			<input type="hidden" name="send_id" value="${usersVO.id }"> <input
				type="hidden" name="recv_id" value="${recv_user.id }">
			<table>
				<tr>
					<th class="normal">받는이</th>
					<td><c:if test='${empty recv_user.user_profileImagePath }'>
							<img class="user" src="/resources/images/users.png" alt="user"
								style="width: 30px; height: 30px; border-radius: 50%;" />
						</c:if> <c:if test='${not empty recv_user.user_profileImagePath }'>
							<img class="user" src="${recv_user.user_profileImagePath }"
								alt="user"
								style="width: 30px; height: 30px; border-radius: 50%;" />
						</c:if> ${recv_user.id }</td>
				</tr>
				<tr>
					<th class="normal">제목</th>
					<td><input type="text" class="form-control" name="title"
						value="" id="title"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea class="form-control" name="content"
							id="content" rows="10"></textarea> </textarea></td>
				</tr> 
			</table>
			<div style="float: right; margin-top: 20px;">
				<button type="reset" onclick="closeMsg()"
					class="btn btn-outline-primary my-1 btn-inline">초기화</button>
				<button type="submit" onclick="sendMsg()"
					class="btn btn-primary my-1 btn-inline">보내기</button>
			</div>
			<!-- 			<input type="button" value="닫기" onclick="closeMsg()"> <input
				type="button" value="보내기" onclick="sendMsg()"> -->
		</form>
	</div>
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