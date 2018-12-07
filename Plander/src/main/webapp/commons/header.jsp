<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header" class="row">
	<div class="col-xs-12 col-sm-6 col-md-8">
		<a href="" id="home">플랜더</a>&nbsp;&nbsp;
		<a href="">전체 플래너</a>&nbsp;
		<a href="">플래너 작성</a>&nbsp;
		<a href="">이용방법</a>&nbsp;
	</div>
	<div class="col-xs-6 col-md-4" style="text-align: right; padding-top: 0.8%;">
		[ 관리자 ]&nbsp;<!-- 관리자 모드에서만 보이게 -->
		
		<!-- 로그인 모달 창 -->
		<a data-toggle="modal" href="#myModal" >로그인</a>&nbsp;
		<a href="">회원가입</a>&nbsp;
		<select name="language">
			<option value="ko">한국어</option>
			<option value="en">영어</option>
		</select>
	</div>
</div>
<br><br><br><br>

<!-- 로그인 모달창 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">

		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"><b>PLANDER LOGIN</b></h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<form action="/Plander/login" method="post">
			<div class="modal-body center">
				<input type="text" name="id" class="form-control" placeholder="아이디">
				<input type="text" name="pw" class="form-control" style="margin-top: 1.5%;"
					placeholder="비밀번호">
				<hr>
				<input type="button" name="googleLogin" class="btn btn-outline-secondary form-control"
					onclick="" value="구글 로그인">
				<input type="button" name="naverLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" value="네이버 로그인">
				<input type="button" name="kakaoLogin" class=" btn btn-outline-secondary form-control"
					style="margin-top: 1.5%;" onclick="" value="카카오톡으로 로그인">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-outline-secondary form-control">로그인</button>
			</div>
			<div class="center">
				<a href="">아이디 찾기</a>&nbsp;
				<a href="">비밀번호 찾기</a>&nbsp;
				<a href="">회원가입</a>
			</div>
			<br>
		</form>
	</div>
	</div>
</div>
<!-- 로그인 모달창 끝 -->