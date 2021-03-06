<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp" />
<style>
	.header {
		font-family: 'NanumSquare', sans-serif;
		font-weight: 400;
		color: #666;
		font-size: 1.2rem;
	}
	table { text-align: center; }
	.center { text-align: center; }
	.write { float: right; }
	#selectBox::after, #paging::after, .write::after {
		content: "";
		clear: both;
		display: table;
	}
	a { text-decoration: none; color: #4d4d4d; }
	/* 버튼 */
	.button {
		display: inline-block;
		padding: 6px 12px;
		border-radius: 4px;
		font-size: 14px;
		text-align: center;
		background-color: white;
		border: 1px solid #685D79;
		cursor: pointer;
	}
	
	.button:hover {
		border: 1px solid #685D79;
		background-color: #685D79;
		color: white;
	}
	/* 버튼 끝 */
	/* 페이징 시작 */
	.p-n {
		color: #685D79;
		font-weight: 700;
	}
	.page_edge {
		border: 1px solid #dee2e6;
		display: block;
		padding: .5rem .75rem;
		color: #4d4d4d;
		line-height: 1.25;
	}
	.now {
		background-color: #685D79;
		color: white;
	}
	/* 페이징 처리 끝 */
	
	/* select/option */
	.opt {
		display: inline-block;
		padding: .375rem 1.75rem .375rem .75rem;
		font-weight: 400;
		line-height: 1.5;
		color: #4d4d4d;
		vertical-align: middle;
		border-radius: .25rem;

	}
	.textline {
		height: calc;
		padding: .375rem .75rem;
		font-weight: 400;
		line-height: 1.5;
		color: #4d4d4d;
		vertical-align: middle;
		border: 1px solid #ced4da;
		border-radius: .25rem;
		background-clip: padding-box;
	}
	/* select/option 끝 */
	
	a { text-decoration: none; }

/* 클릭시 레이어 */
.idDiv { cursor: pointer; }

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
<div class="header">
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
</div>
	<br>
	<!-- 게시판 제목 -->
	<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 700; font-size: 2em; background-color: #685D79;
		color: white;" id="boardType">
	</p>
	
<div class="bodyform" style="width: 75%; margin: auto;">
	<br><br>

	<div> <!-- 게시판 테이블 -->
		<!-- 옵션선택 -->
		<span style="font-size: 17px; color: #4d4d4d; float: left;">&#x2691; ${page.getTotal() } 개의 글</span>
		<div id="selectBox" style="float: right;">
			<select class="opt" id="cntPerPage" onchange="selChange()">
				<option value="5"
					<c:if test="${page.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${page.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${page.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${page.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</div> <!-- 옵션선택 끝 -->
		<br><br>
		
		<!-- 테이블 시작 -->
		<table class="table table-hover" style="font-size: 17px; width: 100%;">
			<thead>
				<tr>
					<th width="5%" scope="row">No.</th>
					<th width="63%">제목</th>
					<th width="12%">작성자</th>
					<th width="13%">작성일</th>
					<th width="7%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${boardList }">
					<tr>
						<th scope="row">${list.b_idx }</th>
						<td>
							<a href="#" onclick="to_detail(${list.b_idx})">${list.b_title }</a>
							<c:if test="${list.cnt != 0 }">
								<a href="#" onclick="to_detail(${list.b_idx})">[${list.cnt }]</a>
							</c:if>
						</td>
						<td>
							<div class="idDiv" userId="${list.id }">${list.id }</div>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.b_regdate }" /></td>
						<td>${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty boardList }">
					<tr>
						<td colspan="5" style="font-weight: 700;">조회된 게시물이 없습니다. 새로운 글을 작성해보세요!</td>
					</tr>
				</c:if>
			</tbody>
	
		</table> <!-- 테이블 끝 -->
		
		<!-- 글쓰기 -->
		<div class="write">
			<c:if test="${not empty usersVO }">
				<input class="button" type="button" value="글쓰기" id="write" onclick="write_go()">
			</c:if>
		</div>
		<br><br><br>
		<hr><br>
		
		<!-- 검색창 -->
		<div class="center">
			<form action="/TMS/searchList">
				<select class="opt" name="target">
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="tc">제목 & 내용</option>
					<option value="w">작성자</option>
				</select>
				<input class="textline" type="search" size="40" name="keyword" aria-label="Search">
				<button class="button" type="submit">검색</button>
				<input type="hidden" name="ct_idx" value="${boardList[0].ct_idx}">
				<input type="hidden" name="cntPerPage" value="${page.cntPerPage }">
			</form>
		</div> <!-- 검색창 끝 -->
		<br><br>
		
		<!-- 페이징 시작 -->
		<nav>
			<ul id="pagingList" class="pagination justify-content-center">
				<c:if test="${page.chkStartPage }">
					<li class="page_edge">
						<a class="p-n" href="/TMS/board?ct_idx=${ct_idx }&nowPage=1&cntPerPage=${page.cntPerPage}">〈</a>
					</li>
					<li class="page_edge">
						<a class="p-n" href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}">
						<span style="font-size: 0.5em;">…</span></a>
					</li>
				</c:if>
				<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
					<c:if test="${p == page.nowPage }">
						<li class="page_edge now">
							<a style="color: white;" href="/TMS/board?ct_idx=${ct_idx }&nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>
					<c:if test="${p != page.nowPage }">
						<li class="page_edge">
							<a href="/TMS/board?ct_idx=${ct_idx }&nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>
		
				</c:forEach>
				<c:if test="${page.chkEndPage }">
					<li class="page_edge">
						<a class="p-n" href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">
						<span style="font-size: 0.5em;">…</span></a>
					</li>
					<!--  -->
					<li class="page_edge">
						<a class="p-n" href="/TMS/board?ct_idx=${ct_idx }&nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}">〉</a></li>
					<!--  -->
				</c:if>
			</ul>
		</nav><!-- 페이징 끝 -->
	</div> <!-- 게시판 테이블 div 끝  -->

	<%-- 이건 뭔지 몰라서 안지웠음 =====================================================================================
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
	</div> <!-- 페이징 끝 -->
	이건 뭔지 몰라서 안지웠음 ===================================================================================== --%>
	<br><br><br>
</div> <!-- bodyform 끝 -->

<hr>
<!-- 허해서 넣은 풋터 -->
	<p class="center" style="font-size: 17px;">© turtlesmiracle</p><br><br>
<!-- 허해서 넣은 풋터 끝 -->

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
		<a id="sendMsg" href="#">쪽지 보내기</a><br>
		<a id="userProfile" href="#">회원 정보 보기</a><br>
		<a id="showWritten" href="#">작성글 보기</a><br>
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