<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PLANDER MAIN</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

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
	#home { font-family: 'East Sea Dokdo', cursive; font-size: 2em; }
	.center { text-align: center; }
	#mypage img { display: inline-block; }
	
	.card-padding { padding: 0 20px 0 20px; }
	
</style>
</head>
<body>
<div id="container">
	<div id="header" class="row">
		<div class="col-xs-12 col-sm-6 col-md-8">
			<a href="" id="home">플랜더</a>&nbsp;&nbsp;
			<a href="">전체 플래너</a>&nbsp;
			<a href="">플래너 작성</a>&nbsp;
			<a href="">이용방법</a>&nbsp;
		</div>
		<div class="col-xs-6 col-md-4"
			style="padding-top: 0.7%; text-align: right;">
			[ 관리자 ]&nbsp;<!-- 관리자 모드에서만 보이게 -->
			<a data-toggle="modal" href="login.jsp"
				data-target="#myModal" data-backdrop="static">로그인</a>&nbsp;
			<a href="join.jsp">회원가입</a>&nbsp;
			<select name="language">
				<option>한국어</option>
				<option>영어</option>
			</select>
		</div>
	</div>
	<br><br><br><br>
	
	<!-- 로그인 모달 -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:1200px;height:700px">
			<div class="modal-content">
			</div>
		</div>
	</div>
	
	<div id="mainbox" class="center">
		<h1>특별한 나만의 계획표를 만들어보아요!</h1><br>
		<form class="form-group">
			<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>
					<input type="text" name="search">&nbsp;
					<button type="button" onclick="">검색</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;">추천 플래너 : <a href="">연말계획</a>, <a href="">스터디</a></td>
			</tr>
			</table>
		</form>
	</div>
	<br><hr><br><br>
	
	<!-- 로그인시 보여주는 마이페이지 -->
	<div id="mypage">
		<div>
			<table width="100%" class="center">
				<tr>
					<td rowspan="3" width="10%">
						<img height="100" width="100" alt="힘이없을때는 경수를 보자" src="/resources/images/do.png">
					</td>
					<td colspan="2" width="13%"><b>도경수</b></td>
					<td rowspan="3" width="57%"><b style="font-size: 28px;">[오늘의 일정] 메인 페이지 만들기 !</b></td>
					<td rowspan="3" width="10%">일정<br>만들기</td>
					<td rowspan="3" width="10%">myPage</td>
				</tr>
				<tr>
					<td>전체일정</td>
					<td>북마크</td>
				</tr>
				<tr>
					<td>3</td>
					<td>4</td>
				</tr>
			</table>
		</div>
	</div>
	<br><br><br>
	
	<!-- 인기 카테고리 -->
	<div id="category">
	<div class="row">
		<!-- 1번 카테고리 -->
		<div>
		
		</div>
	</div>
	</div>
	<hr>
	
	<!-- 인기 플래너 -->
	<!-- 카드 바디 -->
	<div id="popular">
	<div class="row">
		<!-- 1번카드 -->
		<div class="col-md-3 col-sm-3 card-padding">
			<div class="card" style="width: 18rem;">
				<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
				<div class="card-body">
					<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
					<p style="text-align: right;">✓ 15  ♥ 40︎</p>
					<p class="card-text">2018/12/6<br>
					작성자 : 초록꿀매실</p>
				</div>
			</div>
		</div>
		
		<!-- 2번카드 -->
		<div class="col-md-3 col-sm-3 card-padding">
			<div class="card" style="width: 18rem;">
				<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
				<div class="card-body">
					<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
					<p style="text-align: right;">✓ 15  ♥ 40︎</p>
					<p class="card-text">2018/12/6<br>
					작성자 : 초록꿀매실</p>
				</div>
			</div>
		</div>
		
		<!-- 3번카드 -->
		<div class="col-md-3 col-sm-3 card-padding">
			<div class="card" style="width: 18rem;">
				<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
				<div class="card-body">
					<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
					<p style="text-align: right;">✓ 15  ♥ 40︎</p>
					<p class="card-text">2018/12/6<br>
					작성자 : 초록꿀매실</p>
				</div>
			</div>
		</div>
		
		<!-- 4번카드 -->
		<div class="col-md-3 col-sm-3 card-padding">
			<div class="card" style="width: 18rem;">
				<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
				<div class="card-body">
					<h5 class="card-title">아침 밥 먹기 프로젝트</h5>
					<p style="text-align: right;">✓ 15  ♥ 40︎</p>
					<p class="card-text">2018/12/6<br>
					작성자 : 초록꿀매실</p>
				</div>
			</div>
		</div> <!-- 4번카드 끝 -->
	</div>
	</div> <!-- 카드 바디 끝 -->
	<hr>
	
	
	<!-- 풋터 -->
	<div id="footer">
		<p class="center"><a href="">PLANDER</a>&nbsp;&nbsp;&nbsp;
			<a href="">고객센터</a>&nbsp;&nbsp;&nbsp;
			<a href="">플랜더팁</a>&nbsp;&nbsp;&nbsp;
			<a href="">FAQ</a>&nbsp;&nbsp;&nbsp;
			<a href="">문의하기</a>&nbsp;&nbsp;&nbsp;
			<a href="">모바일</a></p>
		<p class="center">Copyright ⓒ 2018 Plander.com, All Rights Reserved.</p>
	</div> <!-- 풋터 끝 -->
	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>