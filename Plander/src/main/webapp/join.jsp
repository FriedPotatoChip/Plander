<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->

<script>
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
	function join(frm) {
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
		
		if (!frm.phone1.value) {
			alert("핸드폰 번호를 입력해주세요.");
			frm.phone1.focus();
			return false;
		}
		
		if (!frm.phone2.value) {
			alert("핸드폰 번호를 입력해주세요.");
			frm.phone2.focus();
			return false;
		}
		
		if (isNaN(frm.phone2.value) || isNaN(frm.phone3.value)) {
			alert("핸드폰 번호는 숫자만 들어갈 수 있습니다.");
			return false;
		}
		
		if (!frm.email1.value) {
			alert("이메일을 입력해주세요.");
			frm.email1.focus();
			return false;
		}
		
		if (!frm.email2.value) {
			alert("이메일을 입력해주세요.");
			frm.email2.focus();
			return false;
		}
		
		frm.action = "/Plander/join";
		frm.submit();
		
	}
	
</script>


<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
	.center { text-align: center; }
</style>

</head>
<body>
<div id="container">
<!-- 헤더 -->
<c:if test="${empty user }"><jsp:include page="/commons/header.jsp"/></c:if>

	<!-- 회원가입 -->
	<h3 class="center">JOIN US !</h3><br>
	<h5>기본정보</h5>
	<hr>
	<form method="post">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td width="25%">아이디&nbsp;<b style="color: red;">&#42;</b></td>
					<td width="75%">
						<input type="text" name="id" id="id" oninput="idchk()" class="col-sm-4">&nbsp;
						<span id="idMsg" style="font-size: 13px;"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호&nbsp;<b style="color: red;">&#42;</b></td>
					<td>
						<input type="password" name="password" id="password" oninput="pwchk()" class="col-sm-4">&nbsp;
						<span id="pwMsg" style="font-size: 13px;">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인&nbsp;<b style="color: red;">&#42;</b></td>
					<td>
						<input type="password" name="passwordchk" id="passwordchk" oninput="pwchk()" class="col-sm-4">&nbsp;
						<span id="pwchkMsg" style="font-size: 13px;"></span>
						<!-- 비밀번호가 일치하지 않습니다. -->
					</td>
				</tr>
				<tr>
					<td>이름&nbsp;<b style="color: red;">&#42;</b></td>
					<td><input type="text" name="name"
						class="col-sm-4 form-control input-sm"></td>
				</tr>
				
				<tr>
					<td>휴대전화&nbsp;<b style="color: red;">&#42;</b></td>
					<td class="form-inline">
						<input type="text" name="phone" class="col-sm-6 form-control">
					</td>
				</tr>
				<tr>
					<td>이메일&nbsp;<b style="color: red;">&#42;</b></td>
					<td class="form-inline">
						<input type="text" name="email" class="col-sm-6 form-control">
					</td>
				</tr>
			</tbody>
		</table>
		
		<br><br>
		<h5>전체동의</h5>
		<div id="admit">
			<div class="checkbox">
				<label><input type="checkbox">&nbsp;<b>이용약관 및 개인정보수집 및 이용에 모두 동의합니다.</b></label>
			</div>
			
			<br>
			<p><b>[필수] 이용약관 동의</b></p>
			<textarea class="form-control" rows="3">본 개인정보 보호정책은 이 운영하는 플랜더 서비스를 이용하는 인터넷 사용자들의 기본권인 사생활 비밀과 자유 및 통신 비밀을 보장하고 불법적인 도청, 정보 유출로 인한 인권침해가 나타나지 않도록 하고자 명시하는 것입니다.
플랜더의 개인 정보 보호정책은 정부의 법률 및 지침 변경에 따라 변경될 수 있으므로 회원님께서는 사이트 방문 시에 수시로 확인하시기 바랍니다.
			</textarea>
			
			<div class="checkbox">
				<label><input type="checkbox">&nbsp;이용약관에 동의하십니까?</label>
			</div>
		</div>
		<br><br>
		
		<div class="center">
			<button type="button" id="userjoin" onclick="join(this.form)"
				class="btn btn-outline-secondary">회원가입</button>
			<button type="reset" class="btn btn-outline-secondary">취소</button>
		</div>
	</form>

<br><br><br><br>
<!-- 풋터 -->
<jsp:include page="/commons/footer.jsp"/>	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>