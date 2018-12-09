<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style>
#update_btn {
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="/commons/header.jsp"></jsp:include>

	<div class="container">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<img height="100" width="100" alt="힘이없을때는 경수를 보자"
					src="/resources/images/do.png"> <b>${user.name }</b>
				<button type="button" class="btn btn-info" id="update_btn"
					onclick="jsp:location.href='update.jsp'">회원정보수정</button>
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
									href="/Plander/mypage/bookmarkOne?p_idx=${planner.p_idx }">${bookmark.p_title }</a></td>
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
				aria-labelledby="nav-contact-tab">댓글</div>

		</div>

	</div>


	<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>