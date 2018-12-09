<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->
<script>
	function update(frm) {
		frm.action = "/Plander/mypage/update";
		frm.submit();
	}
</script>
<style>
body, html {
	width: 90%;
	margin: auto;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

#home {
	font-family: 'East Sea Dokdo', cursive;
	font-size: 2em;
}

.center {
	text-align: center;
}
</style>

</head>
<body>
	<div id="container">
		<!-- 헤더 -->
		<c:if test="${empty user }"><jsp:include
				page="/commons/header.jsp" /></c:if>

		<!-- 회원정보수정 -->
		<h3 class="center">회원정보수정</h3>
		<br>
		<hr>
		<form method="post" action="/Plander/mypage/update">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td width="25%">아이디&nbsp;<b>${user.id }</b></td>
					</tr>
					<tr>
						<td>비밀번호&nbsp;</td>
						<td><input type="text" name="password"
							class="col-sm-4 form-control input-sm" value="${user.password }"></td>
					</tr>
					<tr>
						<td>이름&nbsp;</td>
						<td><input type="text" name="name"
							class="col-sm-4 form-control input-sm" value="${user.name }"></td>
					</tr>

					<tr>
						<td>휴대전화&nbsp;</td>
						<td><input type="text" name="phone"
							class="col-sm-4 form-control input-sm" value="${user.phone }"></td>
						<!-- 						<td class="form-inline"><select name="phone"
							class="form-control">
								<option value="1">010</option>
								<option value="2">011</option>
								<option value="3">016</option>
								<option value="4">017</option>
								<option value="5">018</option>
								<option value="6">019</option>
						</select> &nbsp;&#45;&nbsp; <input type="text" name="phone1"
							class="col-sm-2 form-control input-sm">&nbsp;&#45;&nbsp;
							<input type="text" name="phone2"
							class="col-sm-2 form-control input-sm"></td> -->
					</tr>
					<tr>
						<td>이메일&nbsp;/td>
						<td><input type="text" name="email"
							class="col-sm-4 form-control input-sm" value="${user.email }"></td>
						<!-- 						<td class="form-inline"><input type="text" name="email1"
							class="col-sm-4 form-control input-sm">&nbsp;&#64;&nbsp;
							<input type="text" name="email2"
							class="col-sm-4 form-control input-sm">&nbsp; <select
							name="email" class="form-control">
								<option value="0">-이메일 선택-</option>
								<option value="1">naver.com</option>
								<option value="2">daum.net</option>
								<option value="3">gmail.com</option>
								<option value="4">nate.com</option>
								<option value="5">직접입력</option>
						</select></td> -->
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="u_idx" value="${user.u_idx }">
			<br> <br>
			<div class="center">
				<button type="submit" id="userUpdate"
					class="btn btn-outline-secondary">저장하기</button>
				<button type="reset" class="btn btn-outline-secondary">취소</button>
			</div>
		</form>

		<br> <br> <br> <br>

		<jsp:include page="/commons/footer.jsp" />
	</div>

</body>
</html>