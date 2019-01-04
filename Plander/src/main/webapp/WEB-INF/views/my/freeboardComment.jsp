<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>


<style>
body {
	width: 80%;
	margin: 0 auto;
	text-align: center;
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
#pagingList {
	list-style: none;
}

#pagingList li {
	display: inline;
}

.marginLi {
	margin-left: 5px;
	margin-right: 5px;
}

a {
	text-decoration: none;
}

.now {
	background-color: orange;
}
/* 페이징 끝 */
</style>
</head>


<body>
	<thead>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>댓글내용</th>
			<th>작성자</th>
			<th>댓글등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty map.list}">
				<tr>
					<td colspan="5">
						<h2>현재 등록된 댓글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="board_comment" items="${map.list }">
					<tr>
						<td>${board_comment.b_idx }</td>
						<td><a
							href="/TMS/my/boardDetail?rc_idx=${board_comment.b_idx }&curPage=${map.boardPager.curPage}">${board_comment.b_title }</a></td>
						<td>${board_comment.c_content }</td>
						<td>${board_comment.id }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board_comment.c_regdate }" /></td>
					</tr>
				</c:forEach>

				<!-- 페이징 시작 -->
				<div id="paging">
					<ul id="pagingList">
						<c:if test="${page.chkStartPage }">
							<li><a href="#" onclick="fetch_recruit('/TMS/my/board_comment?nowPage=1')"><button>&lt;&lt;</button></a></li>
							<li><a href="#" onclick="fetch_recruit('/TMS/my/board_comment?nowPage=${page.startPage-1 }')"><button>&lt;</button></a></li>
						</c:if>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li><a class="now marginLi"
									href="#" onclick="fetch_recruit('/TMS/my/board_comment?nowPage=${p }')">${p }</a></li>
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li><a class="marginLi"
									href="#" onclick="fetch_recruit('/TMS/my/board_comment?nowPage=${p }')">${p }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page.chkEndPage }">
							<li><a href="#" onclick="fetch_recruit('/TMS/my/board_comment?nowPage=${page.endPage+1 }')"><button>&gt;</button></a></li>
							<li><a href="#" onclick="fetch_recruit('/TMS/my/board_comment?nowPage=${page.lastPage }')"><button>&gt;&gt;</button></a></li>
						</c:if>
					</ul>
				</div>
			</c:otherwise>

		</c:choose>
	</tbody>
</body>
</html>