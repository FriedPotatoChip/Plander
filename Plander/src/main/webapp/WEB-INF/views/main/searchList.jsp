<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색화면</title>
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
	
</style>
</head>
<body>
<div id="container">
<!-- 헤더 -->
<c:if test="${empty user }"><jsp:include page="/commons/header.jsp"/></c:if>
<c:if test="${not empty user }"><jsp:include page="/commons/loginheader.jsp"/></c:if>

<!-- 카테고리 -->
<div>
	카테고리 목록 

</div>
<hr>


<!-- 검색된 카드목록 -->
<div>
	<p class="center"><b>${keyword }</b> 검색 결과</p>
	<c:if test="${not empty cnt }">
		<p style="text-align: right;"><b style="color: red">${cnt }</b> 개의 플래너</p>
	</c:if>
</div>
<hr>

<div id="search">
	<c:if test="${empty searchPlan }">
		<p class="center">검색 결과가 없습니다.</p>
	</c:if>
	<!-- 검색결과가 있을 때 -->
	<c:if test="${not empty searchPlan }">
		<c:forEach var="searchlist" items="${searchPlan }">
			<!-- 1번카드 -->
			<div class="col-md-3 col-sm-3 card-padding">
				<div class="card" style="width: 18rem; margin-bottom: 10%">
					<a><img class="card-img-top" src="/resources/images/do1.jpg" alt="카테고리 이미지"></a>
					<div class="card-body">
						<h5 class="card-title">${searchlist.p_title }</h5>
						<p style="text-align: right;">✓ 15  ♥ 40︎</p>
						<p class="card-text">
							${searchlist.p_start_date.substring(0, 10) }&nbsp;&#126;&nbsp;${searchlist.p_end_date.substring(0, 10) }
						<br>
						작성자 : ${searchlist.name }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

</div> <!-- 검색된 카드목록 끝 -->

<!-- 풋터 -->
<jsp:include page="/commons/footer.jsp"/>	
</div> <!-- 바디 콘테이너 끝 -->

</body>
</html>