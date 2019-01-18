<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운영안내</title>
<jsp:include page="/commons/head.jsp" />
<style>
footer {
	background-color: #3f3f3f;
	color: #d5d5d5;
	padding-top: 2rem;
}

footer a {
	color: #d5d5d5;
}

hr.light {
	border-top: 1px solid #d5d5d5;
	width: 75%;
	margin-top: .8rem;
	margin-bottom: 1rem;
}

hr.light-100 {
	border-top: 1px solid #d5d5d5;
	width: 100%;
	margin-top: .8rem;
	margin-bottom: 1rem;
}

.content {
	width: 80%;
	min-height: 650px;
	padding: 0 90px 100px;
	margin: 0 auto;
	box-sizing: border-box;
}

.uio_title {
	display: inline-block;
	position: relative;
	font-size: 20px;
	margin-bottom: 40px;
	font-weight: 400;
	letter-spacing: -.8px;
	color: #999;
}

.uio_title:after {
	position: absolute;
	left: 0;
	right: 0;
	bottom: -10px;
	content: '';
	width: 100%;
	height: 1px;
	background-color: #ebebeb;
}

h3 {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.uio_title_bullet {
	position: absolute;
	left: 0;
	bottom: -10px;
	width: 100%;
	height: 1px;
	z-index: 1;
}

.card {
	margin-top: 2rem;
	border: none;
}

.theme_color {
	color: #6c4a3f;
}
</style>

</head>
<body>
	<!-- Header -->
	<c:if test="${empty sessionScope.usersVO }">
		<jsp:include page="/commons/header.jsp" />
	</c:if>
	<c:if test="${not empty sessionScope.usersVO }">
		<c:if test="${sessionScope.usersVO.rank != 1 }">
			<jsp:include page="/commons/loginheader.jsp" />
		</c:if>
		<c:if test="${sessionScope.usersVO.rank == 1 }">
			<jsp:include page="/commons/adminLoginheader.jsp" />
		</c:if>
	</c:if>
	<!-- Header 끝 -->

	<!-- 본문  -->
	<!-- 게시판 제목 -->
	<div class="fc_content content _content_body">
		<div class="fcdeck_container">
			<div class="fcdeck_ct">
				<div class="card" data-cid="b7v11vhj"
					data-anchor="e9eb6b0870ac690c87777cd01fff71c2">
					<h3 class="uio_title theme_color" id="title">
						<span class="uio_title_bullet theme_background"></span>
						운영안내 및 운영방침
					</h3>
					<br>
					<div style="margin: auto; text-align: center;">
						<img src="/resources/images/운영안내.jpg" alt="운영안내 "
						width="80%" style="padding-bottom: 10px; border: 1px solid black;">
					</div>
					<!-- 
					<div class="main_area current" data-cid="b7v11vhj"
						data-anchor="e9eb6b0870ac690c87777cd01fff71c2" data-adult-flag="0"
						data-title="요금 및 이용안내">
						<div class="inner _inner">
							<div class="component_box _component" data-index="0">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="component_box _component" data-index="1">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="component_box _component" data-index="2">
								<div class="txt_box">
									<div class="txt_component color1 big align_l t_space "
										style="color: rgb(108, 74, 63)">
										<h4>모집게시판</h4>
									</div>
								</div>
							</div>
							<div class="component_box _component" data-index="3">
								<div class="txt_box">
									<div class="txt_component color1 big align_l t_space ">
										<p>혼자 공부하기 힘들어 하는 사람들을 위해 모집게시판을 운영합니다.</p>
										<p>기간 내에 모집 인원을 채운 후 예약을 할 경우 : 스터디룸 
											<strong style="color: #D8737F;">10% 할인</strong> 쿠폰 5개 지급
										</p>
									</div>
								</div>
							</div>
							<div class="component_box _component" data-index="4">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="r component_margin _component" data-index="5">
								<div class="view_table bdr_table ">
									<img src="/resources/images/1234567.PNG" alt="" width="80%"
										height="auto" style="margin-left: 5rem;">
								</div>
							</div>
							<br> <br>
							<div class="component_box _component" data-index="6">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="component_box _component" data-index="7">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="component_box _component" data-index="8">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="component_box _component" data-index="9">
								<div class="txt_box">
									<div class="txt_component color1 big align_l t_space "
										style="color: rgb(108, 74, 63)">
										<h4>후기 리뷰 및 댓글</h4>
									</div>
								</div>
							</div>
							<div class="component_box _component" data-index="10">
								<div class="division_line">
									<div class="space"></div>
								</div>
							</div>
							<div class="component_box _component" data-index="11">
								<div class="txt_box">
									<div class="txt_component color1 big align_l t_space ">
										<p>
											1. TMS를 한 번이라도 이용을 마친 고객들에 한해서 후기 작성이 가능합니다.<br>
										</p>
									</div>
								</div>
							</div>
							<div class="component_box _component" data-index="12">
								<div class="txt_box">
									<div class="txt_component color1 big align_l t_space ">
										<p>
											2. 후기를 작성할 시 <strong>1000원 쿠폰</strong> 이 1개 지급됩니다.
										</p>

									</div>
								</div>
							</div>
							<img src="/resources/images/1234568.PNG" alt="" width="80%"
								height="auto" style="margin-left: 5rem;"> <br> <br>

							<div class="component_box _component" data-index="23">
								<div class="txt_box">
									<div class="txt_component color1 big align_l t_space "
										style="color: rgb(108, 74, 63)">
										<h4>Turtle's Cafe</h4>
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col">
										<div class="component_box _component" data-index="12">
											<div class="txt_box">
												<div class="txt_component color1 big align_l t_space ">
													<p>1. 랩실 예약시, 음료는 인당 1잔 무료 제공됩니다.<br>
													(아메리카노, 아이스티, 탄산음료 중 선택 1종)</p>

												</div>
											</div>
										</div>
										<div class="component_box _component" data-index="12">
											<div class="txt_box">
												<div class="txt_component color1 big align_l t_space ">
													<p>2.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>

												</div>
											</div>
										</div>
									</div>
									<div class="col">
										<img src="/resources/images/menu01.PNG" alt="" width="100%"
											height="auto" style="margin-left: 5rem;">
									</div>
								</div>
							</div>

						</div>
					</div>
					 -->
				</div>

			</div>
		</div>
	</div>
	<!-- 본문 끝 -->

	<!--- Footer -->
	<footer>
	<div class="container-fluid padding">
		<div class="row text-center">
			<div class="col-md-4">
				<hr class="light">
				<h5>거북이의 기적</h5>
				<hr class="light">
				<p>010-4434-1507</p>
				<p>turtlesmiracle@gmail.com</p>
				<p>
					서울 서대문구 연세로5나길 8 <br> (서울 서대문구 창천동 57-23)
				</p>
			</div>
			<div class="col-md-4">
				<hr class="light">
				<h5>운영시간</h5>
				<hr class="light">
				<p>오전, 오후: 08am - 06pm</p>
				<p>저녁: 06pm - 10pm</p>
				<p>야간: 10pm - 08am</p>
				<p>365일 24시간 운영합니다.</p>
			</div>
			<div class="col-md-4">
				<hr class="light">
				<h5>지점</h5>
				<hr class="light">
				<p>거북이의 기적 신촌점(본점)</p>
				<p>거북이의 기적 종로점</p>
				<p>거북이의 기적 강남점</p>
			</div>
			<div class="col-12">
				<hr class="light-100">
				<h5>&copy; turtlesmiracle</h5>
			</div>
		</div>
	</div>
	</footer>
	
	
</body>
</html>