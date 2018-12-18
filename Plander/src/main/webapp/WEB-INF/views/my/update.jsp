<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f1f3f5;
}
.container {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
.my_info_table {
	margin: 0 auto;
	margin-top: 2%;
	border-collapse: collapse;
	width: 30%;
}

.my_info_table th {
	border: 1px solid black;
	width: 50%;
}

.my_info_table td {
	border: 1px solid black;
	width: 50%;
	text-align: center;
}

.my_info_btn {
	margin: 1% 1%;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="my_info_title">내정보 수정</h3>
		<form action="/TMS/mypage/updateOk">
			<table class="my_info_table">
				<tr>
					<th>U_IDX</th>
					<td>${user.u_idx }</td>
				</tr>
				<tr>
					<th>ID</th>
					<td>${user.id }</td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td><input type="text" name="password" value="${user.password }"></td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type="text" name="name" value="${user.name }"></td>
				</tr>
				<tr>
					<th>REGDATE</th>
					<td>${user.regdate }</td>
				</tr>
				<tr>
					<th>PHONE</th>
					<td><input type="text" name="phone" value="${user.phone }"></td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td><input type="text" name="email" value="${user.email }"></td>
				</tr>
				<tr>
					<th>RANK</th>
					<td>${user.rank }</td>
				</tr>
				<tr>
					<th>API_ID</th>
					<td>${user.api_id }</td>
				</tr>
				<tr>
					<th>ZIPNO</th>
					<td><input type="text" name="zipNo" value="${user.zipNo }"></td>
				</tr>
				<tr>
					<th>ROADADDRPART1</th>
					<td><input type="text" name="roadAddrPart1" value="${user.roadAddrPart1 }"></td>
				</tr>
				<tr>
					<th>ADDRDETAIL</th>
					<td><input type="text" name="addrDetail" value="${user.addrDetail }"></td>
				</tr>
			</table>
			<button type="reset" class="my_info_btn">초기화</button>
			<button type="submit" class="my_info_btn">작성완료</button>
		</form>
	</div>
</body>
</html>