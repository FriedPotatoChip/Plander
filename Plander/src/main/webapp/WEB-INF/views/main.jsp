<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	/* .card-padding { padding: 0 20px 0 20px; } */
	
	/* 인기 카테고리
	.planner_box { width: 100%; box-sizing: border-box; }
	.po_planner { */
		/* float: left; */
		/* width: 286px;
		height: 191px; */
		/* margin-top: 2%; margin-right: 0.5%;
		position: relative; */
	/* 	overflow: hidden;
	}
	.po_planner_img {
		width: 100%;
		height: 100%;
		-webkit-transition: all 3.6s;
		margin: 0; padding: 0; border: 0;
		font-size: 100%;
		font: inherit;
	} */
	/* 인기 카테고리 끝 */
	
	
	
</style>
</head>
<body>
<div id="container">
<!-- 헤더 -->

<c:choose>
	<c:when test="${not empty user }">
		<jsp:include page="/commons/loginheader.jsp"/>
	</c:when>
	<c:when test="${not empty admin }">
		<jsp:include page="/commons/adminLoginheader.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:include page="/commons/header.jsp"/>
	</c:otherwise>
</c:choose>
	
<!-- 로그인 모달 -->
<div id="mainbox" class="center">
	<h1>특별한 나만의 계획표를 만들어보아요!</h1><br>
	<form class="form-group" method="post" action="/Plander/search">
		<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>
				<input type="text" name="keyword" placeholder="제목/내용으로 검색">&nbsp;
				<button type="submit">검색</button>
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
<c:if test="${not empty user }">
<jsp:include page="/commons/mypageBar.jsp"/></c:if>

<!--추천 카테고리 ================================================================== 카테고리 EL 태그 넣기 -->
<div class="row">
	<!-- 1번 카테고리 -->
	<div style="border: 1px solid; width: 286px; height: 191px; overflow: hidden;">
		<div>
		<a><img class="card-img-top" src="/resources/images/3.jpg" alt="카테고리 이미지"></a>
		이미지 넣기,,,,사이즈,,,,,,,,,,
		</div>
	</div>
	<!-- 2번 -->
	<div style="border: 1px solid; width: 286px; height: 191px; overflow: hidden;">
		<div>
		<a><img class="card-img-top" src="/resources/images/do.png" alt="카테고리 이미지"></a>
		</div>
	</div>
	<!-- 3번 -->
	<div style="border: 1px solid; width: 286px; height: 191px; overflow: hidden;">
		<div>
		이미지 넣기,,,,사이즈,,,,,,,,,,
		</div>
	</div>
	<!-- 4번 -->
	<div style="border: 1px solid; width: 286px; height: 191px; overflow: hidden;">
		<div>
		이미지 넣기,,,,사이즈,,,,,,,,,,
		</div>
	</div>
</div>


<%-- <div class="">
	<div class="planner_box">
		<c:forEach var="category" items="${category }">
			<a href="#" class="po_planner"
				style=" overflow: hidden; width: 286px; height: 191px;">
				<img src="../resources/images/${category.ct_idx }.jpg" alt="추천 카테고리" class="po_planner_img"
				style="width: 100%; height: 100%;">
			</a>
		</c:forEach>
	</div>
</div> --%>
<!-- ============================================================================================= -->


<!-- 인기 플래너 -->
<!-- 카드 바디 -->
<div id="popular">
<br><hr><br><br>
<!-- <p class="center">목록이 없습니다 T_T 새로운 플래너를 작성해보세요!</p> -->
	<c:if test="${empty listPlan }">
		<p class="center">목록이 없습니다 T_T 새로운 플래너를 작성해보세요!</p>
	</c:if>
	
	<!-- 플래너에 데이터가 있음 -->
<div class="row">
	<c:if test="${not empty listPlan }">
	<c:forEach var="list" items="${listPlan }">
		<!-- 1번카드 -->
		<div class="col-md-3 col-sm-3 card-padding">
			<div class="card" style="width: 18rem; margin-bottom: 10%">
				<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
				<div class="card-body">
					<h5 class="card-title">${list.p_title }</h5>
					<p style="text-align: right;">✓ 15  ♥ 40︎</p>
					<p class="card-text">
						${list.p_start_date.substring(0, 10) }&nbsp;&#126;&nbsp;${list.p_end_date.substring(0, 10) }
					<br>
					작성자 : ${list.name }</p>
				</div>
			</div>
		</div>
	</c:forEach>
	</c:if> <!-- 카드 바디 전체 리스트 -->
</div>


</div> <!-- 카드 바디 끝 -->
<hr>

<!-- 풋터 -->
<jsp:include page="/commons/footer.jsp"/>	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>