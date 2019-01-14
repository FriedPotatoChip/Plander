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

.center {
	text-align: center;
}
</style>
<script> 
	function selChange(){
		var cntPerPage = document.getElementById("cntPerPage").value;
		location.href= "/TMS/board?ct_idx=${ct_idx}&nowPage=${page.nowPage }&cntPerPage="+cntPerPage;/*  */
	}
	function to_detail(b_idx){
		var cntPerPage = document.getElementById("cntPerPage").value;
		location.href="/TMS/boardDetail?idx="+b_idx+"&nowPage=${page.nowPage}&cntPerPage="+cntPerPage;
	}
	$(document).ready(function(){
		if ('${ct_idx}' == 1){
			$("#boardType").html("공지사항");
		}else if ('${ct_idx}' == 2){
			$("#boardType").html("자유게시판");	
		}else if ('${ct_idx}' == 3){
			$("#boardType").html("후기게시판");	
		}else if ('${ct_idx}' == 4){
			$("#boardType").html("QNA");
		}
	});
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
	<div class="jumbotron jumbotron-fluid"
		style="background-color: #008374;">
		<div class="container">
			<%-- 			<a href="/TMS/board?ct_idx=${ct_idx }"> --%>
			<h1 id="boardType" class="center" style="color: white;"></h1>
		</div>
	</div>

	<!-- 검색창 및 글쓰기 -->
	<div style="width: 60%; margin: 0 auto;">
		<form action="/TMS/searchList" class="form-inline my-2 my-lg-0">
			<!-- 검색창 -->
			<select class="custom-select my-1 mr-sm-2" name="target">
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="tc">제목 & 내용</option>
				<option value="w">작성자</option>
			</select> <input class="form-control mr-sm-2" type="search" name="keyword"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			<input type="hidden" name="ct_idx" value="${boardList[0].ct_idx}">
			<input type="hidden" name="cntPerPage" value="${page.cntPerPage }">
		</form>
		<!-- 글쓰기 -->
		<c:if test="${not empty usersVO }">
			<button class="btn btn-success my-2 my-sm-0" type="button" id="write"
				onclick="write_go()">글쓰기</button>
		</c:if>
	</div>

	<div style="width: 60%; margin: 0 auto;">
		<select id="cntPerPage" onchange="selChange()"
			style="float: right; margin-bottom: 5px;">
			<option value="5"
				<c:if test="${page.cntPerPage == 5}">selected</c:if>>5</option>
			<option value="10"
				<c:if test="${page.cntPerPage == 10}">selected</c:if>>10</option>
			<option value="15"
				<c:if test="${page.cntPerPage == 15}">selected</c:if>>15</option>
			<option value="20"
				<c:if test="${page.cntPerPage == 20}">selected</c:if>>20</option>
		</select>
		<table border="1"
			style="width: 100%; margin: 0 auto; margin-bottom: 20px;"
			class="table">
			<thead class="thead" style="background-color: #6762a6; color: white;">
				<tr>
					<th scope="row">No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${boardList }">
					<tr>
						<th scope="row" width="10%">${list.b_idx }</th>
						<td width="60%"><a href="#"
							onclick="to_detail(${list.b_idx})">${list.b_title }</a> <c:if
								test="${list.cnt != 0 }">
								<a href="#" onclick="to_detail(${list.b_idx})">[${list.cnt }]</a>
							</c:if></td>
						<td>
							<div class="idDiv" userId="${list.id }">${list.id }</div>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${list.b_regdate }" /></td>
						<td>${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty boardList }">
					<tr>
						<td colspan="5" style="font-size: 2.0em; font-style: bold;">조회된
							게시물이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>

		</table>

		<!-- 페이징 시작 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${page.chkStartPage }">
					<li class="page-item"><a class="page-link"
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=1&cntPerPage=${page.cntPerPage}"><button>&lt;&lt;</button></a></li>
					<li class="page-item"><a class="page-link"
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"><button>&lt;</button></a></li>
				</c:if>
				<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
					<c:if test="${p == page.nowPage }">
						<li class="page-item"><a class="page-link"
							href="/TMS/board?ct_idx=${ct_idx }&nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>
					<c:if test="${p != page.nowPage }">
						<li class="page-item"><a class="page-link"
							href="/TMS/board?ct_idx=${ct_idx }&nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>

				</c:forEach>
				<c:if test="${page.chkEndPage }">
					<li class="page-item"><a class="page-link"
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"><button>&gt;</button></a></li>
					<!--  -->
					<li class="page-item"><a class="page-link"
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"><button>&gt;&gt;</button></a></li>
					<!--  -->
				</c:if>
			</ul>
		</nav>
		<%-- 
		<!-- 페이징 시작 -->
		<div id="paging">
			<ul id="pagingList">
				<c:if test="${page.chkStartPage }">
					<li><a
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=1&cntPerPage=${page.cntPerPage}"><button>&lt;&lt;</button></a></li>
					<li><a
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"><button>&lt;</button></a></li>
				</c:if>
				<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
					<c:if test="${p == page.nowPage }">
						<li><a class="now marginLi"
							href="/TMS/board?ct_idx=${ct_idx }&nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>
					<c:if test="${p != page.nowPage }">
						<li><a class="marginLi"
							href="/TMS/board?ct_idx=${ct_idx }&nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>

				</c:forEach>
				<c:if test="${page.chkEndPage }">
					<li><a
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"><button>&gt;</button></a></li>
					<!--  -->
					<li><a
						href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"><button>&gt;&gt;</button></a></li>
					<!--  -->
				</c:if>
			</ul>
		</div>
		<!-- 페이징 끝 --> --%>

	</div>




	<script>
	function write_go(){
		if (${ct_idx == 3}){
			console.log("여 왔네");
			$.ajax({
				url: '/chkBooking',
				type: 'get',
				data: {id:'${usersVO.id}'},
				dataType: 'text',
				success: function(result){
					if (result == 'success'){
						location.href="/TMS/boardWrite?ct_idx=${ct_idx}"; /* */
					} else if (result == 'fail'){
						alert("TMS 서비스를 이용한 후에 후기를 작설할 수 있습니다.");
						return false;
					}
				}, error: function(error){
					
				}
			})
		} else {
			location.href="/TMS/boardWrite?ct_idx=${ct_idx}"; /* */
		}
	}
	<c:if test="${not empty chkBooking}">
		alert("거기스 서비스 이용 후에 후기를 작성할 수 있습니다.");
	</c:if>
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