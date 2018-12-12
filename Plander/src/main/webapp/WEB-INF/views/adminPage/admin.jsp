<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />

<style>
#aside>button {
	background-color: #faa2c1;
	border-color: #faa2c1;
}

.content1 {
	width: 95%;
	height: 200%;
	float: left;
	margin-bottom: 20px;
	background-color: #f3d9fa;
}

.content2 {
	width: 95%;
	height: 200%;
	float: left;
	background-color: #f3d9fa;
}
</style>
</head>
<body>

	<!-- header -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">ADMIN</a>
		<div class="ml-auto">
			<div class="btn-group">
				<button type="button" class="btn btn-light dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<img src="/resources/images/bell.png">
				</button>
				<div class="dropdown-menu dropdown-menu-right">
					<ul class="list-group">
						<button class="dropdown-item" type="button" id="messages">
							<img src="/resources/images/message.png">&nbsp;&nbsp;&nbsp;messages
						</button>
						<button class="dropdown-item" type="button" id="reply">
							<img src="/resources/images/reply.png">&nbsp;&nbsp;&nbsp;reply
						</button>
					</ul>
				</div>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-light dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<img src="/resources/images/user.png">
				</button>
				<div class="dropdown-menu dropdown-menu-right">
					<button class="dropdown-item" type="button" id="settings">
						<img src="/resources/images/settings.png">&nbsp;&nbsp;&nbsp;settings
					</button>
					<button class="dropdown-item" type="button" id="logout">
						<img src="/resources/images/logout.png">&nbsp;&nbsp;&nbsp;logout
					</button>
				</div>
			</div>
		</div>
	</nav>

	<!-- aside -->
	<div class="row mt-2">
		<div class="col-2" id="aside">
			<button type="button" class="btn btn-primary btn-lg btn-block" id="dashboard" onclick="location.href='dashboard.jsp'">dashboard</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" id="users" onclick="location.href='user.jsp'">user</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" id="boards" onclick="location.href='board.jsp'">board</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" id="chart" onclick="location.href='chart.jsp'">chart</button>
		</div>
		<div class="col-10">
			<section class="content1">1</section>

			<section class="content2">2</section>
		</div>

		<jsp:include page="/commons/endBody.jsp" />