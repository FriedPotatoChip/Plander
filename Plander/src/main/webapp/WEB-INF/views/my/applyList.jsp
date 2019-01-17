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
			<th style="width: 30%;">모집글제목</th>
			<th style="width: 25%;">글등록일</th>
			<th style="width: 20%;">신청자아이디</th>
			<th style="width: 25%;">신청일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">
						<h5>신청한 인원이 없습니다.</h5>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="applyList" items="${list }">
					<tr>
						<td><a href="/recruitDetail?idx=${applyList.rc_idx }">${applyList.rc_title }</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${applyList.rc_regdate }" /></td>
						<td>${applyList.id }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${applyList.ap_regdate }" /></td>
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
										onclick="fetch_recruit('/my/applyList?nowPage=1')">〈</a></li>
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/applyList?nowPage=${page.startPage-1 }')"><span style="font-size: 0.5em;">…</span></a></li>
								</c:if>
		
								<c:forEach var="p" begin="${page.startPage }"
									end="${page.endPage }">
									<c:if test="${p == page.nowPage }">
										<li class="page_edge now"><a class="p-n now"
											href="javascript:click()"
											onclick="fetch_recruit('/my/applyList?nowPage=${p }')">${p }</a></li>
									</c:if>
									<c:if test="${p != page.nowPage }">
										<li class="page_edge"><a class="p-n"
											href="javascript:click()"
											onclick="fetch_recruit('/my/applyList?nowPage=${p }')">${p }</a></li>
									</c:if>
								</c:forEach>
		
								<c:if test="${page.chkEndPage }">
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/applyList?nowPage=${page.endPage+1 }')"><span
											style="font-size: 0.5em;">…</span></a></li>
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_recruit('/my/applyList?nowPage=${page.lastPage }')">〉〉</a></li>
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