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

a {
	text-decoration: none;
}

#search {
	width: 50%;
}

#select {
	width: 10%;
}

.container-1 {
	width: 300px;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}

.container-1 input#search {
	width: 20rem;
	height: 3rem;
	background: #fff;
	border: 1px solid #e9ecef;
	font-size: 10pt;
	float: left;
	color: #63717f;
	padding-left: 45px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.container-1 input#search::-webkit-input-placeholder {
	color: #65737e;
}

.container-1 input#search:-moz-placeholder { /* Firefox 18- */
	color: #65737e;
}

.container-1 input#search::-moz-placeholder { /* Firefox 19+ */
	color: #65737e;
}

.container-1 input#search:-ms-input-placeholder {
	color: #65737e;
}

.container-1 .icon {
	position: absolute;
	top: 50%;
	margin-left: 17px;
	margin-top: 17px;
	z-index: 1;
	color: #4f5b66;
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
</style>
</head>

<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Admin page</a>


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

						<li class="nav-item"><a class="nav-link" href="/TMS/admin/Seats?sct_idx=1"> <span
								data-feather="bar-chart-2"></span> Seats
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h2 class="m-auto">[회원관리]</h2>

			<div class="table-responsive" style="margin-top: 3rem;">

				<form action="/TMS/admin/searchList">
					<select class="form-control d-inline-flex ml-1" name="target"
						id="select">
						<option value="id">ID</option>
						<option value="name">NAME</option>
					</select>
					<!-- <input class="form-control m-1 d-inline-flex" type="text"
						placeholder="Search" aria-label="Search" id="search" name="keyword">  -->
					<div class="box m-1">
						<div class="container-1">
							<span class="icon"><i class="fa fa-search"></i></span> <input
								type="search" id="search" placeholder="search..." name="keyword">
							<!-- <button class="btn btn-outline-danger">검색</button> -->
						</div>
						<input type="submit" value="검색" id="submit" class="d-inline-block">
						<input type="hidden" name="cntPerPage" value="${page.cntPerPage }">
					</div>
				</form>

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
							<div class="modal fade" id="exampleModal${user.u_idx }" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
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
												onclick="location.href='/TMS/admin/delete?u_idx=${user.u_idx}'">Yes</button>
											<button type="button" class="btn btn-light ml-1"
												onclick="location.href='/TMS/admin'">No</button>
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
						<a class="page-link" href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a>

						<%-- <c:if test="${page.chkStartPage }">
							<li class="page-item"><a
								href="/TMS/admin?nowPage=1&cntPerPage=${page.cntPerPage}"
								class="page-link"><button>&lt;&lt;</button></a></li>
							<li class="page-item"><a
								href="/TMS/admin?nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"
								class="page-link"><button>&lt;</button></a></li>
						</c:if> --%>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li class="page-item"><a class="now marginLi page-link"
									href="/TMS/admin?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
								</li class="page-item">
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li class="page-item"><a class="marginLi page-link"
									href="/TMS/admin?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
								</li class="page-item">
							</c:if>

						</c:forEach>

						<%-- <c:if test="${page.chkEndPage }">
							<li class="page-item"><a
								href="/TMS/admin?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"
								class="page-link"><button>&gt;</button></a></li>
							<li class="page-item"><a
								href="/TMS/admin?nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"
								class="page-link"><button>&gt;&gt;</button></a></li>
						</c:if> --%>

						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
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
	<script>
		function selChange() {
			var cntPerPage = document.getElementById("cntPerPage").value;
			location.href = "/TMS/admin?nowPage=${page.nowPage }&cntPerPage="
					+ cntPerPage;
		}

		/* function userDelete() {
			location.href = "/TMS/admin/delete";
		} */
	</script>


</body>

</html>