<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header" class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
		<a href="/Plander" id="home">플랜더</a>&nbsp;&nbsp;
		<a href="">전체 플래너</a>&nbsp;
		<a href="">플래너 작성</a>&nbsp;
		<a href="">이용방법</a>&nbsp;
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
	function chk() {
		if (!document.frm.id.value) {
			alert("아이디를 입력해주세요.");
			document.frm.id.focus();
			document.frm.action ="/Plander";
			return false;
		}
		
		if (!document.frm.password.value) {
			alert("비밀번호를 입력해주세요.");
			document.frm.password.focus()
			document.frm.action ="/Plander";
			return false;
		}
		
		document.frm.submit();
	}
	
	//아이디 중복확인
	function idchk() {
		var inputed = $('#id').val();
		$.ajax ({
			data : {id : inputed},
			url : '/Plander/idchk',
			
			success : function(data) {
				if (data=='0') {
					//아이디 사용가능
					$('#idMsg').html("<span style='color: forestgreen'>사용 가능한 아이디입니다.</span>");
				} else {
					$('#idMsg').html("<span style='color: red'>이미 사용중인 아이디입니다.</span>");
				}
			},
			error:function() {
				//alert("관리자에게 연락바랍니다.");
				return "error404.jsp";
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
		
		frm.action="/Plander/join"
		frm.submit();
		
	}
</script>


<!-- 로그인 모달창 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">

		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"><b>PLANDER LOGIN</b></h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<div class="modal-body center">
			<form name="frm" action="/Plander/login" method="post" onsubmit="chk()">
				<input type="text" name="id" class="form-control" placeholder="아이디">
				<input type="text" name="password" class="form-control" style="margin-top: 1.5%;"
					placeholder="비밀번호">
				<button type="submit" style="margin-top: 1.5%;"
					class="btn btn-outline-secondary form-control">로그인</button>
			</form>
			<hr>
			
			<form>
				<input type="button" name="googleLogin" class="btn btn-outline-secondary form-control"
						onclick="" value="구글 로그인">
				<input type="button" name="naverLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" value="네이버 로그인">
				<input type="button" name="kakaoLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" value="카카오톡으로 로그인">
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
					<label><input type="checkbox">&nbsp;<b>플랜더</b>에 가입하면서 <a>이용약관</a>과 <a>개인정보 취급방침</a>을 확인하고 이에 동의합니다.</label>
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




