<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
	
	var id;
	var email;
	var name;
	
	
	
	var naver_id_login = new naver_id_login("네이버 클라이언트 아이디", "http://localhost:8095/TMS/naverCallback");/* 네이버 클라이언트 id */
	// 접근 토큰 값 출력
	console.log(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		console.log(naver_id_login.getProfileData('email'));
		console.log(naver_id_login.getProfileData('name'));
		console.log(naver_id_login.getProfileData('id'));
		id = naver_id_login.getProfileData('id');
		email = naver_id_login.getProfileData('email');
		name = naver_id_login.getProfileData('name');
		
		$.ajax({
		    url:"/TMS/naverAjax",
		    type:'POST',
		    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    data: {'api_id' : id, 'email':email, 'name':name, 'type':'naver'},
		    dataType: 'text',
		    success:function(data){
		        console.log(data);
		        window.opener.location.href=data;

		        window.close();
		    },
		    error:function(jqXHR, textStatus, errorThrown){
		        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		    }
		});
	}
 
 
 
 
 
  
  
  
  
  
  
</script>
</body>
</html>