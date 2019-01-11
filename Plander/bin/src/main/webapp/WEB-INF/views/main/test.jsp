<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.imgSelect {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 130px;
	height: 160px;
	padding: 10px; 
}
.popupLayer div {
	position: absolute;
	top: 5px;
	right: 5px
}
</style>
<script language="javascript">
function closeLayer( obj ) {
	$(".popupLayer").hide();
}

$(function(){
	/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	$('.imgSelect').click(function(e)
	{
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $('.popupLayer').width();
		var oHeight = $('.popupLayer').height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.clientX + 10;
		var divTop = e.clientY + 5;

		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;

		$('.popupLayer').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).show();
		console.log(this);
		console.log($(this).attr("id")); 
	});
});
</script>
<title>주소 입력 샘플</title>
</head>
<body>
	<!-- 클릭 이미지 -->
	<p>
		<a class="imgSelect">클릭1</a>
		<a class="imgSelect">클릭2</a>
		<a class="imgSelect">클릭3</a>
		<a class="imgSelect">클릭4</a>
		<a class="imgSelect">클릭5</a>
		<a class="imgSelect">클릭6</a>
		<a class="imgSelect">클릭7</a>
		<a class="imgSelect">클릭8</a>
		<a class="imgSelect" id="asdf">클릭9</a>
		<a class="imgSelect">클릭10</a> 
	</p>
	
	<div class="popupLayer">
		<div>
			<span onClick="closeLayer()" style="cursor:pointer; font-size: 0.85em; color: gray;" title="닫기">X</span>
		</div>
		<a href="#">쪽지 보내기</a><br>
		<a href="#">회원 정보 보기</a><br>
		<a href="#">작성글 보기</a><br>
	</div>
</body>
</html>