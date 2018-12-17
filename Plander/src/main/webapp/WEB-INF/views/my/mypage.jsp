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
	float: right; width : 48%;
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
	border-collapse: collapse;
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
	<div class="container">
		<h1 style="text-align: center;">마이페이지</h1>
		<div class="my_information">
			<form>
				<h3 class="my_info_title">내정보</h3>
				<input class="my_info_btn" type="submit" value="회원정보수정">
				<table class="my_info_table">
					<tr>
						<th>U_IDX</th>
						<td>${vo.u_idx }</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>${vo.id }</td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td>${vo.password }</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td>${vo.name }</td>
					</tr>
					<tr>
						<th>REGDATE</th>
						<td>${vo.regdate }</td>
					</tr>
					<tr>
						<th>PHONE</th>
						<td>${vo.phone }</td>
					</tr>
					<tr>
						<th>EMAIL</th>
						<td>${vo.email }</td>
					</tr>
					<tr>
						<th>RANK</th>
						<td>${vo.rank }</td>
					</tr>
					<tr>
						<th>API_ID</th>
						<td>${vo.api_id }</td>
					</tr>
					<tr>
						<th>ZIPNO</th>
						<td>${vo.zipNo }</td>
					</tr>
					<tr>
						<th>ROADADDRPART1</th>
						<td>${vo.roadAddrPart1 }</td>
					</tr>
					<tr>
						<th>ADDRDETAIL</th>
						<td>${vo.addrDetail }</td>
					</tr>
				</table>
			</form>
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