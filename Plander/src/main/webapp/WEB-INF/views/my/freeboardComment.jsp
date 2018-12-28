<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<thead>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>댓글내용</th>
			<th>작성자</th>
			<th>댓글등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty map.list}">
				<tr>
					<td colspan="5">
						<h2>현재 등록된 댓글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="board_comment" items="${map.list }">
					<tr>
						<td>${board_comment.b_idx }</td>
						<td><a
							href="/TMS/my/boardDetail?rc_idx=${board_comment.b_idx }&curPage=${map.boardPager.curPage}">${board_comment.b_title }</a></td>
						<td>${board_comment.c_content }</td>
						<td>${board_comment.id }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board_comment.c_regdate }" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>

	<!-- 페이징 -->
	<jsp:include page="/commons/paging.jsp"></jsp:include>
</body>
</html>