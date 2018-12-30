<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function login(){
	
	$.ajax({
		url: "/login",
		type: "post",
		data: {"id":id, "pwd":pwd},
		dataType: "",
		success: function(result){
			alert(result);
			if (result == 'successs'){
				alert("로그인 성공")
				location.href="메인";
			}else if (result == 'fail'){
				var html = "";
				html += "아이디, 비밀번호를 확인하여 주세요";
				$("#msg").html(html);
			}
		}, error: function(error){
			
		}
		
	
	
	});
}
</script>
<body>

	
	
	
	
	<input type="button" value="로그인" onclick="login()">
	<div id="msg"></div>
	
	
	
</body>
</html>