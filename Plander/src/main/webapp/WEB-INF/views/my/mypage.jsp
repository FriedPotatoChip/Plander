<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<title>마이페이지</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f1f3f5;
}

a {
	text-decoration: none;
}

a:visited {
	color: black;
}

a:hover {
	color: #e64980;
}

.my_information {
	float: left;
	width: 48%;
	padding: 1%;
}

.my_reservation {
	float: right;
	width: 48%;
	margin-bottom: 2%;
	padding: 1%;
}

.my_writing {
	clear: left;
	float: left;
	width: 48%;
	padding: 1%;
}

.my_recruit {
	clear: right;
	float: right;
	width: 48%;
	padding: 1%;
	width: 48%;
}

.my_info_btn {
	display: inline;
	margin-left: 2%;
}

p {
	display: inline;
}

#writing, #reservation, #recruit {
	margin-top: 2%;
}

.my_info_table {
	margin: 0 auto;
	margin-top: 2%;
	border-collapse: collapse;
	width: 100%;
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

.my_info_title {
	display: inline;
}

.name {
	color: #1971c2;
}

.profile {
	width: 100%;
	height: 200px;
	background-color: #f783ac;
	text-align: center;
}

.circle {
	margin-top: 40px;
	height: 60%;
	width: 120px;
	background-image: url("/resources/images/profile.png");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	border-radius: 50%;
	display: inline-block;
}

.circle:hover {
	background-blend-mode: luminosity;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
	function fetchPage(name) {
		fetch(name).then(function(response) {
			response.text().then(function(text) {
				document.querySelector('#writing').innerHTML = text;
			})
		});
	}

	function fetchPage2(name) {
		fetch(name).then(function(response) {
			response.text().then(function(text) {
				document.querySelector('#reservation').innerHTML = text;
			})
		});
	}

	function fetchPage3(name) {
		fetch(name).then(function(response) {
			response.text().then(function(text) {
				document.querySelector('#recruit').innerHTML = text;
			})
		});
	}
</script>
</head>
<body>
${pvo} 
	<div class="container">
		<h1 style="text-align: center;">
			<span class="name">${user.name }</span>님의 마이페이지
		</h1>

		<div class="profile">
			<span class="circle" onclick="location.href='/TMS/mypage/profile'"></span>
		</div>


		<div class="my_information">
			<h3 class="my_info_title">내정보</h3>
			<button type="button" class="my_info_btn"
				onclick="location.href='/TMS/mypage/update'">회원정보수정</button>
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
					<td>${user.password }</td>
				</tr>
				<tr>
					<th>NAME</th>
					<td>${user.name }</td>
				</tr>
				<tr>
					<th>REGDATE</th>
					<td>${user.regdate }</td>
				</tr>
				<tr>
					<th>PHONE</th>
					<td>${user.phone }</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td>${user.email }</td>
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
					<td>${user.zipNo }</td>
				</tr>
				<tr>
					<th>ROADADDRPART1</th>
					<td>${user.roadAddrPart1 }</td>
				</tr>
				<tr>
					<th>ADDRDETAIL</th>
					<td>${user.addrDetail }</td>
				</tr>
			</table>
		</div>

		<div class="my_reservation">
			<h3>내예약</h3>
			<a href="#" onclick="fetchPage2('/TMS/mypage/seat')"><p>좌석예약내역</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
				href="#" onclick="fetchPage2('/TMS/mypage/cabinet')"><p>사물함예약내역</p></a>
			<table id="reservation"></table>
		</div>

		<div class="my_writing">
			<h3>내커뮤니티</h3>
			<a href="#" onclick="fetchPage('/TMS/mypage/board')"><p>내가
					등록한 게시물</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
				onclick="fetchPage('/TMS/mypage/board_comment')"><p>내 게시물에
					달린 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
				onclick="fetchPage('/TMS/mypage/comment')"><p>내가 등록한 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
				href="#" onclick="fetchPage('/TMS/mypage/comment_comment')"><p>내
					댓글에 달린 한줄의견</p></a>
			<table id="writing"></table>
		</div>

		<div class="my_recruit">
			<h3>내모집</h3>
			<a href="#" onclick="fetchPage3('/TMS/mypage/board2')"><p>내가
					등록한 게시물</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
				onclick="fetchPage3('/TMS/mypage/board_comment2')"><p>내 게시물에
					달린 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
				onclick="fetchPage3('/TMS/mypage/comment2')"><p>내가 등록한 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
				href="#" onclick="fetchPage3('/TMS/mypage/comment_comment2')"><p>내
					댓글에 달린 한줄의견</p></a>
			<table id="recruit"></table>
		</div>
	</div>
</body>
</html>