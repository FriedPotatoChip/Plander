<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
<style>
body {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

tr, td {
	border-bottom: 1px solid #000;
	padding-top: 10px;
	padding-bottom: 10px;
}

tr:last-child td {
	border-bottom: none;
}
</style>
</head>
<body>
	<thead>
		<tr>
			<th>글제목</th>
			<th>조회수</th>
			<th>글등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty map.list}">
				<tr>
					<td colspan="3">
						<h2>현재 등록된 글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${map.list }">
					<tr>
						<td><a
							href="/TMS/my/boardDetail?b_idx=${board.b_idx }&curPage=${map.boardPager.curPage}">${board.b_title }</a></td>
						<td>${board.hit }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.b_regdate }" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</body>
</html>