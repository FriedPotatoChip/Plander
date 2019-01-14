<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:include page="/commons/head.jsp"></jsp:include> --%>
<style>
a {
	font-weight: 700;
	font-size: 16px;
	color: #666;
}


.user {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}

.dropbtn {
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content2 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #475C7A;
	color: white;
	font-weight: 700;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.sendId {
	color: #198CFF;
}

.pointer:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container-fluid">

			<a class="navbar-brand" href="/TMS"><img
				src="/resources/images/logo.png" width="150px" height="50px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">운영안내</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
					<li class="nav-item"><a class="nav-link" href="/TMS/book">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="/TMS/recruit">모집게시판</a></li>
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link dropbtn" href="#">게시판</a>
							<div class="dropdown-content">
								<a href="/TMS/board?ct_idx=1">공지사항</a> <a
									href="/TMS/board?ct_idx=2">자유게시판</a><a
									href="/TMS/board?ct_idx=3">후기게시판</a> <a href="/TMS/ask">문의하기</a>
							</div>
						</div>
					</li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><c:if test="${not empty usersVO }">
							<div class="dropdown">
								<a class="nav-link dropbtn" href="/TMS/my"> <c:if
										test='${empty usersVO.user_profileImagePath }'>
										<img class="user" src="/resources/images/users.png" alt="user" />
									</c:if> <c:if test='${not empty usersVO.user_profileImagePath }'>
										<img class="user" src="${usersVO.user_profileImagePath }"
											alt="user" />
									</c:if><span>&nbsp;&nbsp;&nbsp;${usersVO.name }&nbsp;님 </span>
								</a>
								<div class="dropdown-content" style="right: 0;">
									<div class="my_cur" style="text-align: center;">
										<h6 style="margin-top: 20px;" class="bold">예약내역</h6>
										<hr>
										<h6>
											좌석<b style="color: red;"><c:if
													test='${not empty seatcnt }'>&nbsp;${seatcnt }</c:if></b>
										</h6>
										<c:choose>
											<c:when test='${not empty seat }'>
												<c:forEach var="seat" items="${seat }">
													<h6>${seat.br_name }&nbsp;${seat.sct_name }&nbsp;${seat.s_col }
													</h6>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<h6>예약된 좌석 없음</h6>
											</c:otherwise>
										</c:choose>
										<hr>
										<h6>
											사물함<b style="color: red;"><c:if
													test='${not empty cabinetcnt }'>&nbsp;${cabinetcnt}</c:if></b>
										</h6>
										<c:choose>
											<c:when test='${not empty cabinet }'>
												<c:forEach var="cabinet" items="${cabinet }">
													<h6>${cabinet.br_name }&nbsp;${cabinet.cb_number }</h6>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<h6>예약된 사물함 없음</h6>
											</c:otherwise>
										</c:choose>
										<hr>
									</div>
									<a href="/TMS/my" style="text-align: center;">마이페이지</a><a
										href="/TMS/logout" style="text-align: center;">로그아웃</a>
								</div>
							</div>
							<div class="btn-group">
								<div class="" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" style="padding-bottom: 4px;">
									<div id="almDivHide"
										style="display: inline-block; border-radius: 5px; font-size: 0.8em; color: white; text-align: center;"
										class="pointer">
										<div id="almSpan"
											style="padding-right: 5px; padding-top: 1px;"></div>
									</div>
								</div>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="my_cur"
										style="text-align: center; width: 200px; padding-left: 15px; padding-right: 15px;">
										<h6 style="margin-top: 10px;" class="bold">
											<b>읽지 않은 쪽지</b>
										</h6>
										<hr>
										<h6>
											쪽지<b style="color: red;" id="almNum"></b>
										</h6>
										<div style="display: inline-block; text-align: center;"
											id="msgDiv"></div>
										<hr>
									</div>
								</div>
							</div>
						</c:if></li>
				</ul>
			</div>

		</div>
	</nav>
	<script>
		$(function() {
			newMsgAlarm();
		});
		function newMsgAlarm() {
			$
					.ajax({
						url : '/newRecvMsg',
						type : 'post',
						data : {
							'id' : '${usersVO.id}'
						},
						dataType : 'json',
						success : function(result) {
							console.log("result: " + result.length);
							var almNum = result.length
							var sendId = "";
							var title = "";
							$("#almNum").html("&nbsp;" + almNum);
							$("#almDivHide").css("background-color", "none");
							if (almNum != 0) {
								$("#almSpan").html("&nbsp;" + almNum);
								$("#almDivHide").css("background-color",
										"#E566FF");
							}
							var html = "";
							$
									.each(
											result,
											function(index, value) {
												sendId = value.send_id;
												if (index == 3) {
													html += "<span style='cursor: pointer; display: inline-block; float: right; font-size: 0.68em; color: black;' onclick='goMypage()'>더보기...</span>";
												} else if (index < 3) {
													html += "<h6 onclick='msgDetail("
															+ value.rm_idx
															+ ")' style='cursor: pointer;'>'<span class='sendId'>"
															+ sendId
															+ "</span>'&nbsp;님께서 보낸 쪽지가 있습니다.</h6>";
												}
											});
							$("#msgDiv").html(html);

							setTimeout(newMsgAlarm, 5000);
						},
						error : function(error) {

						}
					})
		}

		function msgDetail(rm_idx) {
			window.open("/TMS/recvMsg?rm_idx=" + rm_idx, "받은 쪽지",
					"width=500, height=500");
		}
		function goMypage() {
			location.href = "/TMS/my";
		}
	</script>