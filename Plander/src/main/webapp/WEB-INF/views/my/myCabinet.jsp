<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
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
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${cabinet.start_date }" /> - <fmt:formatDate
								pattern="yyyy-MM-dd" value="${cabinet.end_date }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${cabinet.ckb_regdate }" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>

</body>
</html>