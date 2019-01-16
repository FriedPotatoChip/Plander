<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글 아이디로 로그인</title>
<script>
function go_init(){
	console.log("go_init()"); 
		console.log("init()");
		
		gapi.load('auth2', function(){
			console.log("auth2");
			var gauth = gapi.auth2.init({
				client_id:'702849703047-ssi0aumpcmnp5bbdqm24vqem3pn6q1mr.apps.googleusercontent.com',
			    fetch_basic_profile: true,
			    scope: 'profile'
			}) 
			gauth.attachClickHandler('googleBtn', {}, function(){
				console.log("로그인 성공ㅇㅇ");
			}, function(){
				console.log("로그인 실패ㅇㅇ");
			});
				gauth.signIn().then(function(){
					console.log("로그인 성공");
				}, function(error) {
					if(error){
						alert("팝업 허용해주셈");
					}
				});
				
			
		});
		
		
		
		
}
</script>
</head>
<body> 
	<input type="button" value="버튼" onclick="go_init()">

	<button id="googleBtn"></button>




<script src="https://apis.google.com/js/platform.js" async defer></script>
</body>
</html>