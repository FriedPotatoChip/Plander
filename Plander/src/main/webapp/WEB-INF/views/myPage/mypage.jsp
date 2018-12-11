<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/commons/head.jsp" />
<style>
#update_btn {
	float: right;
}

.pagination {
	width: 25%;
	margin: 0 auto;
}
</style>
<script>
	function fn_paging(curPage) {
		location.href = "/Plander/mypage?curPage=" + curPage
				+ "&u_idx=${user.u_idx}";
	}
</script>
</head>
<body>

	<div class="container">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<img height="100" width="100" alt="힘이없을때는 경수를 보자"
					src="/resources/images/do.png"> <b>${user.name }</b>
				<button type="button" class="btn btn-info" id="update_btn"
					onclick="location.href='mypage/updatePage'">회원정보수정</button>
				<h1 class="display-4 text-center">마이페이지</h1>
				<p class="lead text-center">This is a modified jumbotron that
					occupies the entire horizontal space of its parent.</p>
			</div>
		</div>

		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab"
					data-toggle="tab" href="#nav-home" role="tab"
					aria-controls="nav-home" aria-selected="true">내플래너</a> <a
					class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
					href="#nav-profile" role="tab" aria-controls="nav-profile"
					aria-selected="false">북마크</a> <a class="nav-item nav-link"
					id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
					role="tab" aria-controls="nav-contact" aria-selected="false">댓글</a>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">p_idx</th>
							<th scope="col">p_title</th>
							<th scope="col">p_start_date</th>
							<th scope="col">p_end_date</th>
							<th scope="col">regdate</th>
							<th scope="col">u_idx</th>
							<th scope="col">ct_idx</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="planner" items="${plannerList }">
							<tr>
								<td>${planner.p_idx }</td>
								<td><a
									href="/Plander/mypage/plannerOne?p_idx=${planner.p_idx }">${planner.p_title }</a></td>
								<td>${planner.p_start_date }</td>
								<td>${planner.p_end_date }</td>
								<td>${planner.regdate }</td>
								<td>${planner.u_idx }</td>
								<td>${planner.ct_idx }</td>

							</tr>
						</c:forEach>
					</tbody>

				</table>

				<!-- pagination  -->
				<nav aria-label="Page navigation example" class="pagination">
					<ul class="pagination">
						<c:if test="${pagination.curRange ne 1 }">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_paging(1)">처음</a></li>
						</c:if>
						<c:if test="${pagination.curPage ne 1}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_paging('${pagination.prevPage }')">이전</a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${pagination.startPage }"
							end="${pagination.endPage }">
							<c:choose>
								<c:when test="${pageNum eq  pagination.curPage}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_paging('${pagination.nextPage }')">다음</a></li>
						</c:if>
						<c:if
							test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_paging('${pagination.pageCnt }')">끝</a></li>
						</c:if>
					</ul>
				</nav>

				<div>총 게시글 수 : ${pagination.listCnt } / 총 페이지 수 :
					${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 :
					${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }</div>
			</div>

			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">p_idx</th>
							<th scope="col">p_title</th>
							<th scope="col">p_start_date</th>
							<th scope="col">p_end_date</th>
							<th scope="col">regdate</th>
							<th scope="col">u_idx</th>
							<th scope="col">ct_idx</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bookmark" items="${bookmarkList }">
							<tr>
								<td>${bookmark.p_idx }</td>
								<td><a
									href="/Plander/mypage/bookmarkOne?p_idx=${bookmark.p_idx }">${bookmark.p_title }</a></td>
								<td>${bookmark.p_start_date }</td>
								<td>${bookmark.p_end_date }</td>
								<td>${bookmark.regdate }</td>
								<td>${bookmark.u_idx }</td>
								<td>${bookmark.ct_idx }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="nav-contact" role="tabpanel"
				aria-labelledby="nav-contact-tab">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">c_idx</th>
							<th scope="col">b_idx</th>
							<th scope="col">p_title</th>
							<th scope="col">ct_idx</th>
							<th scope="col">u_idx</th>
							<th scope="col">c_content</th>
							<th scope="col">c_regdate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="comment" items="${getCommentList }">
							<tr>
								<td>${comment.c_idx }</td>
								<td>${comment.b_idx }</td>
								<td>${comment.p_title }</td>
								<td>${comment.ct_idx }</td>
								<td>${comment.u_idx }</td>
								<td>${comment.c_content }</td>
								<td>${comment.c_regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- end of tab content -->


	</div>

	<jsp:include page="/commons/endBody.jsp" />