<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp"></jsp:include>

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
}

td {
	padding-left: 50px;
}

th {
	background-color: #FCBB6D;
	width: 30%;
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
		<h4 style="margin-top: 30px;">회원 정보</h4>
		<hr>
		<table class="table" style="border: 1px solid lightgray;">
			<tr>
				<th>닉네임</th>
				<td style="width: 60%;">${profile.id }</td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td><c:if test='${empty profile.user_profileImagePath }'>
						-
					</c:if> <c:if test='${not empty profile.user_profileImagePath }'>
						<img class="user" src="${profile.user_profileImagePath }"
							alt="user" />
					</c:if></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><fmt:formatDate value="${profile.regdate }"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</table>
		<input type="button" class="btn" style="background-color: #475C7A; color: white;" value="닫기" onclick="closeWin()">
	</div>
	<script>
		function closeWin() {
			window.close();
		}
	</script>

</body>
</html>