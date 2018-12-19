<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board</title>
<style>
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<thead>
		<tr>
			<th>RC_IDX</th>
			<th>RC_TITLE</th>
			<th>RC_CONTENT</th>
			<th>ID</th>
			<th>CUR_MEM</th>
			<th>MAX_MEM</th>
			<th>RC_REGDATE</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty board2 }">
				<tr>
					<td colspan="5">
						<h2>현재 등록된 게시글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${board2 }">
					<tr>
						<td>${board.rc_idx }</td>
						<td>${board.rc_title }</td>
						<td>${board.rc_content }</td>
						<td>${board.id }</td>
						<td>${board.cur_mem }</td>
						<td>${board.max_mem }</td>
						<td>${board.rc_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
					<%--[이전으로]에 대한 사용여부 처리 --%>
					<c:choose>
						<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
						<c:when test="${pvo.beginPage == 1 }">
							<li class="disable">이전으로</li>
						</c:when>
						<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
						<c:otherwise>
							<li><a href="/TMS/mypage/board2?cPage=${pvo.beginPage - 1 }">이전으로</a>
							</li>
						</c:otherwise>
					</c:choose>

					<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
					<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li><a href="/TMS/mypage/board2?cPage=${k }">${k }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
 
					<%--[다음으로]에 대한 사용여부 처리 --%>
					<c:choose>
						<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
						<c:when test="${pvo.endPage >= pvo.totalPage }">
							<li class="disable">다음으로</li>
						</c:when>
						<%--사용가능(enable) --%>
						<c:otherwise>
							<li><a href="/TMS/mypage/board2?cPage=${pvo.endPage + 1 }">다음으로</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
			</td>
		</tr>
	</tfoot>
</body>
</html>