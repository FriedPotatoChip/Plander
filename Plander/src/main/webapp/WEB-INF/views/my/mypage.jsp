<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp" />
<style>
.navs {
	height: 60px;
}

.nav_btn {
	margin-right: 10px;
	margin-top: 10px;
	float: right;
}

h3, th {
	text-align: center;
}

h3 {
	margin-top: 10px;
	margin-bottom: 10px;
}

.profile {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.user:hover {
	opacity: 0.5;
}

.user_name {
	margin-top: 10px;
}

.my_info {
	width: 48%;
	float: left;
}

.myBook {
	width: 48%;
	float: right;
}

#myBook, #myRecruit {
	margin-top: 10px;
}

#myRecruit {
	width: 80%;
	margin: 0 auto;
}

.myRecruit {
	width: 96%;
	clear: left;
}

#my_info_table {
	width: 80%;
	margin: 0 auto;
}

.myinfo_nav, .myBook_nav, .myRecruit_nav {
	text-align: center;
	margin-bottom: 20px;
}

#modal_table th {
	width: 50%;
}

#modal_table td {
	width: 50%;
}
</style>
</head>

<body>
	<nav class="navs">
		<button type="button" class="btn btn-outline-danger nav_btn"
			onclick="location.href='/TMS/logout'">로그아웃</button>
		<button type="button" class="btn btn-outline-success nav_btn"
			onclick="location.href='/TMS'">홈으로가기</button>
	</nav>

	<div class="profile">
		<hr>
		<img class="user" src="/resources/images/users.png" alt="user"
			data-toggle="modal" data-target="#profileModal" />
		<h5 class="user_name">${user.name }님</h5>
		<hr>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로필 사진 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-auto">
					<img class="user" src="/resources/images/users.png" alt="user"
						onclick="changeProfile()" />
				</div>
				<div class="modal-footer mx-auto">
					<button type="button" class="btn btn-outline-danger mx-1">사진변경</button>
					<button type="button" class="btn btn-outline-warning mx-1">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<div class="my_info">
		<h3>- 내정보 -</h3>
		<div class="myinfo_nav">
			<strong><a href="#" data-toggle="modal"
				data-target="#myModal">회원정보수정</a></strong>
		</div>
		<table class="table" id="my_info_table">
			<tr>
				<th>회원아이디</th>
				<td>${user.id }</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>${user.name }</td>
			</tr>
			<tr>
				<th>회원등록일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${user.regdate }" /></td>
			</tr>
			<tr>
				<th>회원연락처</th>
				<td>${user.phone }</td>
			</tr>
			<tr>
				<th>회원이메일</th>
				<td>${user.email }</td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td>${user.roadAddrPart1 }&nbsp;${user.addrDetail }</td>
			</tr>
		</table>
	</div>

	<div class="myBook">
		<h3>- 내예약 -</h3>
		<div class="myBook_nav">
			<strong><a href="#" onclick="fetch_book('/TMS/my/my_seat')">좌석예약내역</a></strong>
			&nbsp;|&nbsp;<strong><a href="#"
				onclick="fetch_book('/TMS/my/my_cabinet')">사물함예약내역</a></strong>
			<table id="myBook"></table>
		</div>
	</div>

	<div class="myRecruit">
		<h3>- 내글목록 -</h3>
		<div class="myRecruit_nav">
			<strong><a href="#"
				onclick="fetch_recruit('/TMS/my/my_recruit')">내모집글</a></strong>&nbsp;|&nbsp;
			<strong><a href="#"
				onclick="fetch_recruit('/TMS/my/applyList')">내모집글신청자현황</a></strong>&nbsp;|&nbsp;
			<strong><a href="#"
				onclick="fetch_recruit('/TMS/my/my_recruit_comment')">내모집글댓글</a></strong>&nbsp;|&nbsp;
			<strong><a href="#" onclick="fetch_recruit('/TMS/my/board')">자유게시판에올린글</a></strong>&nbsp;|&nbsp;
			<strong><a href="#"
				onclick="fetch_recruit('/TMS/my/board_comment')">자유게시판에달린댓글</a></strong>
		</div>
		<table id="myRecruit"></table>
	</div>

	<!-- 모달창 -->
	<div class="modal" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<form action="/TMS/my/update" method="POST">
				<div class="modal-content" style="width: 800px;">
					<div class="modal-header">
						<h5 class="modal-title">회원정보수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table" id="modal_table">
							<tr>
								<th>회원아이디</th>
								<td>${user.id }</td>
							</tr>
							<tr>
								<th>회원비밀번호&nbsp;<b style="color: red;">&#42;</b></th>
								<td><input type="text" class="form-control" id="password"
									name="password" placeholder="비밀번호" oninput="pwchk()" required>
									<p id="pwchkMsg" style="font-size: 13px;"></p> <!-- 비밀번호가 일치하지 않습니다. -->
								</td>
							</tr>
							<tr>
								<th>회원명</th>
								<td><input type="text" class="form-control" id="user_name"
									name="name" placeholder="이름" value="${user.name }" required></td>
							</tr>
							<tr>
								<th>회원등록일</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${user.regdate }" /></td>
							</tr>
							<tr>
								<th>회원연락처</th>
								<td><input type="text" class="form-control" id="user_phone"
									name="phone" placeholder="연락처" value="${user.phone }" required></td>
							</tr>
							<tr>
								<th>회원이메일</th>
								<td><input type="text" class="form-control" id="user_email"
									name="email" placeholder="이메일" value="${user.email }" required></td>
							</tr>
							<tr>
								<th>회원주소</th>
								<td><input type="text" class="form-control" id="zipNo"
									name="zipNo" readonly></td>
								<td><input type="button" class="form-control" value="주소검색"
									onclick="goPopup();"></td>
							</tr>
							<tr>
								<th></th>
								<td><input type="text" class="form-control"
									id="roadAddrPart1" name="roadAddrPart1" placeholder="주소"
									value="${user.roadAddrPart1 }" required></td>
							</tr>
							<tr>
								<th></th>
								<td><input type="text" class="form-control" id="addrDetail"
									name="addrDetail" placeholder="상세주소"
									value="${user.addrDetail }" required></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-outline-secondary"
							data-dismiss="modal">초기화</button>
						<input type="hidden" name="id" value="${user.id }" />
						<button type="submit" id="update" class="btn btn-outline-primary">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		//프로필 사진 변경
		function changeProfile(){
			
		}
	
		//주소검색
		function goPopup() {
			var pop = window.open("/juso", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}
		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
				bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm,
				rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.getElementById("roadAddrPart1").value = roadAddrPart1;
			document.getElementById("addrDetail").value = addrDetail;
			document.getElementById("zipNo").value = zipNo;
		}

		//비밀번호 확인
		function pwchk() {
			var pw = $('#password').val();
			var pwchk = $
			{
				user.password
			}
			;

			if (pw != pwchk || pwchk == "") {
				//alert("비밀번호가 일치하지 않습니다. pwchk : " + pwchk + ", pw : "+ pw);
				$('#pwchkMsg').html(
						"<span style='color: red'>비밀번호가 일치하지 않습니다.</span>");
				$('#update').prop("disabled", true);
			} else {
				$('#pwchkMsg').html(
						"<span style='color: forestgreen'>비밀번호가 일치합니다.</span>");
				$('#update').prop("disabled", false);
			}
		}

		//내용 출력
		function fetch_book(name) {
			fetch(name).then(function(response) {
				response.text().then(function(text) {
					document.querySelector('#myBook').innerHTML = text;
				});
			});
		}

		function fetch_recruit(name) {
			fetch(name).then(function(response) {
				response.text().then(function(text) {
					document.querySelector('#myRecruit').innerHTML = text;
				});
			});
		}
	</script>

</body>
</html>
