<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>

<!-- 반응형 웹페이지 링크 ======================================================================== -->
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min2.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">
<!-- ======================================================================================== -->

<style>


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

.myBook_nav {
	float: right;
	position: relative;
	left: -45%;
	position: relative;
}

tr, td {
	border-bottom: 1px solid #000;
	padding-top: 10px;
	padding-bottom: 10px;
}

tr:last-child td {
	border-bottom: none;
}

/* 페이징 시작 */
.p-n {
	color: #685D79;
	font-weight: 700;
}

.page_edge {
	border: 1px solid #dee2e6;
	display: block;
	padding: .5rem .75rem;
	color: #4d4d4d;
	line-height: 1.25;
}

.now {
	background-color: #D8737F;
	color: white;
}

.now:hover {
	color: #475C7A;
}

#paging {
	margin: 10px;
}

/* 페이징 처리 끝 */

</style>

</head>
<body>
	<thead style="background-color: #475C7A; color: white;">
		<tr>
			<th style="width: 30%;">제목</th>
			<th style="width: 20%;">보낸사람</th>
			<th style="width: 20%;">날짜</th>
			<th style="width: 15%;">확인 여부</th>
			<th style="width: 15%;"></th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">
						<h2>받은 쪽지가 없습니다.</h2>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="msg" items="${list }">
					<tr>
						<td><a href="#"
							onclick="window.open('/TMS/recvMsg?rm_idx=${msg.rm_idx }', '받은 쪽지', 'width=500, height=500'); return false;">${msg.title }</a>
						</td>

						<td><div class="idDiv" userId="${msg.send_id }"
								onclick="showBox(event, this)">${msg.send_id }</div></td>

						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${msg.regdate }" /></td>

						<td><c:if test="${msg.chk == 0 }">
								<span style="color: red;">&#10004;</span>
							</c:if></td>

						<td><button class="btn btn-outline-danger"
								onclick="msgDel('${msg.rm_idx}', '${page.nowPage }')">삭제</button></td>
					</tr>
				</c:forEach>

				<!-- 페이징 시작 -->
				<div id="paging">
					<ul id="pagingList"
						class="pagination justify-content-center centered">
						<c:if test="${page.chkStartPage }">
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=1')">〈</a></li>
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${page.startPage-1 }')"><span
									style="font-size: 0.5em;">…</span></a></li>
						</c:if>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li class="page_edge now"><a class="p-n now"
									href="javascript:click()"
									onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${p }')">${p }</a></li>
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li class="page_edge"><a class="p-n"
									href="javascript:click()"
									onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${p }')">${p }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page.chkEndPage }">
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${page.endPage+1 }')"><span
									style="font-size: 0.5em;">…</span></a></li>
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${page.lastPage }')">〉</a></li>
						</c:if>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</tbody>
</body>
</html>