<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<title>마이페이지</title>
<style>
h1, h2, h3, h4, h5, p {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 300
}

.normal {
	font-weight: 400
}

.bold {
	font-weight: 700
}

.bolder {
	font-weight: 800
}

.light {
	font-weight: 300
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
	height: 300px;
	background-color: #f3f4f7;
	text-align: center;
}

#circle {
	margin-top: 40px;
	height: 60%;
	width: 180px;
	background-image: url("/resources/images/profile.png");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	border-radius: 50%;
	display: inline-block;
}

#circle:hover {
	background-blend-mode: luminosity;
}

.cnt {
	text-decoration: none;
	font-weight: 800;
}

body {
	background-color: #f3f4f7;
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

	function sendData() {
		var firstForm = document.forms[0];
		for (var i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3)
					continue; //파일항목
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
</script>
</head>
<body>
	<div class="intro"
		style="width: 100%; padding: 150px; height: 300px; background-color: #8db9ca;">
		<div style="width: 200px; height: 200px; background-color: white;"
			onclick="document.getElementById('id01').style.display='block'"
			class="w3-button">
			<img src="#">
		</div>
	</div>
	<div style="background-color: white;">
		<h1 class="light"
			style="margin-left: 400px; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;">${user.name }님의
			마이페이지</h1>
	</div>
	<!-- 모달 -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4">
			<header class="w3-container w3-teal">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<h2 style="color: black;">프로필 사진 변경</h2>
			</header>
			<div class="w3-container" style="margin: 20px auto;">
				<form action="/TMS/mypage/profileUpdate" method="post"
					enctype="multipart/form-data">
					<table style="margin: 0 auto;">
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="uploadFile"></td>
						</tr>
						<tr>
							<td colspan="2"><input style="float: right;" type="button"
								value="저장" onclick="sendData()"></td>
						</tr>
					</table>
				</form>
			</div>
			<footer class="w3-container w3-teal">
				<p></p>
			</footer>
		</div>
	</div>

	<div class="my_information">
		<h3 class="my_info_title bold">내정보</h3>
		<button type="button" class="btn btn-dark ml-3"
			onclick="location.href='/TMS/mypage/update'">회원정보수정</button>
		<table class="table mt-4">
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
		<h3 class="bold">내예약</h3>
		<a href="#" onclick="fetchPage2('/TMS/mypage/seat')"><p>좌석예약내역</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
			href="#" onclick="fetchPage2('/TMS/mypage/cabinet')"><p>사물함예약내역</p></a>
		<table id="reservation"></table>
	</div>

	<div class="my_writing">
		<h3 class="bold">내커뮤니티</h3>
		<a href="#" onclick="fetchPage('/TMS/mypage/board')"><p>내가 등록한
				게시물</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
			onclick="fetchPage('/TMS/mypage/board_comment')"><p>내 게시물에 달린
				댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
			onclick="fetchPage('/TMS/mypage/comment')"><p>내가 등록한 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
			href="#" onclick="fetchPage('/TMS/mypage/comment_comment')"><p>내
				댓글에 달린 한줄의견</p></a>
		<table id="writing"></table>
	</div>

	<div class="my_recruit">
		<h3 class="bold">내모집</h3>
		<a href="#" onclick="fetchPage3('/TMS/mypage/board2')"><p>내가
				등록한 게시물</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
			onclick="fetchPage3('/TMS/mypage/board_comment2')"><p>내 게시물에
				달린 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#"
			onclick="fetchPage3('/TMS/mypage/comment2')"><p>내가 등록한 댓글</p></a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
			href="#" onclick="fetchPage3('/TMS/mypage/comment_comment2')"><p>내
				댓글에 달린 한줄의견</p></a>
		<table id="recruit"></table>
	</div>

</body>
</html>