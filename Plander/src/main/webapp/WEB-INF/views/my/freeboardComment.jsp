<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>


<style>
tr, td {
	border-bottom: 1px solid #4d4d4d;
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
}

tr:last-child td {
	border-bottom: hidden;
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
a {
	text-decoration: none;
	color: #475C7A;
}
</style>
</head>


<body>
	<thead>
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 20%;">글제목</th>
			<th style="width: 30%;">댓글내용</th>
			<th style="width: 20%;">작성자</th>
			<th style="width: 30%;">댓글등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">
						<h5>현재 등록된 댓글이 없습니다.</h5>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="board_comment" items="${list }">
					<tr>
						<td>${board_comment.b_idx }</td>
						<td><a
							href="/boardDetail?idx=${board_comment.b_idx }">${board_comment.b_title }</a></td>
						<td>${board_comment.c_content }</td>
						<td><div class="idDiv" onclick="showBox(event, this, 'chk')"
								userId="${board_comment.id }">${board_comment.id }</div></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board_comment.c_regdate }" /></td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="5">
						<!-- 페이징 시작 -->
						<div id="paging">
							<ul id="pagingList"
								class="pagination justify-content-center centered">
								<c:if test="${page.chkStartPage }">
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/board_comment?nowPage=1')">〈</a></li>
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/board_comment?nowPage=${page.startPage-1 }')"><span
											style="font-size: 0.5em;">…</span></a></li>
								</c:if>
		
								<c:forEach var="p" begin="${page.startPage }"
									end="${page.endPage }">
									<c:if test="${p == page.nowPage }">
										<li class="page_edge now"><a class="p-n now"
											href="javascript:click()"
											onclick="fetch_recruit('/my/board_comment?nowPage=${p }')">${p }</a></li>
									</c:if>
									<c:if test="${p != page.nowPage }">
										<li class="page_edge"><a class="p-n"
											href="javascript:click()"
											onclick="fetch_recruit('/my/board_comment?nowPage=${p }')">${p }</a></li>
									</c:if>
								</c:forEach>
		
								<c:if test="${page.chkEndPage }">
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/board_comment?nowPage=${page.endPage+1 }')"><span
											style="font-size: 0.5em;">…</span></a></li>
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/board_comment?nowPage=${page.lastPage }')">〉</a></li>
								</c:if>
							</ul>
						</div>
					</td>
				</tr> <!-- 페이징 끝 -->

			</c:otherwise>

		</c:choose>
	</tbody>
</body>
</html>