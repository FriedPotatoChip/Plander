<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Category - PlannerList</title>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">

<!— 반응형 웹페이지 링크 ======================================================================== —>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!— ======================================================================================== —>
<style>
 body, html {
	margin: auto;
	padding: 0;
	width: 90%;
	height: 100%;
	font-size: 100%;
	font-family: 'open sans';
} 

 .wrap {
	width: 100%;
	margin: 0 auto;
	position: relative;
}

.planner_title {
	width: 100%;
	text-align: center;
	font: #555555;
	font-size: 100%;
	font-weight: bold;
	padding: 1%;
}

.planner_section {
	border-top: 1px solid #cfcfcf;
	border-bottom: 1px solid #cfcfcf;
	width: 100%;
	height: 55px;
	line-height: 55px;
}

.planner_left {
	float: left;
	border-right: 1px solid #cfcfcf;
	text-align: center;
	width: 12%;
	font-weight: bold;
	color: #555555;
}

.planner_category {
	display: block;
	width: 11%;
	float: left;
	font-size: 100%;
	color: #555555;
	text-align: center;
}

.test {
	margin-top:3rem;
	width:100%;
}
</style>

</head>
<body>
	<!-- 카테고리 -->
	<div class="area_category">
		<div class="wrap">
			<div class="planner_title">주요 카테고리</div>
			<div class="planner_section">
				<span class="planner_left">인기 주제</span>
				<c:forEach var="category" items="${category }">
					<a href="/Plander/view/CategoryDetailPlanner?ct_idx=${category.ct_idx }" class="planner_category" value="">${category.ct_name }</a>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 카드형식 -->
	<div class="test">
		<!-- 1번카드 -->
		<c:forEach var="plannerDetail" items="${plannerDetail }">
		<div class="col-sm-3 col-md-3 col-lg-3 card-padding d-inline-flex p-auto mb-3" style="width:15rem">
			<div class="card" style="width: 15rem;">
				<a><img class="card-img-top" src="/resources/images/do1.jpg"
					alt="카테고리 이미지"></a>
				<div class="card-body">
					<h5 class="card-title">${plannerDetail.p_title }</h5>
					<p style="text-align: right;">✓ ${plannerDetail.hit } ♥ ${plannerDetail.good	 }</p>
					<p class="card-text">
						${plannerDetail.regdate }<br> ${plannerDetail.name }
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>