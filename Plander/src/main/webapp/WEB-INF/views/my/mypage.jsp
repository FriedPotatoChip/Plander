<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp" />
<!-- Ajax -->
<!-- Jcrop(사진 크롭) -->
<script
	src="http://jcrop-cdn.tapmodo.com/v0.9.12/js/jquery.Jcrop.min.js"></script>
<link rel="stylesheet"
	href="http://jcrop-cdn.tapmodo.com/v0.9.12/css/jquery.Jcrop.css"
	type="text/css" />
<!-- Jcrop 끝 -->
<style>
body {
	width: 80%;
	margin: 0 auto;
}

.navs {
	height: 60px;
}

.nav_btn {
	margin-right: 10px;
	margin-top: 10px;
	float: right;
}

h3 {
	text-align: center;
	background-color: #1864ab;
	color: white;
}

th {
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

.user {
	border-radius: 50%;
}

.user_name {
	margin-top: 10px;
}

.my_info {
	width: 48%;
	float: left;
	margin-bottom: 30px;
}

.myBook {
	width: 48%;
	float: right;
}

.myRecruit {
	width: 100%;
	clear: left;
	margin: 0 auto;
}

#myBook, #myRecruit {
	width: 100%;
	margin: 30px auto;
}

#my_info_table {
	width: 100%;
	margin: 0 auto;
}

#my_info_table table, #my_info_table tr, #my_info_table th,
	#my_info_table td {
	border-bottom: 1px solid #000;
}

#my_info_table tr:first-child td, #my_info_table tr:first-child th {
	border-top: 1px solid #000;
}

.myinfo_nav, .myBook_nav, .myRecruit_nav {
	text-align: center;
	margin: 20px auto;
	width: 100%;
}

#modal_table table, #modal_table tr, #modal_table th, #modal_table td {
	border-bottom: 1px solid lightgray;
}

#modal_table tr:first-child td, #modal_table tr:first-child th {
	border-top: 1px solid lightgray;
}

#modal_table th {
	width: 50%;
}

#modal_table td {
	width: 50%;
}

.description {
	font-size: 0.7em;
	color: gray;
}
</style>
<script>
	$('html, body').css({
		'overflow' : 'hidden',
		'height' : '100%'
	});
	$('#element').on('scroll touchmove mousewheel', function(event) {
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
</script>
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
		<c:if test='${empty usersVO.user_profileImagePath }'>
			<img class="user" src="/resources/images/users.png" alt="user"
				data-toggle="modal" data-target="#profileModal" />
		</c:if>
		<c:if test='${not empty usersVO.user_profileImagePath }'>
			<img class="user" src="${usersVO.user_profileImagePath }" alt="user"
				data-toggle="modal" data-target="#profileModal" />
		</c:if>
		<h5 class="user_name">${usersVO.name }님</h5>
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
					<c:if test='${empty usersVO.user_profileImagePath }'>
						<img class="user hideFade" src="/resources/images/users.png"
							alt="user" data-toggle="modal" data-target="#updateProfile" />
					</c:if>
					<c:if test='${not empty usersVO.user_profileImagePath }'>
						<img class="user hideFade" src="${usersVO.user_profileImagePath }"
							alt="user" data-toggle="modal" data-target="#updateProfile" />
					</c:if>
				</div>
				<div class="modal-footer mx-auto">
					<button type="button" class="btn btn-outline-danger mx-1 hideFade"
						data-toggle="modal" data-target="#updateProfile">사진변경</button>
					<button type="button" class="btn btn-outline-warning mx-1">삭제</button>
				</div>
				<div></div>

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





	<!-- 프로필 사진 업로드 모달 -->
	<div class="modal fade" id="updateProfile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">프로필 사진 업로드</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body centerModal">

					<form id="form" action="/TMS/profileUpload" name="imgForm"
						method="post" enctype="multipart/form-data" onclick="">
						<input type='file' name="file" id="imgInput" />
						<p class="description">
							프로필 사진은 jpg, png, jpeg파일만 가능<br> 업로드 가능한 원본 이미지 사이즈는 최대 5MB<br>
							가로 사이즈가 1100px을 초과하는 이미지는 업로드 불가<br> 프로필 이미지로 적용할 범위를 <b>반드시</b>
							선택하여 주세요
						</p>
						<hr>
						<input type="hidden" name="x" id="x" /> <input type="hidden"
							name="y" id="y" /> <input type="hidden" name="w" id="w" /> <input
							type="hidden" name="h" id="h" /> <input type="hidden"
							name="u_idx" value="${usersVO.u_idx }">
					</form>


					<c:if test='${empty usersVO.user_profileImagePath }'>
						<img id="profileImg" src="/resources/images/users.png" alt="user" />
					</c:if>
					<c:if test='${not empty usersVO.user_profileImagePath }'>
						<img id="profileImg" src="${usersVO.user_profileImagePath }"
							alt="user" />
					</c:if>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-dismiss="modal"
						value="닫기"> <input type="button" class="btn btn-primary"
						value="수정" onclick="submitProfile()">
				</div>
			</div>
		</div>
	</div>
	<!-- 프로필 사진 업로드 모달 끝 -->

	<script>
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
	<!-- 프로필 사진 업로드 -->
	<script>
		var jcrop_api;
		var target;
		//callback function
		var showCoords = function(c) {
			$('#x').val(c.x);
			$('#y').val(c.y);
			$('#w').val(c.w);
			$('#h').val(c.h);
			window.x = c.x;
			window.y = c.y;
			window.w = c.w;
			window.h = c.h;
		};

		$(document).ready(function() {
			$("#imgInput").on("change", fileChange);

			$(".hideFade").on("click", function() {
				$(".fade").hide();
			})
		});

		function fileChange(e) {
			e.preventDefault();
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr
					.forEach(function(f) {
						if (!(f.type.match("image/png")
								|| f.type.match("image/jpeg") || f.type
								.match("image/jpg"))) {
							alert("프로필 이미지는 jpg, jpeg, png 파일만 가능합니다.");
							return false;
						}
						if (f.size > (5 * 1024 * 1024)) {
							alert("업로드 가능한 최대 크기는 5MB입니다")
							return false;
						}
						sel_file = f;

						var reader = new FileReader();
						reader.onload = function(e) {
							var imgPre = new Image();
							imgPre.src = e.target.result;
							imgPre.onload = function() {
								if (this.width > 1100) {
									alert("업로드 가능한 이미지의 최대 가로크기는 1100px입니다")
									return false;
								} else {
									$("#profileImg").attr("src",
											e.target.result);
									target = e.target.result;
								}
							}
						}
						reader.readAsDataURL(f);

					});
		}

		$(function() {
			var cnt = 1;
			var width = this.width;
			var height = this.height;

			$("#profileImg").on("load", function() {
				if (cnt == 1) {
					$('#profileImg').Jcrop({
						setSelect : [ 0, 0, 100, 100 ],
						onChange : showCoords,
						onSelect : showCoords,
						aspectRatio : 1
					}, function() {
						jcrop_api = this;
					})
				} else {
					jcrop_api.setImage(target);
				}
				cnt++;
			})
		});

		function submitProfile() {
			$("form[name='imgForm']").submit();
		}
	</script>
</body>
</html>
