<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>api로그인 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<form action="/TMS/signUp_api" method="post" name="joinform">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id" onkeypress="chkFalse()"></td>
			<td><input type="button" id="chkId" value="id 중복체크" onClick="idChkBtn()"></td>  
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" id="phone"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" id="address"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="회원가입" id="submitBtn" onclick="join()"></td>
		</tr>
	</table>
</form>



<script>
var idChk = false;


/* 빈칸 체크 */
function join() {
	
	var frm = document.joinform;
	
	if (!frm.id.value) {
		alert("아이디를 입력해주세요.");
		frm.id.focus();
		return false;
	}
	
	if (!frm.phone.value) {
		alert("핸드폰 번호를 입력해주세요.");
		frm.phone.focus();
		return false;
	}
	
	if (!frm.address.value) {
		alert("주소를 입력해주세요.");
		frm.address.focus();
		return false;
	}
	
	if (!idChk) {
		alert("id중복체크를 해주세요");
		return false;
	}
	
	frm.action="/TMS/signUp_api";
	frm.submit();
	
}
	
	
function chkFalse(){
	idChk = false;
}
	
	
/* 아이디 중복체크 */
function idChkBtn(){
	var frm = document.joinform;
	
	if (!frm.id.value) {
		alert("아이디를 입력해주세요.");
		frm.id.focus();
		return false;
	}
	
	
	
	$.ajax({
	    url:"/idChk_api",
	    type:'get',
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    data: {'id':frm.id.value},
	    dataType: 'text',
	    success:function(data){
	    	
	    	if (data == 'ok'){
	    		idChk = true;
	    		alert("사용 가능한 아이디입니다.");
	    	} else if (data == 'no') {
	    		idChk = false;
	    		alert("사용 불가능한 아이디입니다.\n다른 아이디를 입력해 주세요.");
	    	}
	    	
	    },
	    error:function(jqXHR, textStatus, errorThrown){
	        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	    }
	});
	
}


</script>
</body>
</html>