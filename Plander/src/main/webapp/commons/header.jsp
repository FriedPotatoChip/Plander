<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 구글 로그인 -->    
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- 카카오 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<div id="header" class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
		<a href="/TMS" id="home">거기스</a>&nbsp;&nbsp;
		<a href="">테스트용 헤더</a>&nbsp;
	</div>
	<div class="col-xs-6 col-md-4" style="text-align: right; padding-top: 0.8%;">
		<!-- 로그인 모달 창 -->
		<a data-toggle="modal" href="#myModal">로그인</a>&nbsp;
		<a data-toggle="modal" href="#joinModal">회원가입</a>&nbsp;
		<select name="language">
			<option value="ko">한국어</option>
			<option value="en">영어</option>
		</select>
	</div>
</div>
<br><br><br><br>
<!-- 헤더 끝 -->


<script>
var chkId = false;
	function chk() {
		if (!document.frm.id.value) {
			alert("아이디를 입력해주세요.");
			document.frm.id.focus();
			document.frm.action ="/TMS";
			return false;
		}
		
		if (!document.frm.password.value) {
			alert("비밀번호를 입력해주세요.");
			document.frm.password.focus()
			document.frm.action ="/TMS";
			return false;
		}
		
		document.frm.submit();
	}
	
	//아이디 중복확인
	function idchk() {
		var inputed = $('#id').val();
		$.ajax ({
			data : {'id' : inputed},
			url : '/idChk_api',
			
			success : function(data) {
				if (data=='ok') {
					chkId = true;
					//아이디 사용가능
					$('#idMsg').html("<span style='color: forestgreen'>사용 가능한 아이디입니다.</span>");
				} else {
					chkId = false;
					$('#idMsg').html("<span style='color: red'>이미 사용중인 아이디입니다.</span>");
				}
			},
			error:function() {
				//alert("관리자에게 연락바랍니다.");
				return "/commons/error404.jsp";
			}
		})
	}
	
	//비밀번호 확인
	function pwchk() {
		var pw = $('#password').val();
		var pwchk = $('#passwordchk').val();
		
		if (pw != pwchk || pwchk=="") {
			//alert("비밀번호가 일치하지 않습니다. pwchk : " + pwchk + ", pw : "+ pw);
			$('#pwchkMsg').html("<span style='color: red'>비밀번호가 일치하지 않습니다.</span>");
		} else {
			$('#pwchkMsg').html("<span style='color: forestgreen'>비밀번호가 일치합니다.</span>");
		}
	}
	
	//회원가입 
	function join() {
		
		var frm = document.joinform;
		
		if (!frm.id.value) {
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return false;
		}
		
		if (!frm.password.value) {
			alert("비밀번호를 입력해주세요.");
			frm.password.focus();
			return false;
		}
		
		if (!frm.name.value) {
			alert("이름을 입력해주세요.");
			frm.name.focus();
			return false;
		}
		
		if (!frm.phone.value) {
			alert("핸드폰 번호를 입력해주세요.");
			frm.phone.focus();
			return false;
		}
		
		if (!frm.email.value) {
			alert("이메일을 입력해주세요.");
			frm.email.focus();
			return false;
		}
		
		if (!chkId) {
			alert("Id 중복체크를 해주세요");
			frm.email.focus();
		}
		
		frm.action="/Plander/join" 
		frm.submit();
		
	}
</script>


<!-- 로그인 모달창 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">

		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"><b>TMS LOGIN</b></h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<div class="modal-body center">
			<form name="frm" action="/TMS/login" method="post" onsubmit="chk()">
				<input type="text" name="id" class="form-control" placeholder="아이디">
				<input type="text" name="password" class="form-control" style="margin-top: 1.5%;"
					placeholder="비밀번호">
				<button type="submit" style="margin-top: 1.5%;"
					class="btn btn-outline-secondary form-control">로그인</button>
			</form>
			<hr>
			
			<form>
				<!-- <input type="button" name="googleLogin" class="btn btn-outline-secondary form-control"
						onclick="" value="구글 로그인"> -->
				<input type="button" value="구글 로그인" id="googleBtn" onclick="googleLogin()">
			<!-- 네이버 로그인 -->
				<div id="naverIdLogin"></div>
				<!-- <input type="button" name="naverLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" id="naverIdLogin" value="네이버 로그인"> -->
			<!-- 카카오 로그인 -->
				<a id="kakao-login-btn"></a>
				<!-- <input type="button" name="kakaoLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" value="카카오톡으로 로그인"> -->
			</form><hr>
			
			<div class="center">
				<a href="/Plander/findIdPw">아이디 찾기</a>&nbsp;
				<a href="/Plander/findIdPw">비밀번호 찾기</a>&nbsp;
				<a data-toggle="modal" href="#joinModal" data-dismiss="modal">회원가입</a>
			</div>
		</div>
			
	</div>
	</div>
</div>
<!-- 로그인 모달창 끝 -->

<!-- 회원가입 모달창 -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">

		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"><b>JOIN US !</b></h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<form name="joinform" action="/Plander/join" method="post">
		<div class="modal-body">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td width="35%">아이디&nbsp;<b style="color: red;">&#42;</b></td>
						<td width="65%">
							<input type="text" name="id" id="id" oninput="idchk()" class="col-sm-6 form-control">
							<p id="idMsg" style="font-size: 13px;"></p>
						</td>
					</tr>
					<tr>
						<td>비밀번호&nbsp;<b style="color: red;">&#42;</b></td>
						<td>
							<input type="password" name="password" id="password"
								oninput="pwchk()" class="col-sm-6 form-control">
							<p id="pwMsg" style="font-size: 13px;">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</p>
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인&nbsp;<b style="color: red;">&#42;</b></td>
						<td>
							<input type="password" name="passwordchk" id="passwordchk"
								oninput="pwchk()" class="col-sm-6 form-control">
							<p id="pwchkMsg" style="font-size: 13px;"></p>
							<!-- 비밀번호가 일치하지 않습니다. -->
						</td>
					</tr>
					<tr>
						<td>이름&nbsp;<b style="color: red;">&#42;</b></td>
						<td><input type="text" name="name" class="col-sm-6 form-control"></td>
					</tr>
					
					<tr>
						<td>휴대전화&nbsp;<b style="color: red;">&#42;</b></td>
						<td><input type="text" name="phone" class="col-sm-10 form-control"></td>
					</tr>
					<tr>
						<td>이메일&nbsp;<b style="color: red;">&#42;</b></td>
						<td><input type="text" name="email" class="col-sm-10 form-control"></td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<p>이미 회원이신가요?&nbsp;
			<a data-toggle="modal" href="#myModal" data-dismiss="modal">로그인</a></p>
			<div id="admit">
				<div class="checkbox">
					<label><input type="checkbox">&nbsp;<b>거기스</b>에 가입하면서 <a>이용약관</a>과 <a>개인정보 취급방침</a>을 확인하고 이에 동의합니다.</label>
				</div>
			</div>
		</div> <!-- 모달 바디 끝 -->
		
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
    Kakao.init('카카오 로그인');	/* 클라이언트 id 숨겨두기 */
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        <!-- alert(JSON.stringify(authObj)); -->
        
        Kakao.API.request({
	      url: '/v1/user/me',
	      success: function(res) {
				
	     		$.ajax({
	    		    url:"/TMS/naverAjax",
	    		    type:'POST',
	    		    data: {'api_id' : res.id, 'email':res.kaccount_email, 'name':res.properties['nickname'], 'type':'kakao'},
	    		    dataType: 'text',
	    		    success:function(data){
	    		        console.log(data);
	    		        location.href=data;
	    		    },
	    		    error:function(jqXHR, textStatus, errorThrown){
	    		        alert("에러 발생~~ \n" + jqXHR.status + " : " + errorThrown);
	    		    }
	    		});
	             
	             
	             
           }
        })
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<!-- 네이버 로그인 api -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "네이버 클라이언트 id", /* 클라이언트 ID (숨겨두기) */
			callbackUrl: "http://localhost:8095/TMS/naverCallback",
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			callbackHandle: true,
			loginButton: {color: "green", type: 3, height: 45} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
<!-- 구글 로그인 -->
<script>
	function googleLogin(){
		console.log("구글 로그인 시작");
		gapi.load('auth2', function(){
			var gauth = gapi.auth2.init({
				client_id:'구글 클라이언트 id'/* 구글 클라이언트 키 */
			})
			gauth.signIn().then(function(){
				console.log("로그인 성공");
				var profile = gauth.currentUser.get().getBasicProfile();
				
	     		$.ajax({
	    		    url:"/TMS/naverAjax",
	    		    type:'POST',
	    		    data: {'api_id' : profile.getId(), 'email':profile.getEmail(), 'name':profile.getName(), 'type':'google'},
	    		    dataType: 'text',
	    		    success:function(data){
	    		        console.log(data);
	    		        location.href=data;
	    		    },
	    		    error:function(jqXHR, textStatus, errorThrown){
	    		        alert("에러 발생~~ \n" + jqXHR.status + " : " + errorThrown);
	    		    }
	    		});
	     		
			}, function(){
				console.log("팝업 허용하셈");
			})
		})
	}
</script>
