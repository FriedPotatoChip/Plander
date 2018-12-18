<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body> 
${sessionScope.usersVO }
<c:if test="${empty sessionScope.usersVO }"> 
	<jsp:include page="/commons/header.jsp"/>
</c:if>
<c:if test="${not empty sessionScope.usersVO }"> 
	<jsp:include page="/commons/loginheader.jsp"/>
</c:if> 

	<a href="#">운영안내</a>
	<a href="#">이용안내</a>
	<a href="#">모집하기</a>
	<a href="#">게시판</a>
	<a href="#">예약하기</a>
	<a href="#">세부공간보기</a>
	<a href="#">찾아오시는 길</a>
	<input type="button" onclick="chkLogin()" value="모집 게시판">
	
<script>
	
	if('${loginResult}' == 'admin'){
		alert("관리자 로그인에 성공하였습니다.");
	} else if ('${loginResult}' == 'user'){
		alert("로그인 성공");
	} else if ('${loginResult}' == 'fail'){
		alert("로그인에 실패하였습니다.");
	}
	
	function chkLogin(){
		if("${usersVO}" == ""){
			alert("로그인 후 이용해주세요");
			return false;
		} else {
			location.href = "/TMS/recruit";
		}
	}
</script>
</body>
</html>