<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<!-- 반응형 웹페이지 링크 ======================================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- ======================================================================================== -->

<style>
	body, html { width: 90%; margin: auto; }
	* { font-family: 'Noto Sans KR', sans-serif; text-decoration: none; }
	.center { text-align: center; }
</style>
</head>
<body>

<!-- 로그인 모달 창 -->
<button type="button" class="btn btn-link"
	data-toggle="modal" data-target="#myModal">로그인
</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">LOGIN</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<form action="/Plander/login" method="post">
				<div class="modal-body">
					<input type="text" name="id" placeholder="아이디">
					<input type="text" name="pw" placeholder="비밀번호">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-outline-secondary">로그인</button>
					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
				</div>
			</form>
			
		</div>
	</div>
</div>

</body>
</html>