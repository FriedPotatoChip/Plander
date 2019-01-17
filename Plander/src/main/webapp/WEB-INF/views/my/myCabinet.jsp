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
a {
	text-decoration: none;
	color: #475C7A;
}
</style>
</head>


<body>
	<thead>
		<tr>
			<th>예약번호</th>
			<th>지점</th>
			<th>사물함번호</th>
			<th>사용기한</th>
			<th>등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">
						<h5>현재 예약된 사물함이 없습니다.</h5>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="cabinet" items="${list}">
					<tr>
						<td>${cabinet.ckb_idx }</td>
						<td>${cabinet.br_name }</td>
						<td>${cabinet.cb_number }</td>
						<td><fmt:parseDate value='${cabinet.start_date}'
								pattern='yyyy-MM-dd' var="startDate" /> <fmt:formatDate
								value="${startDate}" pattern="yyyy-MM-dd" /> <br> - <fmt:parseDate
								value='${cabinet.end_date}' pattern='yyyy-MM-dd' var="endDate" />
							<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" /></td>
						<td><button type="button"
								class="btn btn-outline-danger btn-sm"
								onclick="location.href='/my/delCabinet?ckb_idx=${cabinet.ckb_idx }'">예약취소</button></td>
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
									onclick="fetch_book('/my/my_cabinet?nowPage=1')">〈</a></li>
								<li class="page_edge"><a class="p-n"
									href="javascript:click()"
									onclick="fetch_book('/my/my_cabinet?nowPage=${page.startPage-1 }')"><span
										style="font-size: 0.5em;">…</span></a></li>
							</c:if>
	
							<c:forEach var="p" begin="${page.startPage }"
								end="${page.endPage }">
								<c:if test="${p == page.nowPage }">
									<li class="page_edge now"><a class="p-n now"
										href="javascript:click()"
										onclick="fetch_book('/my/my_cabinet?nowPage=${p }')">${p }</a></li>
								</c:if>
								<c:if test="${p != page.nowPage }">
									<li class="page_edge"><a class="p-n"
										href="javascript:click()"
										onclick="fetch_book('/my/my_cabinet?nowPage=${p }')">${p }</a></li>
								</c:if>
							</c:forEach>
	
							<c:if test="${page.chkEndPage }">
								<li class="page_edge"><a class="p-n"
									href="javascript:click()"
									onclick="fetch_book('/my/my_cabinet?nowPage=${page.endPage+1 }')"><span
										style="font-size: 0.5em;">…</span></a></li>
								<li class="page_edge"><a class="p-n"
									href="javascript:click()"
									onclick="fetch_book('/my/my_cabinet?nowPage=${page.lastPage }')">〉</a></li>
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