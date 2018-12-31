<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>faq</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<a href="javascript:void plusFriendChat()"> <img
		src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png" />
	</a>
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('55b7b74f99bbb6a1c4d227a63c3d78d8');
		function plusFriendChat() {
			Kakao.PlusFriend.chat({
				plusFriendId : '_xcLqmC' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
			});
		}
		//]]>
	</script>

</body>
</html>

