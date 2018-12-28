<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<thead>
		<tr>
			<th>모집글번호</th>
			<th>모집글제목</th>
			<th>댓글내용</th>
			<th>댓글등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty my_recruit_comment}">
				<tr>
					<td colspan="4">
						<h2>현재 등록된 댓글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="my_recruit_comment" items="${my_recruit_comment }">
					<tr>
						<td>${my_recruit_comment.rc_idx }</td>
						<td>${my_recruit_comment.rc_title }</td>
						<td>${my_recruit_comment.c_content }</td>
						<td>${my_recruit_comment.c_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>

</body>
</html>