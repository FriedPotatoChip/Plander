<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">
<!-- ======================================================================================== -->
<style>
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Admin page</a>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">

						<li class="nav-item"><a class="nav-link active"
							href="/TMS/admin"> <span data-feather="users"></span>
								Customers <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Cabinet?br_idx=1"> <span data-feather="file"></span>
								Cabinet
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/TMS/admin/Chart"> <span data-feather="home"></span>
								Reservation
						</a></li>

						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="bar-chart-2"></span> Visitors
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h2 class="m-auto">[회원관리]</h2>

			<div class="table-responsive" style="margin-top: 3rem;">
				<input class="form-control w-100 m-1" type="text"
					placeholder="Search" aria-label="Search">
				<table class="table table-striped table-hover"
					style="text-align: center;">
					<thead class="thead-light">
						<tr>
							<th scope="col">U_IDX</th>
							<th scope="col">ID</th>
							<th scope="col">NAME</th>
							<th scope="col">PHONE</th>
							<th scope="col">E-MAIL</th>
							<th scope="col">RANK</th>
							<th scope="col">REGDATE</th>
							<th scope="col">ZIPNO</th>
							<th scope="col">ADDRESS</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${user }">
							<tr>
								<th scope="row">${user.u_idx }</th>
								<td>${user.id }</td>
								<td>${user.name }</td>
								<td>${user.phone }</td>
								<td>${user.email }</td>
								<td>${user.rank }</td>
								<td><fmt:formatDate value="${user.regdate }"
										pattern="yyyy-MM-dd" /></td>

								<td>${user.zipNo }</td>
								<td>${user.roadAddrPart1 }&nbsp;${user.addrDetail }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">
								<ol class="paging">
									<%--[이전으로]에 대한 사용여부 처리 --%>
									<c:choose>
										<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
										<c:when test="${pvo.beginPage == 1 }">
											<li class="disable">이전으로</li>
										</c:when>
										<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
										<c:otherwise>
											<li><a href="/TMS/admin?cPage=${pvo.beginPage - 1 }">이전으로</a>
											</li>
										</c:otherwise>
									</c:choose>

									<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
									<c:forEach var="k" begin="${pvo.beginPage }"
										end="${pvo.endPage }">
										<c:choose>
											<c:when test="${k == pvo.nowPage }">
												<li class="now">${k }</li>
											</c:when>
											<c:otherwise>
												<li><a href="/TMS/admin?cPage=${k }">${k }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<%--[다음으로]에 대한 사용여부 처리 --%>
									<c:choose>
										<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
										<c:when test="${pvo.endPage >= pvo.totalPage }">
											<li class="disable">다음으로</li>
										</c:when>
										<%--사용가능(enable) --%>
										<c:otherwise>
											<li><a href="/TMS/admin?cPage=${pvo.endPage + 1 }">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</ol>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			</main>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>


</body>

</html>