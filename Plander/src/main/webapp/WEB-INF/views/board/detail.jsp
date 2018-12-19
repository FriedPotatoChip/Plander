<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	h3{ margin-top: 0px; }
	a {text-decoration: none;}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	
	$.ajax({
		url:
	})
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>

</head>
<body> 
	
	<h3>모집글 상세조회 페이지</h3>
	
	<div>
		<a href="#" style="font-size: 0.8em;"><strong>모집 게시판</strong></a>
		<h3>${rc_board.rc_title }</h3>
		<a href="#">${usersVO.id }</a> 
		<p><fmt:formatDate value="${rc_board.rc_regdate }" pattern="yyyy.MM.dd HH:mm"/></p>
		<hr>
		<div id="content">${rc_board.rc_content }</div>
	</div>	
	
	<div>
		<button>신청하기</button>
	</div>
	<div>
		<h4>댓글</h4>
	<hr>
		
	</div>
	
	
</body>
</html>