<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 카카오톡 스크립트 -->
<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('7f1c97ebc60e0922d433ca623b3d12dd');
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				alert("카카오톡으로 로그인합니다!");
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	};
</script>

<style>
	body, html { width: 90%; margin: auto; }
	img {
/* 	width: 100%; height: 100%; */
	}
	
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
</style>

</head>
<body>
<a id="custom-login-btn" href="javascript:loginWithKakao()"><button>카카오톡 로그인</button></a>
<a href="http://developers.kakao.com/logout">로그아웃</a>

<hr>

<div class="row">
	<div class="col-md-3 col-sm-3" style="border: 1px solid; ">
		<a class="card-img-top" style="overflow: hidden;">
		<img style="width: 100%;" src="/resources/images/3.jpg" alt="카테고리 이미지"></a>
		
	</div>
	
	<div class="col-md-3 col-sm-3" style="border: 1px solid;">
		<a><img style="width: 100%;" src="/resources/images/1.jpg" alt="카테고리 이미지"></a>
		
	</div>
</div>

<hr>



</body>
</html>