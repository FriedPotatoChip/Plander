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

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">

<!-- 버튼 아이콘 링크 -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/receipt.css">
<!-- ======================================================================================== -->
<style>
.container-table100 {
  width: 100%;
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  padding: 33px 30px;
}
#cntPerpage {
	float: right;
}

#pagingList {
	list-style: none;
	float: right;
	position: relative;
	left: -45%;
}

#pagingList li {
	float: left;
}

a {
	text-decoration: none;
}

h3 {
	margin-top: 2rem;
	text-align: center;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 10px;
	margin: 5px 0 0 5px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}
.active-cyan-2 input[type=text]:focus:not([readonly]) {
	border-bottom:1px solid #4dd0e1;
	box-shadow: 0 1px 0 0 #4dd0e1;
}
.wrap-table100 {
  width: 90%;
  margin:auto;
}
table {
  border-spacing: 1;
  border-collapse: collapse;
  border-radius:0px;
  background: white;
  overflow: hidden;
  width: 100%;
  margin: 0 auto;
  position: relative;
}
table thead tr {
  height: 50px;
  background: #a61e4d;
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/admin">Admin page</a>


		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/">logout</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
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

						<li class="nav-item"><a class="nav-link active"
							href="/admin/Receipt"> <span data-feather="file"></span>
								Receipt
						</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/Message"> <span data-feather="file"></span>
								Message
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h3 class="h3">결제내역 </h3>
			<div class="container" style="text-align : center;">
				<div class="row">
					<div class="col"
						style="width: 100px; height: 100px; margin:auto; padding-top:1rem;">
						<span style="font-size:1rem;">
							<img src="/resources/images/receipt.png" alt="" width="70px" height="auto"><br><b> 총 결제 내역 : ${count }건</b>
						</span>
					</div>
					<div class="col"
						style="width: 100px; height: 100px; margin:auto; padding-top:1rem;">
						<span style="font-size:1rem;">
							<img src="/resources/images/won.png" alt="" width="70px" height="auto"><br><b> 총 수입 : ${sum }원 </b>
						</span>
					</div>
				</div>
			</div>
			<hr>
			<div class="limiter">
				<div class="container-table10">
					<div class="wrap-table100">
						<div class="table100">

							<!-- 검색창 -->
							<div style="width: 60%; margin: 0 auto; float: left;">
								<form action="/admin/ListSearch"
									class="form-inline my-2 my-lg-0">
									<select class="custom-select my-1 mr-sm-2" name="target">
										<option value="id">ID</option>
										<option value="p_idx">결제번호</option>
										<option value="payment">결제수단</option>
									</select> <input class="form-control mr-sm-2" type="search"
										name="keyword" aria-label="Search" placeholder="search...">
									<button class="btn btn-outline-success my-2 my-sm-0"
										id="submit" type="submit">검색</button>
									<input type="hidden" name="cntPerPage"
										value="${page.cntPerPage }">
								</form>
							</div>

							<!-- 본문시작  -->
							<table>
								<thead>
									<tr class="table100-head">
										<th class="column1">결제번호</th>
										<th class="column2">아이디</th>
										<th class="column3">내역</th>
										<th class="column4">거래일시</th>
										<th class="column5">가격</th>
										<th class="column6">결제수단</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="rl" items="${receipt }">
										<tr>
											<td class="column1">${rl.p_idx }</td>
											<td class="column2">${rl.id }</td>
											<td class="column3">지점 ${rl.br_idx }, 좌석 : ${rl.s_col }</td>
											<td class="column4">${rl.bk_regdate }</td>
											<td class="column5">${rl.price }원</td>
											<td class="column6">${rl.payment }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 본문 끝 -->

							<!-- 페이징 시작 -->
							<div id="paging" aria-label="Page navigation example">
								<ul id="pagingList" class="pagination">
									<c:choose>
										<c:when test="${page.chkStartPage }">
											<li class="page-item"><a class="page-link"
												href="/admin/Receipt?nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													<span class="sr-only">Previous</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="/admin/Receipt?nowPage=1&cntPerPage=${page.cntPerPage}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													<span class="sr-only">Previous</span>
											</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="p" begin="${page.startPage }"
										end="${page.endPage }">
										<c:if test="${p == page.nowPage }">
											<li class="page-item"><a class="now marginLi page-link"
												href="/admin/Receipt?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
											</li class="page-item">
										</c:if>
										<c:if test="${p != page.nowPage }">
											<li class="page-item"><a class="marginLi page-link"
												href="/admin/Receipt?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
											</li class="page-item">
										</c:if>

									</c:forEach>

									<c:choose>
										<c:when test="${page.chkEndPage }">
											<li class="page-item"><a class="page-link"
												href="/admin/Receipt?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													<span class="sr-only">Next</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="/admin/Receipt?nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													<span class="sr-only">Next</span>
											</a></li>
										</c:otherwise>

									</c:choose>
								</ul>
							</div>
							<!-- 페이징 끝 -->
						</div>
					</div>
				</div>
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

	<script src="/resources/js/choices.js"></script>
	<script>
		const choices = new Choices('[data-trigger]', {
			searchEnabled : false,
			itemSelectText : '',
		});
	</script>

</body>

</html>