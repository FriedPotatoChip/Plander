<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="icon" type="image/png" href="/resources/images/favicon-16x16.png" sizes="16x16" />
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">
<!-- ======================================================================================== -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style>


.container {
	max-width: 1500px;
}

.normal {
	font-weight: 400
}

.bold {
	font-weight: 700
}

.bolder {
	font-weight: 800
}

.light {
	font-weight: 300
}

.box {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.box .item {
	display: inline-table;
	width: 10%;
	height: 100px;
	margin: 0.5rem;
	padding: 0;
	background-color: #f8f9fa;
}

.box .itembg {
	display: inline-table;
	width: 10%;
	height: 100px;
	margin: 0.5rem;
	padding: 0;
	background-color: #d0bfff;
}

h3 {
	margin-top: 2rem;
	text-align: center;
}

.right {
	float: right;
}

.cabinet_situation {
	text-align: center;
	font-size: 150%;
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

.wrap {
	width: 100%;
	margin: 0 auto;
	position: relative;
}

.clear {
	clear: both
}

.centered {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

.myBook_nav {
	float: right;
	position: relative;
	left: -45%;
	position: relative;
}
/* 클릭시 레이어 */
.idDiv {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 150px;
	height: 90px;
	padding: 20px 10px 0 10px;
	font-size: 17px;
}
.popupLayer	a { 
	text-decoration: none; 
	font-weight: 700;
	font-size: 16px;
	color: #666;
}
.popupLayer div {
	position: absolute;
	top: 0px;
	right: 5px;
	font-size: 17px;
}
</style>
</head>

<body>

	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/admin">Admin page</a>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link"
				href="/logout">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link" href="/admin">
								<span data-feather="users"></span> Customers <span
								class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Cabinet"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Chart"> <span data-feather="home"></span>
								Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Seats"> <span data-feather="bar-chart-2"></span>
								Seats
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Receipt"> <span data-feather="file"></span>
								Receipt
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="/admin/Message"> <span data-feather="file"></span>
								Message
						</a></li>
					</ul>
				</div>
			</nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h4 class="text-center mt-5" style="color: #475C7A;">쪽지함</h4>
			<div style="width: 80%; margin: 0 auto; text-align: center;">
				<h4 class="d-inline">
					<a href="javascript:click()"
						onclick="fetch_book('/admin/recvMsg?nowPage=1')">받은쪽지</a>
				</h4>
				&nbsp;|&nbsp;
				<h4 class="d-inline">
					<a href="javascript:click()"
						onclick="fetch_book('/admin/sendMsg?nowPage=1')">보낸쪽지</a>
				</h4>
			</div>
			<div class="myBook_nav" style="margin-top: 30px;">
				<table id="myBook" class="table centered" style="width: 800px;"></table>
			</div>
			</main>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>

	<script>
		$(function() {
			$('.idDiv').on("click", function() {
				console.log("asdfas");
			})
		})
	</script>

	<script>
		// 클릭 시 스크롤이 자동으로 위로 올라가는 현상
		function click() {
			return;
		}

		//내용 출력(fetch api)
		function fetch_book(name) {
			fetch(name).then(function(response) {
				response.text().then(function(text) {
					document.querySelector('#myBook').innerHTML = text;
				});
			});
		}

		function msgDel(rm_idx, nowPage) {
			$.ajax({
				url : '/msgDel',
				type : 'post',
				data : {
					'rm_idx' : rm_idx
				},
				dataType : 'text',
				success : function(result) {
					if (result == 'success') {
						alert("쪽지를 삭제했습니다.");
					} else {
						alert("쪽지 삭제에 실패했습니다.\n관리자에게 문의하세요");
					}
				},
				error : function(error) {
					alert("쪽지 삭제에 실패했습니다.\n관리자에게 문의하세요");
				}
			})

			fetch_book('/admin/recvMsg?nowPage=' + nowPage);
		}
	</script>
	<script>
		function closeLayer(obj) {
			$(".popupLayer").hide();
		}
		function showBox(e, tag) {
			console.log("idDiv 클릭됨");
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			window.divLeft = event.clientX
					+ 10
					+ (document.documentElement.scrollLeft ? document.documentElement.scrollLeft
							: document.body.scrollLeft);
			window.divTop = event.clientY
					+ 5
					+ (document.documentElement.scrollTop ? document.documentElement.scrollTop
							: document.body.scrollTop);
			console.log("X: " + e.clientX);
			console.log("Y: " + e.clientY);

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if (divLeft + oWidth > sWidth)
				divLeft -= oWidth;
			if (divTop + oHeight > sHeight)
				divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if (divLeft < 0)
				divLeft = 0;
			if (divTop < 0)
				divTop = 0;

			$('.popupLayer').css({
				"top" : divTop,
				"left" : divLeft,
				"position" : "absolute"
			}).show();
			console.log(this);
			var userId = $(tag).attr("userId");
			console.log($(tag).attr("userId"));
			$("#sendMsg").click(
					function() {
						$(".popupLayer").hide();
						if ('${usersVO.id}' == '') {
							alert("로그인 후 이용 가능합니다.");
							return false;
						}
						window.open("/sendMsg?recv_id=" + userId, "쪽지 보내기",
								"width=500, height=600");
					});
			$("#userProfile").click(
					function() {
						$(".popupLayer").hide();
						if ('${usersVO.id}' == '') {
							alert("로그인 후 이용 가능합니다.");
							return false;
						}
						window.open("/profileSummary?id=" + userId,
								"회원 정보", "width=500, height=500");
					});
		}
	</script>
	<div class="popupLayer">
		<div>
			<span style="cursor: pointer; font-size: 0.85em; color: gray;"
				title="닫기" onclick="closeLayer()">X</span>
		</div>
		<a id="sendMsg" href="#"><i class="far fa-envelope"></i>&nbsp;쪽지 보내기</a><br>
		<a id="userProfile" href="#"><i class="fas fa-user"></i>&nbsp;회원 정보 보기</a><br>
	</div>
</body>
</html>