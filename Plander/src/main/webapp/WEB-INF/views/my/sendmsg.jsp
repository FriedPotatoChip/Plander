<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
<style>


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
						<h2>보낸 쪽지가 없습니다.</h2>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="msg" items="${list }">
					<tr>
						<td>${msg.title }</td>
						<td>${msg.recv_id }</td>
						<td>${msg.content }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${msg.regdate }" /></td>
					</tr>
				</c:forEach>

				<!-- 페이징 시작 -->
				<div id="paging">
					<ul id="pagingList">
						<c:if test="${page.chkStartPage }">
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/sendMsg?nowPage=1')"><button>&lt;&lt;</button></a></li>
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/sendMsg?nowPage=${page.startPage-1 }')"><button>&lt;</button></a></li>
						</c:if>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li><a class="now marginLi" href="javascript:click()"
									onclick="fetch_book('/TMS/my/sendMsg?nowPage=${p }')">${p }</a></li>
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li><a class="marginLi" href="javascript:click()"
									onclick="fetch_book('/TMS/my/sendMsg?nowPage=${p }')">${p }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page.chkEndPage }">
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/sendMsg?nowPage=${page.endPage+1 }')"><button>&gt;</button></a></li>
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/sendMsg?nowPage=${page.lastPage }')"><button>&gt;&gt;</button></a></li>
						</c:if>
					</ul>
				</div>
			</c:otherwise>

		</c:choose>
	</tbody>

</body>
</html>