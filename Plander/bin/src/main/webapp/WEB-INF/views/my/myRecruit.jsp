<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<thead>
		<tr>
			<th>모집글제목</th>
			<th>현재인원/모집인원</th>
			<th>조회수</th>
			<th>글등록일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty my_recruit}">
				<tr>
					<td colspan="4">
						<h2>현재 등록된 모집글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="my_recruit" items="${my_recruit }">
					<tr>
						<td>${my_recruit.rc_title }</td>
						<td>${my_recruit.cur_mem }${my_recruit.max_mem }</td>
						<td>${my_recruit.hit }</td>
						<td>${my_recruit.rc_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>

</body>
</html>