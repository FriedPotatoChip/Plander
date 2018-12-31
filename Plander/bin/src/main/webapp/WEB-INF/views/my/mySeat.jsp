<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<thead>
		<tr>
			<th>예약번호</th>
			<th>지점</th>
			<th>좌석종류</th>
			<th>좌석번호</th>
			<th>등록일</th>
			<th>사용기한</th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="6">
						<h2>현재 예약된 좌석이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="seat" items="${list }">
					<tr>
						<td>${seat.booknum }</td>
						<td>${seat.br_name }</td>
						<td>${seat.sct_name }</td>
						<td>${seat.s_col } ${seat.s_row }</td>
						<td>${seat.bk_regdate }</td>
						<td>${seat.start_time } - ${seat.end_time }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>

</body>
</html>