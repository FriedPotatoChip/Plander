<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp" />
<style>
body {
	font-family: 'NanumSquare', sans-serif;
	font-weight: 400;
	color: #666;
	font-size: 1.2rem;
}

thead, tfoot {
	background-color: violet;
}

table {
	text-align: center;
}

#pagingList {
	list-style: none;
}

#pagingList li {
	float: left;
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
/* 클릭시 레이어 */
.idDiv {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 130px;
	height: 120px;
	padding: 10px;
	padding-top: 18px;
	padding-left: 15px;
}

.popupLayer div {
	position: absolute;
	top: 0px;
	right: 5px
}
</style>
<script> 
	function selChange(){
		var cntPerPage = document.getElementById("cntPerPage").value;
		location.href= "/TMS/recruit?nowPage=${page.nowPage }&cntPerPage="+cntPerPage;
		
	}
	function to_detail(b_idx){
		var cntPerPage = document.getElementById("cntPerPage").value;
		location.href="/TMS/recruitDetail?idx="+b_idx+"&nowPage=${page.nowPage}&cntPerPage="+cntPerPage;
	}
</script>
</head>
<body>
	<!-- 헤더 -->
	<!-- Header -->
	<c:if test="${empty sessionScope.usersVO }">
		<jsp:include page="/commons/header.jsp" />
	</c:if>
	<c:if test="${not empty sessionScope.usersVO }">
		<c:if test="${sessionScope.usersVO.rank != 1 }">
			<jsp:include page="/commons/loginheader.jsp" />
		</c:if>
		<c:if test="${sessionScope.usersVO.rank == 1 }">
			<jsp:include page="/commons/adminLoginheader.jsp" />
		</c:if>
	</c:if>
	<!-- 헤더 끝 -->
	<h3>모집 게시판임</h3>

	<div>
		<select id="cntPerPage" onchange="selChange()">
			<option value="5"
				<c:if test="${page.cntPerPage == 5}">selected</c:if>>5</option>
			<option value="10"
				<c:if test="${page.cntPerPage == 10}">selected</c:if>>10</option>
			<option value="15"
				<c:if test="${page.cntPerPage == 15}">selected</c:if>>15</option>
			<option value="20"
				<c:if test="${page.cntPerPage == 20}">selected</c:if>>20</option>
		</select>
		<table border="1">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>모집 여부</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${boardList }">
					<tr>
						<td width="10%">${list.rc_idx }</td>
						<td width="60%"><a href="#"
							onclick="to_detail(${list.rc_idx})">${list.rc_title }</a> <c:if
								test="${list.cnt != 0 }">
								<a href="#	" onclick="to_detail(${list.rc_idx})">[${list.cnt }]</a>
							</c:if></td>
						<td>
							<div class="idDiv" userId="${list.id }">${list.id }</div>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${list.rc_regdate }" /></td>
						<td><c:if test='${list.onOff eq "ON" }'>
							모집 중
						</c:if> <c:if test='${list.onOff eq "OFF" }'>
							모집 마감
						</c:if></td>
						<td>${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty boardList }">
					<tr>
						<td colspan="6" style="font-size: 2.0em; font-style: bold;">조회된
							게시물이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">tfoot</td>
				</tr>
			</tfoot>
		</table>

		<!--  -->
		<form action="/TMS/searchRecruitList">
			<input type="text" name="keyword">
			<!-- 검색창 -->
			<select name="target">
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="tc">제목 & 내용</option>
				<option value="w">작성자</option>
			</select> <input type="submit" value="검색"> <input type="hidden"
				name="cntPerPage" value="${page.cntPerPage }">
		</form>
		<!-- 글쓰기 -->
		<c:if test="${not empty usersVO }">
			<input type="button" value="글쓰기" id="write" onclick="write_go()">
		</c:if>
		<br>
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
	</div>




	<script>
	function write_go(){
		location.href="/TMS/recruitWrite";
	}
	function calcDate(date){
		var date = new Date(date);
		console.log("date: "+ date);
		return date;
	}
</script>
	<div class="popupLayer">
		<div>
			<span onClick="closeLayer()"
				style="cursor: pointer; font-size: 0.85em; color: gray;" title="닫기">X</span>
		</div>
		<a id="sendMsg" href="#">쪽지 보내기</a><br> <a id="userProfile"
			href="#">회원 정보 보기</a><br> <a id="showWritten" href="#">작성글
			보기</a><br>
	</div>
	<script>
function closeLayer( obj ) {
	$(".popupLayer").hide();
}

$(function(){
	/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	$('.idDiv').click(function(e)
	{
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $('.popupLayer').width();
		var oHeight = $('.popupLayer').height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.clientX + 10 + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
		var divTop = e.clientY + 5 + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
		console.log("X: "+ e.clientX);
		console.log("Y: "+ e.clientY);

		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		/* if( divTop + oHeight > sHeight ) divTop -= oHeight; */

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		/* if( divTop < 0 ) divTop = 0; */

		$('.popupLayer').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).show();
		console.log(this);
		var userId = $(this).attr("userId");
		console.log($(this).attr("userId"));
		$("#showWritten").attr("href", "/TMS/searchList?keyword="+userId+"&target=w&ct_idx=${ct_idx}")
		$("#sendMsg").click(function(){
			$(".popupLayer").hide();
			if ('${usersVO.id}' == ''){
				alert("로그인 후 이용 가능합니다.");
				return false;
			} 
			window.open("/TMS/sendMsg?recv_id="+userId, "쪽지 보내기", "width=500, height=500");
		});
		$("#userProfile").click(function(){
			$(".popupLayer").hide();
			if ('${usersVO.id}' == ''){
				alert("로그인 후 이용 가능합니다.");
				return false;
			} 
			window.open("/TMS/profileSummary?id="+userId, "회원 정보", "width=500, height=500");
		});
	})
});
</script>
</body>
</html>