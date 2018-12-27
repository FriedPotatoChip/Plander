<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main 화면</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
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
<style>
/* body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
} */
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
</style>
</head>
<!-- <body>
	<div class="page-content home-1 active"
		style="height: -webkit-fill-available;">
		<div class="content">
			<h1>거북이의 기적에 오신걸 환영합니다~!!!</h1>
			<h2>
				스터디 모집 <br> & <br> 룸 예약을 도와드립니다.
			</h2>
			<div class="button">
				<a href="#"> 
					<span class="text1">Login</span>
				</a> 
				<a href="#"> 
					<span class="text2">Learn More</span>
				</a>
			</div>
		</div>
	</div>

</body> -->
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><img
			src="/resources/images/logo.png" width="150px" height="50px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">운영안내</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">예약하기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">모집하기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">세부공간보기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">찾아오시는길</a></li>
				<li class="nav-item"><a class="nav-link" href="#">모집게시판</a></li>
			</ul>
		</div>
	</nav>

	<!--- Image Slider -->
	<div id="slides" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#slides" data-slide-to="0" class="active"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/images/main2.jpg">
				<div class="carousel-caption">
					<h1>거북이의 기적에 오신걸 환영합니다~!!!</h1>
					<h3>
						스터디 모집 <br> & <br> 룸 예약을 도와드립니다.
					</h3>
					<button type="button" class="btn btn-outline-light btn-lg">Login</button>
					<button type="button" class="btn-primary btn-lg">Learn
						More</button>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/images/main2.jpg">
				<div class="carousel-caption">
					<h1>거북이의 기적에 오신걸 환영합니다~!!!</h1>
					<h3>
						스터디 모집 <br> & <br> 룸 예약을 도와드립니다.
					</h3>
					<button type="button" class="btn btn-outline-light btn-lg">Login</button>
					<button type="button" class="btn-primary btn-lg">Learn
						More</button>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/images/main2.jpg">
				<div class="carousel-caption">
					<h1>거북이의 기적에 오신걸 환영합니다~!!!</h1>
					<br>
					<h3>
						스터디 모집 <br> & <br> 룸 예약을 도와드립니다.
					</h3>
					<br>
					<button type="button" class="btn btn-outline-light btn-lg">L
						O G I N</button>
					<button type="button" class="btn-primary btn-lg">회 원 가 입</button>
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
				<a href="#"><button type="button"
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
					서울 서대문구 명물길 21, <br>
					<strong>지번</strong> 창천동 41-12 3층
				</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<img src="/resources/images/TMS1.jpg" alt="" width="100px"
					height="auto">
				<h3>지점 B</h3>
				<p>Built with the latest version of Bootstrap, Bootstrap</p>
			</div>
			<div class="col-sm-12 col-md-4">
				<img src="/resources/images/TMS1.jpg" alt="" width="100px"
					height="auto">
				<h3>지점 C</h3>
				<p>Built with the latest version of CSS, CSS3</p>
			</div>
		</div>
		<hr class="my-4">
	</div>

	<!--- Two Column Section -->
	<div class="container-fluid padding">
		<div class="row padding">
			<div class="col-lg-6">
				<h2>If you build it...</h2>
				<p>The colums will automatically stack on top of each other when
					the screen is less than 576px wide.</p>
				<p>Resize the browser window to see the effect. Responsive web
					design has become more important as the amount of mobile traffic
					now accounts for more than half of total internet traffic.</p>
				<p>It can also display the web page differently depending on the
					screen size or viewing device.</p>
				<br> <a href="#" class="btn btn-primary">Learn More</a>
			</div>
			<div class="col-lg-6">
				<img src="img/desk.png" class="img-fluid">
			</div>
		</div>
	</div>

	<hr class="my-4">
	<!--- Fixed background -->
	<figure>
	<div class="fixed-wrap">
		<div id="fixed"></div>
	</div>
	</figure>

	<!--- Emoji Section -->
	<button class="fun" data-toggle="collapse" data-target="#emoji">click
		for fun</button>
	<div id="emoji" class="collapse">
		<div class="container-fluid padding">
			<div class="row text-center">
				<div class="col-sm-6 col-md-3">
					<img class="gif" src="img/gif/panda.gif">
				</div>
				<div class="col-sm-6 col-md-3">
					<img class="gif" src="img/gif/poo.gif">
				</div>
				<div class="col-sm-6 col-md-3">
					<img class="gif" src="img/gif/unicorn.gif">
				</div>
				<div class="col-sm-6 col-md-3">
					<img class="gif" src="img/gif/chicken.gif">
				</div>
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
				<iframe width="90%" height="300px"
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
				<img src="img/w3newbie.png">
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
</body>
</html>