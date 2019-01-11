<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
<style>
tr, td {
	border-bottom: 1px solid #000;
	padding-top: 10px;
	padding-bottom: 10px;
}

tr:last-child td {
	border-bottom: none;
}

/* 페이징 시작 */
#pagingList {
	list-style: none;
}

#pagingList li {
	display: inline;
}

.marginLi {
	margin-left: 5px;
	margin-right: 5px;
}

a {
	text-decoration: none;
}

.now {
	background-color: orange;
}
/* 페이징 끝 */
</style>

</head>

<body>
	<thead>
		<tr>
			<th>제목</th>
			<th>보낸사람</th>
			<th>날짜</th>
			<th>확인 여부</th>
			<th></th>
		</tr>
	</thead>

	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">
						<h2>받은 쪽지가 없습니다.</h2>
					</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach var="msg" items="${list }">
					<tr>
						<td><a href="#"
							onclick="window.open('/TMS/recvMsg?rm_idx=${msg.rm_idx }', '받은 쪽지', 'width=500, height=500'); return false;">${msg.title }</a>
						</td>
						<td><div class="idDiv" onclick="showBox(event, this)"
								userId="${msg.send_id }">${msg.send_id }</div></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${msg.regdate }" /></td>
						<td><c:if test="${msg.chk == 0 }">
								<span style="color: red;">&#10004;</span>
							</c:if></td>
						<td><button class="btn btn-outline-danger"
								onclick="msgDel('${msg.rm_idx}', '${page.nowPage }')">삭제</button></td>
					</tr>
				</c:forEach>

				<!-- 페이징 시작 -->
				<div id="paging">
					<ul id="pagingList">
						<c:if test="${page.chkStartPage }">
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=1')"><button>&lt;&lt;</button></a></li>
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${page.startPage-1 }')"><button>&lt;</button></a></li>
						</c:if>

						<c:forEach var="p" begin="${page.startPage }"
							end="${page.endPage }">
							<c:if test="${p == page.nowPage }">
								<li><a class="now marginLi" href="javascript:click()"
									onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${p }')">${p }</a></li>
							</c:if>
							<c:if test="${p != page.nowPage }">
								<li><a class="marginLi" href="javascript:click()"
									onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${p }')">${p }</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page.chkEndPage }">
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${page.endPage+1 }')"><button>&gt;</button></a></li>
							<li><a href="javascript:click()"
								onclick="fetch_book('/TMS/admin/recvMsg?nowPage=${page.lastPage }')"><button>&gt;&gt;</button></a></li>
						</c:if>
					</ul>
				</div>

			</c:otherwise>

		</c:choose>
	</tbody>

	<div class="popupLayer">
		<div>
			<span onClick="closeLayer()"
				style="cursor: pointer; font-size: 0.85em; color: gray;" title="닫기">X</span>
		</div>
		<a id="sendMsg" href="#">쪽지 보내기</a><br> <a id="userProfile"
			href="#">회원 정보 보기</a><br>
	</div>

	<script>
		function closeLayer(obj) {
			$(".popupLayer").hide();
		}

		function showBox(e, tag) {
			console.log("idDiv 클릭됨");
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX
					+ 10
					+ (document.documentElement.scrollLeft ? document.documentElement.scrollLeft
							: document.body.scrollLeft);
			var divTop = e.clientY
					+ 5
					+ (document.documentElement.scrollTop ? document.documentElement.scrollTop
							: document.body.scrollTop);
			console.log("X: " + e.clientX);
			console.log("Y: " + e.clientY);

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if (divLeft + oWidth > sWidth)
				divLeft -= oWidth;
			if (divTop + oHeight > sHeight)
				divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if (divLeft < 0)
				divLeft = 0;
			if (divTop < 0)
				divTop = 0;

			$('.popupLayer').css({
				"top" : divTop,
				"left" : divLeft,
				"position" : "absolute"
			}).show();
			console.log(this);
			var userId = $(tag).attr("userId");
			console.log($(tag).attr("userId"));
			$("#sendMsg").click(
					function() {
						$(".popupLayer").hide();
						if ('${usersVO.id}' == '') {
							alert("로그인 후 이용 가능합니다.");
							return false;
						}
						window.open("/TMS/sendMsg?recv_id=" + userId, "쪽지 보내기",
								"width=500, height=500");
					});
			$("#userProfile").click(
					function() {
						$(".popupLayer").hide();
						if ('${usersVO.id}' == '') {
							alert("로그인 후 이용 가능합니다.");
							return false;
						}
						window.open("/TMS/profileSummary?id=" + userId,
								"회원 정보", "width=500, height=500");
					});
		}
	</script>
</body>
</html>