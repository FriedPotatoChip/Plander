<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function checkLoginStatus(){
		var loginBtn = document.querySelector("#loginBtn");
		var nameTxt = document.querySelector("#name");
		if(gauth.isSignedIn.get()){ 
			console.log("logined");
			loginBtn.value = 'Logout';
			var profile = gauth.currentUser.get().getBasicProfile();
			console.log(profile);
			console.log(profile.getName());
			console.log(profile.getId());
			nameTxt.innerHTML = 'Welcome <strong>'+ profile.getName() + '</strong> ';
		} else {
			console.log("logouted");
			loginBtn.value = 'Login';
			nameTxt.innerHTML = '';
		}
	}
 

	function init() {
		console.log('init');
		gapi.load('auth2', function() {
			console.log('auth2');
			// var gauth = gapi.auth2.init({
			window.gauth = gapi.auth2.init({
				client_id:'702849703047-ssi0aumpcmnp5bbdqm24vqem3pn6q1mr.apps.googleusercontent.com'	/* 구글 클라이언트 ID */
			})
			gauth.then(function(){
				console.log('googleAuth success');
				checkLoginStatus();
			}, function(){
				console.log("googleAuth fail");
			});
 		});
	}
</script>

</head>
<body>
 	<span id="name"></span><input type="button" id="loginBtn" value="checking..." onclick="
	if(this.value == 'Login'){
		gauth.signIn().then(function(){
			console.log('gauth.signIn()');
			checkLoginStatus();
		});
	} else {
		gauth.signOut().then(function(){
			console.log('gauth.signOut()');
			checkLoginStatus();
		});
	}">
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>
</body>
</html>