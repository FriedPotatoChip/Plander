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
			<th>글등록일</th>
			<th>신청자아이디</th>
			<th>신청일</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty applyList}">
				<tr>
					<td colspan="5">
						<h2>신청한 인원이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="applyList" items="${applyList }">
					<tr>
						<td>${applyList.rc_title }</td>
						<td>${applyList.cur_mem }${applyList.max_mem }</td>
						<td>${applyList.rc_regdate }</td>
						<td>${applyList.id }</td>
						<td>${applyList.ap_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>

</body>
</html>