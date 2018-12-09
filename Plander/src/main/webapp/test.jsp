<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
</head>
<body>
<a id="custom-login-btn" href="javascript:loginWithKakao()"><button>카카오톡 로그인</button></a>
<a href="http://developers.kakao.com/logout">로그아웃</a>

</body>
</html>