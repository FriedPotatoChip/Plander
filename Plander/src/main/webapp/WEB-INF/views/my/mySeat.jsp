<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<th>예약번호</th>
			<th>지점</th>
			<th>좌석<br>종류
			</th>
			<th>좌석<br>번호
			</th>
			<th>등록일</th>
			<th>사용기한</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="6">
						<h5>현재 예약된 좌석이 없습니다.</h5>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="seat" items="${list }">
					<tr>
						<td>${seat.booknum }</td>
						<td>${seat.br_name }</td>
						<td>${seat.sct_name }</td>
						<td>${seat.s_col }</td>
						<td>${seat.start_time }<br>- ${seat.end_time }
						</td>
						<td><button type="button"
								class="btn btn-outline-danger btn-sm"
								onclick="location.href='/my/delSeat?bk_idx=${seat.bk_idx }'">예약취소</button></td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="6">
						<!-- 페이징 시작 -->
						<div id="paging">
							<ul id="pagingList"
								class="pagination justify-content-center">
								<c:if test="${page.chkStartPage }">
									<li class="page_edge"><a class="p-n" href="#"
										onclick="fetch_book('/my/my_seat?nowPage=1')">〈</a></li>
									<li class="page_edge"><a class="p-n" href="#"
										onclick="fetch_book('/my/my_seat?nowPage=${page.startPage-1 }')"><span
											style="font-size: 0.5em;">…</span></a></li>
								</c:if>
		
								<c:forEach var="p" begin="${page.startPage }"
									end="${page.endPage }">
									<c:if test="${p == page.nowPage }">
										<li class="page_edge now"><a class="p-n now" href="#"
											onclick="fetch_book('/my/my_seat?nowPage=${p }')">${p }</a></li>
									</c:if>
									<c:if test="${p != page.nowPage }">
										<li class="page_edge"><a class="p-n" href="#"
											onclick="fetch_book('/my/my_seat?nowPage=${p }')">${p }</a></li>
									</c:if>
								</c:forEach>
		
								<c:if test="${page.chkEndPage }">
									<li class="page_edge"><a class="p-n" href="#"
										onclick="fetch_book('/my/my_seat?nowPage=${page.endPage+1 }')"><span
											style="font-size: 0.5em;">…</span></a></li>
									<li class="page_edge"><a class="p-n" href="#"
										onclick="fetch_book('/my/my_seat?nowPage=${page.lastPage }')">〉</a></li>
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