<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<!-- 페이징 시작 -->
	<div id="paging">
		<ul id="pagingList">
			<c:if test="${page.chkStartPage }">
				<li><a
					href="/TMS/recruit?nowPage=1&cntPerPage=${page.cntPerPage}"><button>&lt;&lt;</button></a></li>
				<li><a
					href="/TMS/recruit?nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"><button>&lt;</button></a></li>
			</c:if>
			<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
				<c:if test="${p == page.nowPage }">
					<li><a class="now marginLi"
						href="/TMS/recruit?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
					</li>
				</c:if>
				<c:if test="${p != page.nowPage }">
					<li><a class="marginLi"
						href="/TMS/recruit?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
					</li>
				</c:if>

			</c:forEach>
			<c:if test="${page.chkEndPage }">
				<li><a
					href="/TMS/recruit?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"><button>&gt;</button></a></li>
				<li><a
					href="/TMS/recruit?nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"><button>&gt;&gt;</button></a></li>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 끝 -->
</body>
</html>