<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="/commons/head.jsp" /> --%>

<title>Main 화면</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link href="/resources/css/main.css" rel="stylesheet">
<!-- 나눔스퀘어  -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
}

.page-content {
	overflow-y: hidden;
	width: 100%;
	display: table;
}

.home-1 {
	overflow: hidden;
	text-align: center;
	position: absolute;
	background: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)),
		url(../resources/images/main2.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.page-content.active {
	filter: grayscale(0%);
	transition: all 1s ease;
}

.page-content>.content {
	display: table-cell;
	vertical-align: middle;
}

.home-1.content {
	position: relative;
}

.page-content h1 {
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	color: #fff;
	position: relative;
	z-index: 3;
}

.page-content h2 {
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	color: #fff;
}

.text1 {
	width: 7rem;
	display: inline-block;
	border: 3px solid #e8590c;
	border-radius: 10px;
	padding: 20px 35px;
	margin-right: 20px;
	font-weight: bold;
}

.text2 {
	width: 7rem;
	display: inline-block;
	border: 3px solid #e03131;
	border-radius: 10px;
	padding: 20px 35px;
	margin-right: 20px;
	font-weight: bold;
}

.button {
	margin-bottom: 50px;
}

.home-1 a {
	color: #fff;
}

.text1:hover {
	background-color: #e8590c;
	color: white;
}

.text2:hover {
	background-color: #e03131;
	color: white;
}

.p {
	font-size: 90%;
}

#map {
	height: 400px;
	width: 90%;
	margin: auto;
}
/* The location pointed to by the popup tip. */
.popup-tip-anchor {
	height: 0;
	position: absolute;
	/* The max width of the info window. */
	width: 200px;
}
/* The bubble is anchored above the tip. */
.popup-bubble-anchor {
	position: absolute;
	width: 100%;
	bottom: /* TIP_HEIGHT= */ 8px;
	left: 0;
}
/* Draw the tip. */
.popup-bubble-anchor::after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	/* Center the tip horizontally. */
	transform: translate(-50%, 0);
	/* The tip is a https://css-tricks.com/snippets/css/css-triangle/ */
	width: 0;
	height: 0;
	/* The tip is 8px high, and 12px wide. */
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
	border-top: /* TIP_HEIGHT= */ 8px solid white;
}
/* The popup bubble itself. */
.popup-bubble-content {
	position: absolute;
	top: 0;
	left: 0;
	transform: translate(-50%, 0);
	/* Style the info window. */
	background-color: white;
	padding: 5px;
	border-radius: 5px;
	font-family: sans-serif;
	overflow-y: auto;
	max-height: 60px;
	box-shadow: 0px 2px 10px 1px rgba(0, 0, 0, 0.5);
}
.popup-bubble-content1 {
	position: absolute;
	top: 0;
	left: 0;
	transform: translate(-50%, -100%;);
	/* Style the info window. */
	background-color: white;
	padding: 5px;
	border-radius: 5px;
	font-family: sans-serif;
	overflow-y: auto;
	max-height: 60px;
	box-shadow: 0px 2px 10px 1px rgba(0, 0, 0, 0.5);
}
.popup-bubble-content2 {
	position: absolute;
	top: 0;
	left: 0;
	transform: translate(-50%, 50%);
	/* Style the info window. */
	background-color: white;
	padding: 5px;
	border-radius: 5px;
	font-family: sans-serif;
	overflow-y: auto;
	max-height: 60px;
	box-shadow: 0px 2px 10px 1px rgba(0, 0, 0, 0.5);
}
</style>

</head>

<body>
	<!-- 헤더 -->
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
	<!-- 헤더 끝 -->

	<!--- Image Slider -->
	<div id="slides" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#slides" data-slide-to="0" class="active"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/images/main2.jpg">
				<div class="carousel-caption">
					<h1>거북이의 기적에 오신걸 환영합니다.</h1>
					<h3>룸 예약 & 스터디 모집을 도와드립니다.</h3>
				</div>
			</div>
		</div>
	</div>

	<!--- Jumbotron -->
	<div class="container-fluid">
		<div class="row jumbotron">
			<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-10">
				<p class="lead m-2" style="text-align: center;">같이 공부할 사람들을
					모집하거나 참여하고 싶으시간요? 그럼 여기로 들어오세요~!!</p>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-2">
				<a href="/TMS/recruit"><button type="button"
						class="btn btn-outline-secondary btn-lg">모집게시판</button></a>
			</div>
		</div>
	</div>

	<!--- Welcome Section -->
	<div class="container-fluid padding">
		<div class="row welcome text-center">
			<div class="col-12">
				<h1 class="display-4">지점소개</h1>
			</div>
			<hr>
			<div class="col-12">
				<p class="lead">어떻게 맨날 쓸모있는 일만 하고 사나요? &nbsp;&nbsp;&nbsp; "느려도
					괜찮아"</p>
			</div>
		</div>
	</div>
	<!--- Three Column Section -->
	<div class="container-fluid padding">
		<div class="row text-center padding">
			<div class="col-xs-12 col-sm-6 col-md-4">
				<img src="/resources/images/TMS1.jpg" alt="" width="100px"
					height="auto">
				<h3>지점 A</h3>
				<p>
					서울 서대문구 명물길 21, <br> <strong>지번</strong> 창천동 41-12 3층
				</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<img src="/resources/images/TMS1.jpg" alt="" width="100px"
					height="auto">
				<h3>지점 B</h3>
				<p>
					서울 서대문구 연세로5나길 8, <br> <strong>지번</strong> 서울 서대문구 창천동 57-23
				</p>
			</div>
			<div class="col-sm-12 col-md-4">
				<img src="/resources/images/TMS1.jpg" alt="" width="100px"
					height="auto">
				<h3>지점 C</h3>
				<p>
					서울 서대문구 연세로5나길 14 지하 1층, <br> <strong>지번</strong> 서울 서대문구 창천동
					62-59 지하 1층
				</p>
			</div>
		</div>
		<hr class="my-4">
	</div>


	<!--- Emoji Section -->
	<button class="fun" data-toggle="collapse" data-target="#emoji">본인의
		집에서 스터디룸까지 오는 방법은?</button>
	<div id="emoji" class="collapse">
		<div class="container-fluid padding">
			<div class="row text-center">
				<div class="col-sm-6 col-md-4">
					<img src="/resources/css/p1.png" alt="" width="60%" height="auto">
				</div>
				<div class="col-sm-6 col-md-4">
					<img src="/resources/css/p2.png" alt="" width="60%" height="auto">
				</div>
				<div class="col-sm-6 col-md-4">
					<img src="/resources/css/p3.png" alt="" width="60%" height="auto">
				</div>
					<div id="map"></div>
					<div id="content">신촌점</div>
					<div id="content1">강남점</div>
					<div id="content2">종로점</div>
			</div>
		</div>
	</div>

	<!--- Meet the team -->
	<div class="container-fluid padding">
		<div class="row welcome text-center">
			<div class="col-12">
				<h1 class="dispaly-4">모집 글 보기</h1>
			</div>
			<hr>
		</div>
	</div>

	<!--- Cards -->
	<div class="container-fluid padding">
		<div class="row padding">
			<div class="col-md-4">
				<div class="card" style="width: 480px; height: 500px;">
					<img class="card-img-top" src="/resources/images/recruit1.jpg">
					<div class="card-body">
						<h4 class="card-title">bitcamp</h4>
						<p class="card-text">스프링 스터디 모집합니다.</p>
						<a href="#" class="btn btn-outline-secondary">보러가기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 480px; height: 500px;">
					<img class="card-img-top" src="/resources/images/sr1.jpg">
					<div class="card-body">
						<h4 class="card-title">test</h4>
						<p class="card-text">매주 일요일 오전 11시부터 저녁 7시까지 열코딩하기</p>
						<a href="#" class="btn btn-outline-secondary">보러가기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 480px; height: 500px;">
					<img class="card-img-top" src="/resources/images/recruit3.jpg">
					<div class="card-body">
						<h4 class="card-title">Phil Ho</h4>
						<p class="card-text">Phil is a developer wuth over 5 years old
							web development experience.</p>
						<a href="#" class="btn btn-outline-secondary">See Profile</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--- Two Column Section -->
	<div class="container-fluid padding">
		<div class="row padding">
			<div class="col-lg-6">
				<h2>집, 학원, 도서관, 카페가 아닌 스터디 전용 공간_TMS</h2>
				<p class="p">- &nbsp;TMS는 공부하기 좋은 곳을 찾는 사람이라면 누구든지 이용할 수 있는 24시간
					프리미엄 회원제 스터디카페입니다.</p>
				<p class="p">- &nbsp;전문가의 손길을 거친 인테리어와 조용하지만 답답하지 않은 분위기는 공부하기에
					더할 나위 없는 환경을 제공합니다.</p>
				<p class="p">- &nbsp;커피나 차를 마시는 카페가 아닌 공부를 하는 공간에 아메리카노와 차가 더해진
					공간입니다. 일반 스터디 카페에서 공부를 하게 되면 커피나 음료를 시켜야 그 공간을 이용할 수 있지만 TMS는 공부가
					메인인 공간입니다.</p>
				<br>
			</div>
			<div class="col-lg-6">
				<iframe width="90%" height="400px" style="margin: auto;"
					src="https://www.youtube.com/embed/egcd1psh81c" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
		</div>
		<hr class="my-4">
	</div>

	<!--- Connect -->
	<div class="container-fluid padding">
		<div class=" row text-center padding">
			<div class="col-12">
				<h2>Connect</h2>
			</div>
			<div class="col-12 social padding">
				<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-google-plus-g"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a> <a href="#"><i
					class="fab fa-youtube"></i></a>
			</div>
		</div>
	</div>

	<!--- Footer -->
	<footer>
		<div class="container-fluid padding">
			<div class="row text-center">
				<div class="col-md-4">
					<img src="/resources/images/logo.png"
						style="width: 190px; height: auto; vertical-align: middle;">
					<hr class="light">
					<p>555=555=5555</p>
					<p>email@yemail.com</p>
					<p>100 Street Name</p>
					<p>City, State, 00000</p>
				</div>
				<div class="col-md-4">
					<hr class="light">
					<h5>Our Hours</h5>
					<hr class="light">
					<p>Monday: 9am - 5</p>
					<p>Saturday: 10am - 4px</p>
					<p>Sunday: closed</p>
				</div>
				<div class="col-md-4">
					<hr class="light">
					<h5>Service Area</h5>
					<hr class="light">
					<p>City, State, 00000</p>
					<p>City, State, 00000</p>
					<p>City, State, 00000</p>
					<p>City, State, 00000</p>
					<p>City, State, 00000</p>
				</div>
				<div class="col-12">
					<hr class="light-100">
					<h5>&copy; w3newbie.com</h5>
				</div>
			</div>
		</div>
	</footer>
	<script>
		/* function initialize() {

			var LatLng = new google.maps.LatLng(37.5582, 126.9376);
			
			var mapProp = {

				center : LatLng, // 위치

				zoom : 17, // 어느정도까지 세세하게 볼 것인지.

				mapTypeControl : false,

				mapTypeId : google.maps.MapTypeId.ROADMAP

			};

			var map = new google.maps.Map(document.getElementById("map"),
					mapProp); */

		/* new AutocompleteDirectionsHandler(map); */

		/* var contentString = '<h5>TMS 스터디룸</h5><br><p>공부하러오세요~</p>';

		var infowindow = new google.maps.InfoWindow({
			content : contentString
		});

		var myIcon = new google.maps.MarkerImage(
				"/resources/images/student.png", null, null, null,
				new google.maps.Size(40, 40));

		var marker = new google.maps.Marker({

			position : LatLng,

			map : map,

			icon : myIcon,

			draggable : true,
			animation : google.maps.Animation.DROP

		});

		marker.addListener('click', function() {
			infowindow.open(map, marker);
		});

		} */
		var popup, Popup;
		function initMap() {
			definePopupClass();
			
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 12,
				center : {
					lat : 37.55,
					lng : 126.95
				}
			});
			 popup = new Popup(
				      new google.maps.LatLng(37.5582, 126.9376),
				      document.getElementById('content'));
			popup.setMap(map);
			 popup = new Popup(
				      new google.maps.LatLng(37.499591, 127.029247),
				      document.getElementById('content1'));
			popup.setMap(map);
			 
			 popup = new Popup(
				      new google.maps.LatLng(37.570851, 126.985228),
				      document.getElementById('content2'));
			popup.setMap(map);
			setMarkers(map);
		}

		var beaches = [ [ '지점 A', 37.5582, 126.9376 ],
				[ '지점 B', 37.499591, 127.029247 ],
				[ '지점 C', 37.570851, 126.985228 ] ];

		function setMarkers(map) {

			var myIcon = new google.maps.MarkerImage(
					"/resources/images/student.png", null, null, null,
					new google.maps.Size(40, 40));

			for (var i = 0; i < beaches.length; i++) {
				var beach = beaches[i];
				var marker = new google.maps.Marker({
					position : {
						lat : beach[1],
						lng : beach[2]
					},
					map : map,
					icon : myIcon,
					title : beach[0],
				});
			}
		}

		/** Defines the Popup class. */
		function definePopupClass() {
			/**
			 * A customized popup on the map.
			 * @param {!google.maps.LatLng} position
			 * @param {!Element} content
			 * @constructor
			 * @extends {google.maps.OverlayView}
			 */
			Popup = function(position, content) {
				this.position = position;

				content.classList.add('popup-bubble-content');

				var pixelOffset = document.createElement('div');
				pixelOffset.classList.add('popup-bubble-anchor');
				pixelOffset.appendChild(content);

				this.anchor = document.createElement('div');
				this.anchor.classList.add('popup-tip-anchor');
				this.anchor.appendChild(pixelOffset);

				// Optionally stop clicks, etc., from bubbling up to the map.
				this.stopEventPropagation();
			};
			// NOTE: google.maps.OverlayView is only defined once the Maps API has
			// loaded. That is why Popup is defined inside initMap().
			Popup.prototype = Object.create(google.maps.OverlayView.prototype);

			/** Called when the popup is added to the map. */
			Popup.prototype.onAdd = function() {
				this.getPanes().floatPane.appendChild(this.anchor);
			};

			/** Called when the popup is removed from the map. */
			Popup.prototype.onRemove = function() {
				if (this.anchor.parentElement) {
					this.anchor.parentElement.removeChild(this.anchor);
				}
			};

			/** Called when the popup needs to draw itself. */
			Popup.prototype.draw = function() {
				var divPosition = this.getProjection().fromLatLngToDivPixel(
						this.position);
				// Hide the popup when it is far out of view.
				var display = Math.abs(divPosition.x) < 4000
						&& Math.abs(divPosition.y) < 4000 ? 'block' : 'none';

				if (display === 'block') {
					this.anchor.style.left = divPosition.x + 'px';
					this.anchor.style.top = divPosition.y + 'px';
				}
				if (this.anchor.style.display !== display) {
					this.anchor.style.display = display;
				}
			};

			/** Stops clicks/drags from bubbling up to the map. */
			Popup.prototype.stopEventPropagation = function() {
				var anchor = this.anchor;
				anchor.style.cursor = 'auto';

				[ 'click', 'dblclick', 'contextmenu', 'wheel', 'mousedown',
						'touchstart', 'pointerdown' ].forEach(function(event) {
					anchor.addEventListener(event, function(e) {
						e.stopPropagation();
					});
				});
			};
		}
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6yCulCcEhKXGw1lWxeRZ8_qyDmiB5Ttk&libraries=places&callback=initMap"
		async defer></script>
</body>
</html>