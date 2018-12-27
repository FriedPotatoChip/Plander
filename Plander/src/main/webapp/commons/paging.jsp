<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />
</head>
<body>
	<!-- 페이징 -->
	<nav aria-label="Page navigation example"
		style="margin-top: 20px; width: 400%;">
		<ul class="pagination justify-content-center">
			<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
			<c:if test="${map.boardPager.curBlock > 1}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('1')">&lt;&lt;</a></li>
			</c:if>
			<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curBlock > 1}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('${map.boardPager.prevPage}')">&lt;</a></li>
			</c:if>
			<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
			<c:forEach var="num" begin="${map.boardPager.blockBegin}"
				end="${map.boardPager.blockEnd}">
				<!-- 현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${num == map.boardPager.curPage}">
						<li class="page-item disabled"><a class="page-link"
							tabindex="-1" aria-disabled="true" href="#">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a id="unique" class="page-link"
							href="javascript:list('${num}')">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('${map.boardPager.nextPage}')">&gt;</a></li>
			</c:if>
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
				<li class="page-item"><a class="page-link"
					href="javascript:list('${map.boardPager.totPage}')">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- 페이징 -->
</body>
</html>