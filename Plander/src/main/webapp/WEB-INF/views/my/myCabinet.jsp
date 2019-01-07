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
						<h2>현재 예약된 사물함이 없습니다.</h2>
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
								pattern='yyyy-MM-dd' var="startDate"/>
								<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>
								 <br> - <fmt:parseDate
								value='${cabinet.end_date}' pattern='yyyy-MM-dd' var="endDate"/>
								<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
								</td>
						<td><button type="button"
								class="btn btn-outline-danger btn-sm"
								onclick="location.href='/TMS/my/delCabinet?ckb_idx=${cabinet.ckb_idx }'">예약취소</button></td>
					</tr>
				</c:forEach>

				<!-- 페이징 시작 -->
				<div id="paging">
					<ul id="pagingList">
						<c:if test="${page.chkStartPage }">
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/my_cabinet?nowPage=1')"><button>&lt;&lt;</button></a></li>
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/my_cabinet?nowPage=${page.startPage-1 }')"><button>&lt;</button></a></li>
						</c:if>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li><a class="now marginLi" href="javascript:click()"
									onclick="fetch_book('/TMS/my/my_cabinet?nowPage=${p }')">${p }</a></li>
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li><a class="marginLi" href="javascript:click()"
									onclick="fetch_book('/TMS/my/my_cabinet?nowPage=${p }')">${p }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page.chkEndPage }">
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/my_cabinet?nowPage=${page.endPage+1 }')"><button>&gt;</button></a></li>
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/my/my_cabinet?nowPage=${page.lastPage }')"><button>&gt;&gt;</button></a></li>
						</c:if>
					</ul>
				</div>
			</c:otherwise>

		</c:choose>
	</tbody>

</body>
</html>