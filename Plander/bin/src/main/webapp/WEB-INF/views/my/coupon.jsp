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
			<th>쿠폰명</th>
			<th>할인금액</th>
			<th>사용기한</th>
			<th>매수</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">
						<h2>현재 보유하고 계신 쿠폰이 없습니다.</h2>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="coupon" items="${list }">
					<tr>
						<td>${coupon.cb_name }</td>
						<td>${coupon.cb_discount }<c:choose>
								<c:when
									test="${coupon.cb_distype == percent || coupon.cb_distype == PERCENT }">
								%
							</c:when>
								<c:otherwise>
							원
							</c:otherwise>
							</c:choose>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${coupon.cp_enddate }" /></td>
						<td>${coupon.cp_quantity }</td>
					</tr>
				</c:forEach>

				<!-- 페이징 시작 -->
				<div id="paging">
					<ul id="pagingList"
						class="pagination justify-content-center centered">
						<c:if test="${page.chkStartPage }">
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/my/coupon?nowPage=1')">〈</a></li>
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/my/coupon?nowPage=${page.startPage-1 }')"><span
									style="font-size: 0.5em;">…</span></a></li>
						</c:if>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li class="page_edge now"><a class="p-n now"
									href="javascript:click()"
									onclick="fetch_book('/TMS/my/coupon?nowPage=${p }')">${p }</a></li>
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li class="page_edge"><a class="p-n"
									href="javascript:click()"
									onclick="fetch_book('/TMS/my/coupon?nowPage=${p }')">${p }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page.chkEndPage }">
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/my/coupon?nowPage=${page.endPage+1 }')"><span
									style="font-size: 0.5em;">…</span></a></li>
							<li class="page_edge"><a class="p-n"
								href="javascript:click()"
								onclick="fetch_book('/TMS/my/coupon?nowPage=${page.lastPage }')">〉</a></li>
						</c:if>
					</ul>
				</div>
			</c:otherwise>

		</c:choose>
	</tbody>

</body>
</html>