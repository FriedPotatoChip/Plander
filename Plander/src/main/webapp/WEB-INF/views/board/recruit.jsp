<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/commons/head.jsp" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style>
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
	
	
	
	/* 클릭시 레이어 */
	.idDiv { cursor: pointer; }

	.popupLayer {
		position: absolute;
		display: none;
		background-color: #ffffff;
		border: solid 2px #d0d0d0;
		width: 150px;
		height: 120px;
		padding: 20px 10px 0 10px;
		font-size: 17px;
	}
	
	.popupLayer div {
		position: absolute;
		top: 0px;
		right: 5px;
		font-size: 17px;
	}
</style>
<script> 
	function selChange(){
		var cntPerPage = document.getElementById("cntPerPage").value;
		location.href= "/recruit?nowPage=${page.nowPage }&cntPerPage="+cntPerPage;
		
	}
	function to_detail(b_idx){
		var cntPerPage = document.getElementById("cntPerPage").value;
		location.href="/recruitDetail?idx="+b_idx+"&nowPage=${page.nowPage}&cntPerPage="+cntPerPage;
	}
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
	<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 700; font-size: 2em; background-color: #685D79;
		color: white;">
		모집 게시판
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
		</div>
		<br><br>
		
		<table class="table table-hover" style="font-size: 17px; width: 100%;">
			<thead>
				<tr>
					<th width="5%">No.</th>
					<th width="55%">제목</th>
					<th width="12%">작성자</th>
					<th width="13%">작성일</th>
					<th width="8%">모집여부</th>
					<th width="7%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${boardList }">
					<tr>
						<td>${list.rc_idx }</td>
						<td>
							<a href="#" onclick="to_detail(${list.rc_idx})">${list.rc_title }</a>
							<c:if test="${list.cnt != 0 }">
								<a href="#" onclick="to_detail(${list.rc_idx})">
								<span style='color: #D8737F;'>[${list.cnt }]</span></a>
							</c:if>
						</td>
						<td>
							<div class="idDiv" userId="${list.id }">${list.id }</div>
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${list.rc_regdate }" />
						</td>
						<td>
							<c:if test='${list.onOff eq "ON" }'>모집 중</c:if>
							<c:if test='${list.onOff eq "OFF" }'>모집 마감</c:if>
						</td>
						<td>${list.hit }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty boardList }">
					<tr>
						<td colspan="6" style="font-weight: 700;">조회된 게시물이 없습니다. 새로운 글을 작성해보세요!</td>
					</tr>
				</c:if>
			</tbody>
			<!-- 
			<tfoot>
				<tr>
					<td colspan="6">tfoot</td>
				</tr>
			</tfoot>
			 -->
		</table>
		
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
			<form action="/searchRecruitList">
				<!-- 검색창 -->
				<select class="opt" name="target">
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="tc">제목&내용</option>
					<option value="w">작성자</option>
				</select>
				<input class="textline" type="text" size="40" name="keyword">
				<input class="button" type="submit" value="검색">
				<input type="hidden" name="cntPerPage" value="${page.cntPerPage }">
			</form>
		</div> <!-- 검색창 끝 -->
		
		<br><br>
		<!-- 페이징 시작 -->
		<div id="paging">
		<nav>
			<ul id="pagingList" class="pagination justify-content-center">
				<c:if test="${page.chkStartPage }">
					<li class="page_edge">
						<a class="p-n" href="/recruit?nowPage=1&cntPerPage=${page.cntPerPage}">〈</a>
					</li>
					<li class="page_edge">
						<a class="p-n" href="/recruit?nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}">
						<span style="font-size: 0.5em;">…</span></a>
					</li>
				</c:if>
				<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
					<c:if test="${p == page.nowPage }">
						<li class="page_edge now">
							<a style="color: white;" href="/recruit?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>
					<c:if test="${p != page.nowPage }">
						<li class="page_edge">
							<a href="/recruit?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
						</li>
					</c:if>

				</c:forEach>
				<c:if test="${page.chkEndPage }">
					<li class="page_edge">
						<a class="p-n" href="/recruit?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">
						<span style="font-size: 0.5em;">…</span></a>
					</li>
					<li class="page_edge">
						<a class="p-n" href="/recruit?nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}">〉</a>
					</li>
				</c:if>
			</ul>
		</nav>
		</div> <!-- 페이징 끝 -->
	</div> <!-- 게시판 테이블 div 끝  -->
	<br><br><br>
</div> <!-- bodyform 끝 -->

<hr>
<!-- 허해서 넣은 풋터 -->
	<p class="center" style="font-size: 17px;">© turtlesmiracle</p><br><br>
<!-- 허해서 넣은 풋터 끝 -->

<script>
	function write_go(){
		location.href="/recruitWrite";
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
		<a id="sendMsg" href="#"><i class="far fa-envelope"></i>&nbsp;쪽지 보내기</a><br>
		<a id="userProfile" href="#"><i class="fas fa-user"></i>&nbsp;회원 정보 보기</a><br>
		<a id="showWritten" href="#"><i class="far fa-list-alt"></i>&nbsp;작성글 보기</a><br>
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
			$("#showWritten").attr("href", "/searchList?keyword="+userId+"&target=w&ct_idx=${ct_idx}")
			$("#sendMsg").click(function(){
				$(".popupLayer").hide();
				if ('${usersVO.id}' == ''){
					alert("로그인 후 이용 가능합니다.");
					return false;
				} 
				window.open("/sendMsg?recv_id="+userId, "쪽지 보내기", "width=500, height=600");
			});
			$("#userProfile").click(function(){
				$(".popupLayer").hide();
				if ('${usersVO.id}' == ''){
					alert("로그인 후 이용 가능합니다.");
					return false;
				} 
				window.open("/profileSummary?id="+userId, "회원 정보", "width=500, height=500");
			});
		})
	});
</script>
</body>
</html>