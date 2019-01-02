<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
.modal-body {
    max-height: calc(100vh - 210px);
    overflow-y: auto;
}
</style> 
	
	
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<!-- 네이버 로그인 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<!-- 카카오 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
	<!-- <a class="navbar-brand" href="/TMS"><img
		src="/resources/images/turtle.png" width="30" height="30"
		class="d-inline-block align-top ml-4" alt="거북이">
		<h1 class="light ml-3" id="title_name">거북이의기적</h1></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
 -->
	<div class="container-fluid">

		<a class="navbar-brand" href="#"><img
			src="/resources/images/logo.png" width="150px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">운영안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#" onclick="loginChk()">예약하기</a></li>
				<!-- 삭제 -->
				<!-- <li class="nav-item"><a class="nav-link" href="#">모집하기</a></li> -->
				<!-- 이용안내에 넣기 -->
				<!-- <li class="nav-item"><a class="nav-link" href="#">세부공간보기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">찾아오시는길</a></li> -->
				<li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
					<div class="dropdown">
						<button class="btn btn-light dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">게시판</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">공지사항</a> <a
								class="dropdown-item" href="#">자유게시판</a> <a
								class="dropdown-item" href="#">FAQ</a>
						</div>
					</div>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

			</ul>

			<!-- 로그인 -->
			<ul class="nav justify-content-end" id="primaryNav">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="modal" href="#myModal"><h5>로그인</h5></a></li>
				<!-- <li class="nav-item"><a class="nav-link" data-toggle="modal"
					href="#joinModal"><h5>회원가입</h5></a></li> -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img src="/resources/images/global.png"></a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#"><h5>한국어</h5></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"><h5>English</h5></a>
					</div></li>
			</ul>
		</div>
		</div>
</nav>


<script>
	function loginChk(){
		console.log("여기 들어옴");
		if ('${empty usersVO}' == 'true'){
			alert("로그인 후 이용해주세요");
			$("#myModal").modal();
		} else {
			location.href="/TMS/book";
		}
	}
$(function(){
})
	function enterLogin() {
		chk();
	}
	function chk() {
		if (!document.frm.id.value) {
			alert("아이디를 입력해주세요.");
			document.frm.id.focus();
			return false;
		}

		if (!document.frm.password.value) {
			alert("비밀번호를 입력해주세요.");
			document.frm.password.focus()
			return false;
		}
		// document.frm.submit();
		var data = $("form[name='frm']").serialize();
		$.ajax({
			url : "/loginAjax",
			type : 'post',
			dataType : 'text',
			data : data,
			success : function(result) {
				if (result == 'success') {
					alert("거기스에 오신것을 환영합니다!");
					window.location.reload();
				} else if (result == 'fail') {
					alert("아이디와 비밀번호가 일치하지 않습니다.");
				} else if (result == 'admin') {
					alert("관리자 로그인에 성공하였습니다");
					location.href = "/TMS";
				}
			},
			error : function(result) {

			}
		});
	}

	//아이디 중복확인
	function idchk() {
		var inputed = $('#id').val();
		var testId = /^[a-zA-Z0-9]+$/;
		if (!testId.test(inputed)){
			$('#idMsg').html("<span style='color: red'>영문, 숫자 조합만 사용 가능합니다.</span>");
			$("#id").focus();
			return false;
		}
		window.chkIdChk = false;
		$.ajax({
					data : {
						'id' : inputed
					},
					url : '/idChk_api',
					success : function(data) {
						if (data == 'ok') {
							chkId = true;
							//아이디 사용가능
							$('#idMsg')
									.html(
											"<span style='color: forestgreen'>사용 가능한 아이디입니다.</span>");
							chkIdChk = true;
						} else {
							$('#idMsg')
									.html(
											"<span style='color: red'>이미 사용중인 아이디입니다.</span>");
						}
					},
					error : function() {
						//alert("관리자에게 연락바랍니다.");
						return "/commons/error404.jsp";
					}
				})
	}

	//비밀번호 확인
	function pwchk() {
		var pw = $('#password').val();
		var pwchk = $('#passwordchk').val();
		window.chkPwdChk = false;
		if (pw != pwchk || pwchk == "") {
			//alert("비밀번호가 일치하지 않습니다. pwchk : " + pwchk + ", pw : "+ pw);
			$('#pwchkMsg').html(
					"<span style='color: red'>비밀번호가 일치하지 않습니다.</span>");
		} else {
			$('#pwchkMsg').html(
					"<span style='color: forestgreen'>비밀번호가 일치합니다.</span>");
			chkPwdChk = true;
		}
	}

	//회원가입 
	function join() {
		var chkBox = $('input:checkbox[id="chkBox"]').is(":checked");
		var frm = document.joinform;

		var password = frm.password.value;
		var tel = frm.phone.value;
		var email = frm.email.value;
		var name = frm.name.value;
		var id = frm.id.value;

		var testPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		var testPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{8,16}$/;
		var testEmail = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		var testId = /^[a-zA-Z0-9]+$/;
		var testName = /^[가-힣a-zA-Z]+$/;

		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);
		var checkSpe = password.search(/[!@#$%^&*]/gi);

		if (!chkBox) {
			alert("이용 약관에 동의해주세요");
			frm.chkBox.focus();
			return false;
		}
		if (!frm.id.value) {
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return false;
		}
		if (!testId.test(id)){
			alert("아이디는 영문, 숫자 조합만 가능합니다.");
			frm.id.focus();
			return;
		}

		if (!frm.password.value) {
			alert("비밀번호를 입력해주세요.");
			frm.password.focus();
			return false;
		}

		if (checkNumber < 0 || checkEnglish < 0 || checkSpe < 0) {
			alert("숫자, 영문자, 특수문자를 혼용하여야 합니다.");
			frm.password.value = "";
			frm.password.focus();
			return false;
		}
		if (/(\w)\1\1\1/.test(password)) {
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			frm.password.value = "";
			frm.password.focus();
			return false;
		}

		if (password.search(frm.id.value) > -1) {
			alert("비밀번호에 아이디가 포함되었습니다.");
			frm.password.value = "";
			frm.password.focus();
			return false;
		}

		if (!frm.name.value) {
			alert("이름을 입력해주세요.");
			frm.name.focus();
			return false;
		}
		if (!testName.test(name)){
			alert("한글 또는 문만 사용 가능합니다.");
			return false;
		}
		

		if (!frm.phone.value) {
			alert("핸드폰 번호를 입력해주세요.");
			frm.phone.focus();
			return false;
		}
		if (!testPhone.test(tel)) {
			alert('유효하지 않은 번호입니다.');
			frm.phone.value = "";
			frm.phone.focus();
			return false;
		}

		if (!frm.email.value) {
			alert("이메일을 입력해주세요.");
			frm.email.focus();
			return false;
		}
		if (!testEmail.test(email)) {
			alert("유효하지 않은 이메일입니다.");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}

		if (!chkIdChk) {
			alert("이미 사용중인 ID 입니다.");
			frm.id.focus();
			return false;
		}

		if (chkIdChk && chkPwdChk) {
			frm.submit();
		} else if (!chkPwdChk) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.password.focus();
		}

	}

	// 주소 api
	function goPopup() {
		var pop = window.open("/juso", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.getElementById("roadAddrPart1").value = roadAddrPart1;
		document.getElementById("addrDetail").value = addrDetail;
		document.getElementById("zipNo").value = zipNo;
	}
</script>


<!-- 로그인 모달창 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					<b>로그인</b>
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form name="frm" action="#" method="post">
					<input type="text" name="id" class="form-control" placeholder="아이디"
						onKeyPress="if (event.keyCode==13){enterLogin()}" required>
					<input type="text" name="password" class="form-control"
						style="margin-top: 1.5%;" placeholder="비밀번호"
						onKeyPress="if (event.keyCode==13){enterLogin()}" required>
					<input type="button" style="margin-top: 1.5%;"
						class="btn btn-outline-secondary form-control" value="로그인"
						onclick="chk()">
				</form>
				<hr>

				<form style="width: 50%; margin: 0 auto;">
					<!-- <input type="button" name="googleLogin" class="btn btn-outline-secondary form-control"
						onclick="" value="구글 로그인"> -->
					<input type="button" value="구글 로그인" id="googleBtn"
						onclick="googleLogin()" style="margin: 5% auto;">
					<!-- 네이버 로그인 -->
					<div id="naverIdLogin" style="margin: 5% auto;"></div>
					<!-- <input type="button" name="naverLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" id="naverIdLogin" value="네이버 로그인"> -->
					<!-- 카카오 로그인 -->
					<a id="kakao-login-btn" style="margin: 5% auto;"></a>
					<!-- <input type="button" name="kakaoLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" value="카카오톡으로 로그인"> -->
				</form>
				<hr>

				<div class="center">
					<a href="/TMS/findIdPw">아이디 찾기</a>&nbsp; <a
						href="/TMS/findIdPw">비밀번호 찾기</a>&nbsp; <a data-toggle="modal"
						href="#joinModal" data-dismiss="modal">회원가입</a>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- 로그인 모달창 끝 -->

<!-- 회원가입 모달창 -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header"> 
				<h4 class="modal-title" id="myModalLabel">
					<b>JOIN US !</b>
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<form name="joinform" action="/signUp" method="post">
				<div class="modal-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td width="35%">아이디&nbsp;<b style="color: red;">&#42;</b></td>
								<td width="65%"><input type="text" name="id" id="id"
									oninput="idchk()" class="col-sm-6 form-control" required>
									<p id="idMsg" style="font-size: 13px;"></p></td>
							</tr>
							<tr>
								<td>비밀번호&nbsp;<b style="color: red;">&#42;</b></td>
								<td><input type="password" name="password" id="password"
									style="font-family: 굴림;" oninput="pwchk()"
									class="col-sm-6 form-control" required>
									<p id="pwMsg" style="font-size: 13px;">(영문
										대소문자/숫자/특수문자(!,@,#,$,%,^,&,*) 조합, 8자~16자)</p></td>
							</tr>
							<tr>
								<td>비밀번호 확인&nbsp;<b style="color: red;">&#42;</b></td>
								<td><input type="password" name="passwordchk"
									style="font-family: 굴림;" id="passwordchk" oninput="pwchk()"
									class="col-sm-6 form-control" required>
									<p id="pwchkMsg" style="font-size: 13px;"></p> <!-- 비밀번호가 일치하지 않습니다. -->
								</td>
							</tr>
							<tr>
								<td>이름&nbsp;<b style="color: red;">&#42;</b></td>
								<td><input type="text" name="name"
									class="col-sm-6 form-control" required></td>
							</tr>

							<tr>
								<td>휴대전화&nbsp;<b style="color: red;">&#42;</b></td>
								<td><input type="text" name="phone"
									class="col-sm-10 form-control" required></td>
							</tr>
							<tr>
								<td>이메일&nbsp;<b style="color: red;">&#42;</b></td>
								<td><input type="text" name="email"
									class="col-sm-10 form-control" required></td>
							</tr>
							<tr>
								<td>주소&nbsp;<b style="color: red;">&#42;</b></td>
								<td><input type="text" id="zipNo"
									class="col-sm-4 form-control" name="zipNo" placeholder="zip"
									readonly> <input type="button"
									class="col-sm-4 form-control" value="주소 검색" onclick="goPopup()">
									<input type="text" id="roadAddrPart1"
									class="col-sm-10 form-control" name="roadAddrPart1"
									placeholder="Address" readonly> <input type="text"
									id="addrDetail" class="col-sm-10 form-control"
									name="addrDetail"></td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<p>
						이미 회원이신가요?&nbsp; <a data-toggle="modal" href="#myModal"
							data-dismiss="modal">로그인</a>
					</p>
					<div id="admit">
						<div class="checkbox">
							<label><input type="checkbox" id="chkBox" name="chKBox">&nbsp;<b>거기스</b>에
								가입하면서 <a>이용약관</a>과 <a>개인정보 취급방침</a>을 확인하고 이에 동의합니다.</label>
						</div>
					</div>
				</div>
				<!-- 모달 바디 끝 -->

				<div class="modal-footer">
					<div class="center">
						<button type="button" onclick="join()"
							class="btn btn-outline-secondary form-control">회원가입</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>
<!-- 회원가입 모달창 끝 -->


<!-- 카카오 로그인 api -->
<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('카카오클라이언트ID'); /* 클라이언트 id 숨겨두기 */
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			alert(JSON.stringify(authObj));

			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {

					$.ajax({
						url : "/TMS/naverAjax",
						type : 'POST',
						data : {
							'api_id' : res.id,
							'email' : res.kaccount_email,
							'name' : res.properties['nickname'],
							'type' : 'kakao'
						},
						dataType : 'text',
						success : function(data) {
							console.log(data);
							location.href = data;
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("에러 발생~~ \n" + jqXHR.status + " : "
									+ errorThrown);
						}
					});

				}
			})
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//_$t
</script>
<!-- 네이버 로그인 api -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "네이버클라이언트ID", /* 클라이언트 ID (숨겨두기) */
		callbackUrl : "http://localhost:8095/TMS/naverCallback",
		isPopup : true, /* 팝업을 통한 연동처리 여부 */
		callbackHandle : true,
		loginButton : {
			color : "green",
			type : 3,
			height : 45
		}
	/* 로그인 버튼의 타입을 지정 */
	});

	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>
<!-- 구글 로그인 -->
<script>
	function googleLogin() {
		console.log("구글 로그인 시작");
		gapi.load('auth2', function() {
			var gauth = gapi.auth2.init({
				client_id : '구글클라이언트ID'/* 구글 클라이언트 키 */
			})
			gauth.signIn()
					.then(
							function() {
								console.log("로그인 성공");
								var profile = gauth.currentUser.get()
										.getBasicProfile();

								$.ajax({
									url : "/TMS/naverAjax",
									type : 'POST',
									data : {
										'api_id' : profile.getId(),
										'email' : profile.getEmail(),
										'name' : profile.getName(),
										'type' : 'google'
									},
									dataType : 'text',
									success : function(data) {
										console.log(data);
										location.href = data;
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										alert("에러 발생~~ \n" + jqXHR.status
												+ " : " + errorThrown);
									}
								});

							}, function() {
								console.log("팝업 허용하셈");
							})
		})
	}
</script>
