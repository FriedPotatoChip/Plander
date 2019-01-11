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
td { padding-left: 50px; }
th { background-color: #C5C6C7; width: 30%; }
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

	<h3>회원 정보</h3>
	<hr>
		<table>
			<tr>
				<th>닉네임</th>
				<td>
					${profile.id }
				</td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
					<c:if test='${empty profile.user_profileImagePath }'>
						-
					</c:if>
					<c:if test='${not empty profile.user_profileImagePath }'>
						<img class="user" src="${profile.user_profileImagePath }" alt="user"/>
					</c:if> 
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					<fmt:formatDate value="${profile.regdate }" pattern="yyyy-MM-dd HH:mm"/>
				</td>
			</tr>
		</table>
		<input type="button" value="닫기" onclick="closeWin()">
<script>
	function closeWin(){
		window.close();
	}
</script>
</body>
</html>