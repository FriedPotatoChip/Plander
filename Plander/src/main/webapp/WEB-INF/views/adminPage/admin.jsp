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

<!-- 버튼 아이콘 링크 -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- font -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<!-- ======================================================================================== -->
<style>
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

h3 {
	margin-top: 2rem;
	text-align: center;
}

a {
	text-decoration: none;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.marginLi:hover {
	background-color: black;
	color: white;
}

.table td {
	vertical-align:middle;
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

						<li class="nav-item"><a class="nav-link active"
							href="/admin"> <span data-feather="users"></span>
								Customers <span class="sr-only">(current)</span>
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

						<li class="nav-item"><a class="nav-link"
							href="/admin/Message"> <span data-feather="file"></span>
								Message
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h3>회원관리</h3>
			<hr>

			<div class="table-responsive">

				<div style="width: 60%; margin: 0 auto; float: left;">
					<form action="/admin/searchList"
						class="form-inline my-2 my-lg-0">
						<!-- 검색창 -->
						<select class="custom-select my-1 mr-sm-2" name="target">
							<option value="id">ID</option>
							<option value="name">이름</option>
						</select> <input class="form-control mr-sm-2" type="search" name="keyword"
							aria-label="Search" placeholder="search...">
						<button class="btn btn-outline-success my-2 my-sm-0" id="submit"
							type="submit">검색</button>
						<input type="hidden" name="cntPerPage" value="${page.cntPerPage }">
					</form>
				</div>

				<select id="cntPerPage" onchange="selChange()" class="m-1">
					<option value="5"
						<c:if test="${page.cntPerPage == 5}">selected</c:if>>5</option>
					<option value="10"
						<c:if test="${page.cntPerPage == 10}">selected</c:if>>10</option>
					<option value="15"
						<c:if test="${page.cntPerPage == 15}">selected</c:if>>15</option>
					<option value="20"
						<c:if test="${page.cntPerPage == 20}">selected</c:if>>20</option>
				</select>
				
				<table class="table table-sm table-hover"
					style="text-align: center;">
					<thead class="thead-light" >
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
							<th scope="col">DELETE</th>
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
								<td><button type="button" class="btn btn-outline-danger"
										data-toggle="modal" data-target="#exampleModal${user.u_idx }">삭제</button></td>
							</tr>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal${user.u_idx }"
								tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">회원삭제</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">정말 삭제하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-dark"
												data-dismiss="modal"
												onclick="location.href='/admin/delete?u_idx=${user.u_idx}'">Yes</button>
											<button type="button" class="btn btn-light ml-1"
												onclick="location.href='/admin'">No</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 시작 -->
				<div id="paging" aria-label="Page navigation example">
					<ul id="pagingList" class="pagination">
						<c:choose>
							<c:when test="${page.chkStartPage }">
								<li class="page-item"><a class="page-link"
									href="/admin?nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/admin?nowPage=1&cntPerPage=${page.cntPerPage}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li class="page-item"><a class="now marginLi page-link"
									href="/admin?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
								</li class="page-item">
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li class="page-item"><a class="marginLi page-link"
									href="/admin?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
								</li class="page-item">
							</c:if>

						</c:forEach>

						<c:choose>
							<c:when test="${page.chkEndPage }">
								<li class="page-item"><a class="page-link"
									href="/admin?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/admin?nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</c:otherwise>

						</c:choose>
					</ul>
				</div>
				<!-- 페이징 끝 -->
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

	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min2.js"></script>
	Icons
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>
	<script>
		function selChange() {
			var cntPerPage = document.getElementById("cntPerPage").value;
			location.href = "/admin?nowPage=${page.nowPage }&cntPerPage="
					+ cntPerPage;
		}
	</script>


</body>

</html>