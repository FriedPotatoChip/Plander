<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp" />
<link rel="stylesheet"
	href="http://jcrop-cdn.tapmodo.com/v0.9.12/css/jquery.Jcrop.css"
	type="text/css" />

<!-- Jcrop(사진 크롭) -->
<script
	src="http://jcrop-cdn.tapmodo.com/v0.9.12/js/jquery.Jcrop.min.js"></script>

<script>
//비밀번호 확인
function pwchk() {
	var pw = $('#password').val();
	var pwchk = ${user.password};

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

// 클릭 시 스크롤이 자동으로 위로 올라가는 현상
function click() {
    return;
}
</script>

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
}

.nav_btn {
	margin-right: 10px;
	margin-top: 10px;
	float: right;
}

.container {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	text-decoration: none;
	width: 80%;
	margin: auto;
}

a {
	color: #475C7A;
}

h3 {
	text-align: center;
	color: #475C7A;
}

.profile {
	width: 100%;
	margin: 10px auto;
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
	width: 36%;
	float: left;
	margin-bottom: 30px;
}

.myBook {
	width: 60%;
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

.myBook_nav, .myRecruit_nav {
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
	width: 30%;
}

#modal_table td {
	width: 70%;
}

.description {
	font-size: 0.7em;
	color: gray;
}
/* 클릭시 레이어 */
.idDiv {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 130px;
	height: 120px;
	padding: 10px;
	padding-top: 18px;
	padding-left: 15px;
}

.popupLayer div {
	position: absolute;
	top: 0px;
	right: 5px
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/TMS"><img
				src="/resources/images/logo.png" width="150px" height="50px"></a>

			<ul class="navbar-nav ml-auto" id="primaryNav">
				<li class="nav-item"><a class="nav-link bold"
					href="/TMS/logout">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link bold" href="/TMS">홈으로가기</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<!-- 내정보 -->
		<div class="my_info" style="margin-top: 30px; border: 1px solid lightgray; padding: 20px;">
			<h5 class="d-inline" style="margin-top: 30px; color: #D8737F;">
				<strong style="color: #475C7A;">${usersVO.name }</strong> 님의 정보
			</h5>
			<strong
				style="float: right; margin-bottom: 10px; margin-right: 10px;"><a
				href="#" data-toggle="modal" data-target="#myModal">회원정보수정</a></strong>
			<!-- 회원 프로필 사진 -->
			<div class="profile" style="margin-top: 20px;">
				<c:if test='${empty usersVO.user_profileImagePath }'>
					<img class="user" src="/resources/images/users.png" alt="user"
						data-toggle="modal" data-target="#profileModal" />
				</c:if>
				<c:if test='${not empty usersVO.user_profileImagePath }'>
					<img class="user" src="${usersVO.user_profileImagePath }"
						alt="user" data-toggle="modal" data-target="#profileModal" />
				</c:if>
			</div>
			<br>
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


		<!-- 내예약 -->
		<div class="myBook" style="margin-top: 30px; border: 1px solid lightgray; padding: 20px;">
			<h5 class="d-inline mr-3" style="color: #D8737F;">내예약</h5>
			<div class="myBook_nav d-inline">
				<strong><a href="javascript:click()"
					onclick="fetch_book('/TMS/my/my_seat?nowPage=1')">좌석예약내역</a></strong>
				&nbsp;|&nbsp;<strong><a href="javascript:click()"
					onclick="fetch_book('/TMS/my/my_cabinet?nowPage=1')">사물함예약내역</a></strong>
				&nbsp;|&nbsp;<strong><a href="javascript:click()"
					onclick="fetch_book('/TMS/my/coupon?nowPage=1')">내쿠폰</a></strong>
				&nbsp;|&nbsp;<strong><a href="javascript:click()"
					onclick="fetch_book('/TMS/my/sendMsg?nowPage=1')">보낸쪽지</a></strong>
				&nbsp;|&nbsp;<strong><a href="javascript:click()"
					onclick="fetch_book('/TMS/my/recvMsg?nowPage=1')">받은쪽지</a></strong>
				<table id="myBook"></table>
			</div>
		</div>


		<!-- 내글목록 -->
		<div class="myRecruit" style="border: 1px solid lightgray; padding: 20px;">
			<h5 class="d-inline mr-3" style="color: #D8737F;">내글목록</h5>
			<div class="myRecruit_nav d-inline mr-3">
				<strong><a href="javascript:click()"
					onclick="fetch_recruit('/TMS/my/my_recruit?nowPage=1')">내모집글</a></strong>&nbsp;|&nbsp;
				<strong><a href="javascript:click()"
					onclick="fetch_recruit('/TMS/my/applyList?nowPage=1')">내모집글신청자현황</a></strong>&nbsp;|&nbsp;
				<strong><a href="javascript:click()"
					onclick="fetch_recruit('/TMS/my/my_recruit_comment?nowPage=1')">내모집글댓글</a></strong>&nbsp;|&nbsp;
				<strong><a href="javascript:click()"
					onclick="fetch_recruit('/TMS/my/board?nowPage=1')">자유게시판에올린글</a></strong>&nbsp;|&nbsp;
				<strong><a href="javascript:click()"
					onclick="fetch_recruit('/TMS/my/board_comment?nowPage=1')">자유게시판에달린댓글</a></strong>
			</div>
			<table id="myRecruit"></table>
		</div>
	</div>


	<!-- 회원정보수정 모달창 -->
	<div class="modal fade" tabindex="-1" role="dialog"
		id="myModal">
		<div class="modal-dialog" role="document">
			<form action="/TMS/my/update" method="POST">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">회원정보수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body center">
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
								<td><fmt:formatDate pattern="yyyy년 MM월 dd일"
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
								<th>회원주소&nbsp;<b style="color: red;">&#42;</b></th>
								<td><input type="text" id="zipNo" style="display: inline;"
									class="col-sm-8 form-control mr-2" name="zipNo" readonly>
									<button type="button" class="btn"
										style="background-color: #475C7A; color: white;"
										onclick="goPopup()">주소검색</button> <input type="text"
									id="roadAddrPart1" class="col-sm-12 form-control my-2"
									name="roadAddrPart1" value="${user.roadAddrPart1 }" readonly>
									<input type="text" id="addrDetail"
									class="col-sm-12 form-control my-2" name="addrDetail"
									value="${user.addrDetail }" placeholder="상세주소" required></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<a href="/TMS/dropout" class="mr-3" data-toggle="modal"
							data-target=".bd-example-modal-sm">회원탈퇴</a>
						<button type="reset" class="btn btn-light"
							data-dismiss="modal">초기화</button>
						<input type="hidden" name="id" value="${user.id }" />
						<button type="submit" id="update" class="btn"
							style="background-color: #475C7A; color: white;">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 회원정보수정 모달창 끝 -->

	<!-- 회원탈퇴 모달 -->
	<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						회원 탈퇴 시 모든 데이터가 삭제되며 한 달간 재가입이 불가능합니다.<br> 그래도 탈퇴하시겠습니까?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light"
						data-dismiss="modal">창닫기</button>
					<button type="button" class="btn" style="background-color: #475C7A; color: white;"
						onclick="location.href='/TMS/my/dropout'">탈퇴하기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 프로필 사진 수정 모달 -->
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
					<button type="button" class="btn btn-outline-warning mx-1"
						onclick="imgDel()">삭제</button>
				</div>
				<div></div>

			</div>
		</div>
	</div>
	<!-- 프로필 사진 수정 모달 끝 -->


	<!-- 프로필 사진 업로드 모달 -->
	<div class="modal fade" id="updateProfile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
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
							&#8251; 프로필 사진은 jpg, png, jpeg파일만 가능<br> 업로드 가능한 원본 이미지 사이즈는
							최대 5MB<br> 가로 사이즈가 1100px을 초과하는 이미지는 업로드 불가<br> 프로필
							이미지로 적용할 범위를 <b>반드시</b> 선택하여 주세요
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
			var pwchk = ${user.password};

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

		//내용 출력(fetch api)
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


	<script>
		/* 프로필 사진 업로드 */
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
	<!-- 프로필 이미지 삭제 -->
	<script> 				
		function imgDel(){
			if ('${usersVO.user_profileImagePath}' == ""){
				alert("프로필 이미지를 먼저 등록해주세요.");
				return false;
			} else {
				$.ajax({
					url: '/imgDel',
					type: 'post',
					dataType: 'text',
					success: function(result) {
						if (result == 'success') {
							alert("프로필 이미지 삭제에 성공했습니다.");
							window.location.reload();
						} else {
							alert("프로필 이미지 삭제에 실패했습니다. \n관리자에게 문의 해주세요.");
						}
					}, error: function(error) {
						alert("프로필 이미지 삭제에 실패했습니다. \n관리자에게 문의 해주세요.");
					}
				})
			}
		}
	</script>
	<!-- 쪽지 삭제 -->
	<script>
		function msgDel(rm_idx, nowPage){
			$.ajax({
				url: '/msgDel',
				type: 'post',
				data: {'rm_idx':rm_idx},
				dataType: 'text',
				success: function(result){
					if (result == 'success'){
						alert("쪽지를 삭제했습니다.");
					}else {
						alert("쪽지 삭제에 실패했습니다.\n관리자에게 문의하세요");
					}
				}, error: function(error){
					alert("쪽지 삭제에 실패했습니다.\n관리자에게 문의하세요");
				}
			})
			
			fetch_book('/TMS/my/recvMsg?nowPage='+ nowPage);
		}
	</script>
	<div class="popupLayer">
		<div>
			<span onClick="closeLayer()"
				style="cursor: pointer; font-size: 0.85em; color: gray;" title="닫기">X</span>
		</div>
		<a id="sendMsg" href="#">쪽지 보내기</a><br> <a id="userProfile"
			href="#">회원 정보 보기</a><br>
	</div>
	<script>
function closeLayer( obj ) {
	$(".popupLayer").hide();
}
function showBox(e, tag){
		console.log("idDiv 클릭됨");
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $('.popupLayer').width();
		var oHeight = $('.popupLayer').height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.clientX + 10 + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
		var divTop = e.clientY + 5 + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
		console.log("X: "+ e.clientX);
		console.log("Y: "+ e.clientY);

		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;

		$('.popupLayer').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).show();
		console.log(this);
		var userId = $(tag).attr("userId");
		console.log($(tag).attr("userId"));
		$("#sendMsg").click(function(){
			$(".popupLayer").hide();
			if ('${usersVO.id}' == ''){
				alert("로그인 후 이용 가능합니다.");
				return false;
			} 
			window.open("/TMS/sendMsg?recv_id="+userId, "쪽지 보내기", "width=500, height=500");
		});
		$("#userProfile").click(function(){
			$(".popupLayer").hide();
			if ('${usersVO.id}' == ''){
				alert("로그인 후 이용 가능합니다.");
				return false;
			} 
			window.open("/TMS/profileSummary?id="+userId, "회원 정보", "width=500, height=500");
		});
}


</script>
</body>
</html>
