<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AllPlannerList</title>

<!-- jQuery first -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js">
	
</script>
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

/* .planner_box {
	background: white;
	border-left: 1px solid #cfcfcf;
	border-right: 1px solid #cfcfcf;
	border-bottom: 1px solid #cfcfcf;
} */
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

.area_planner {
	width: 100%;
	padding: 1%;
}

.planner_tap {
	float: right;
}

.po_category {
	font-weight: normal;
	cursor: pointer;
	float: left;
	font-size: 70%;
}

.po_category.on {
	color: #b197fc;
}

.po_line {
	float: left;
	width: 1px;
	height: 12%;
	background: #cbcbcb;
	margin-left: 15px;
	margin-right: 15px;
}

.planner_box {
	width: 100%;
	box-sizing: border-box;
}

.po_planner {
	float: left;
	width: 250px;
	height: 200px;
	margin-top: 2%;
	margin-right: 0.5%;
	position: relative;
	overflow: hidden;
}

.po_planner_name {
	position: absolute;
	left: 0;
	top: 40%;
	width: 100%;
	height: 100%;
	vertical-align: middle;
	text-align: center;
	font-weight: bold;
	color: white;
	font-size: 120%;
	line-height: auto;
	z-index: 1;
}

.po_planner_img {
	width: 100%;
	height: 100%;
	-webkit-transition: all 3.6s;
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
}

.clear {
	clear: both
}

.planner_top_name.as {
	background-image: url("../resources/images/heartbeat.png");
	background-repeat: no-repeat;
	background-size: 1.3em 1.3em;
}

.planner_top_name {
	width: 100%;
	height: 1.0em;
	padding-bottom: 0.3em;
	border-bottom: 1px solid #e3e3e3;
	font-weight: bold;
	font-size: 100%;
	color: #ff9320;
	padding-left: 2em;
	line-height: 1.2em;
}

.planner_list {
	padding-top: 0.4em;
	padding-bottom: 1em;
	box-sizing: border-box;
}

.planner_n_link {
	display: block;
	width: 25%;
	float: left;
	color: #555555;
	font-size: 0.8em;
	font-weight: bold;
	padding-top: 0.4em;
	padding-bottom: 0.4em;
	text-decoration: none;
}
</style>
<script type="text/javascript">
		$(document).ready(function() {

			$('.po_category').click(function() {

				//색변환
				$('.po_category').removeClass('on');
				$(this).addClass('on');
				get_reco_planner();
			})
		});

		function get_reco_planner() {
			console.log('aaaa');
			var code = $('.po_category.on').attr('value');
			console.log(code);
			$.ajax({
				url : '/Plander/view/test',
				data : {
					'ct_idx' : code
				},
				success : function(data) {
					console.log(data);
					var _html = "";
					$(data).each(function() {
						_html += '<a href="#" class="po_planner"><div class="po_planner_name">'
								+ this.p_title
								+ '</div>';
						_html += "<img src='../resources/images/"+this.p_idx+".jpg' class='po_planner_img'></a>";
					});

					_html += '<div class="clear"></div>';

					$('.planner_box').html(_html);
				}
			});
		}
</script>
</head>
<body>

	<!-- (대)주제 카테고리 -->
	<div class="area_category">
		<div class="wrap">
			<div class="planner_title">주요 카테고리</div>
			<div class="planner_section">
				<span class="planner_left">인기 주제</span>
				<c:forEach var="category" items="${category }">
					<a
						href="/Plander/view/CategoryDetailPlanner?ct_idx=${category.ct_idx }"
						class="planner_category">${category.ct_name }</a>
				</c:forEach>
			</div>
		</div>
	</div>


	<!--추천 카테고리 -->
	<div class="area_planner">
		<div class="wrap">
			<div class="planner_title">Recommended Planner</div>
			<div class="planner_tap">
				<div class="po_category on" value="0">추천</div>
				<div class="po_line">&nbsp;</div>
				<c:forEach var="category" items="${category }">
					<div class="po_category" value="${category.ct_idx }">${category.ct_name }</div>
					<div class="po_line">&nbsp;</div>
					<!-- 			<div class="po_category">가계부</div>
				<div class="po_line">&nbsp;</div>
				<div class="po_category">식단</div>
				<div class="po_line">&nbsp;</div>
				<div class="po_category">공부</div> -->
				</c:forEach>
			</div>
			<div class="clear" />
			<div class="planner_box">
				<c:forEach var="plannerRandom" items="${plannerRandom }">

					<a href="#" class="po_planner">
						<div class="po_planner_name" value="${plannerRandom.ct_idx }">${plannerRandom.p_title }</div>
						<img src="../resources/images/${plannerRandom.p_idx }.jpg" alt
						class="po_planner_img">
					</a>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 칸 설정  -->
	<div class="clear" />
	<!-- 전체 카테고리 상세리스트 -->


	<c:forEach var="category" items="${category }">
		<div class="area_planner">
			<div class="wrap">
				<div class="planner_title">Category List</div>
				<div class="planner_top_name as">${category.ct_name }</div>
				<div class="planner_list">
					<c:forEach var="category_d" items="${category_d }">
						<c:if test="${category_d.ct_idx == category.ct_idx }">
							<a href="#" class="planner_n_link">${category_d.ctd_name }&nbsp;
								<span>${category_d.ctd_name_e }</span>
							</a>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:forEach>

	<!-- <div class="area_planner">
		<div class="wrap">
			<div class="planner_title">Category List</div>
			<div class="planner_top_name as">Healthy</div>
			<div class="planner_list">
				<a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a> <a href="#" class="planner_n_link"> 다이어트&nbsp; <span>Diet</span>
				</a>
			</div>
		</div>
	</div> -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>