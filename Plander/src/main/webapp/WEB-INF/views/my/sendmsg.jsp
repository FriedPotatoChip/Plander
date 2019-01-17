<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<th>제목</th>
			<th>받는사람</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">
						<h5>보낸 쪽지가 없습니다.</h5>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="msg" items="${list }">
					<tr>
						<td><a href="#"
							onclick="window.open('/recvMsg?rm_idx=${msg.sm_idx }', '받은 쪽지', 'width=500, height=600'); return false;">${msg.title }</a>
						</td>
						<td>${msg.recv_id }</td>
						<td>${msg.content }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${msg.regdate }" /></td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="4">
						<!-- 페이징 시작 -->
						<div id="paging">
							<ul id="pagingList"
								class="pagination justify-content-center centered">
								<c:if test="${page.chkStartPage }">
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_book('/my/sendMsg?nowPage=1')"><button>&lt;&lt;</button></a></li>
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_book('/my/sendMsg?nowPage=${page.startPage-1 }')"><button>&lt;</button></a></li>
								</c:if>
		
								<c:forEach var="p" begin="${page.startPage }"
									end="${page.endPage }">
									<c:if test="${p == page.nowPage }">
										<li class="page_edge now"><a class="p-n now"
											href="javascript:click()"
											onclick="fetch_book('/my/sendMsg?nowPage=${p }')">${p }</a></li>
									</c:if>
									<c:if test="${p != page.nowPage }">
										<li class="page_edge"><a class="p-n"
											href="javascript:click()"
											onclick="fetch_book('/my/sendMsg?nowPage=${p }')">${p }</a></li>
									</c:if>
								</c:forEach>
		
								<c:if test="${page.chkEndPage }">
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_book('/my/sendMsg?nowPage=${page.endPage+1 }')"><span
											style="font-size: 0.5em;">…</span></a></li>
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_book('/my/sendMsg?nowPage=${page.lastPage }')">〉</a></li>
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