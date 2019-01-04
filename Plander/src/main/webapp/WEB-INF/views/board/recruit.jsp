<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/commons/head.jsp" />
<meta charset="UTF-8">
<style> 
	thead, tfoot { background-color: violet; } 
	table { text-align: center; }
	#pagingList { list-style: none; }
	#pagingList li { float: left; }
	.marginLi { margin-left: 5px; margin-right: 5px; }	
	a { text-decoration: none; }
	.now { background-color: orange; }
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
		<option  value="5" <c:if test="${page.cntPerPage == 5}">selected</c:if>>5</option>
		<option value="10" <c:if test="${page.cntPerPage == 10}">selected</c:if>>10</option>
		<option value="15" <c:if test="${page.cntPerPage == 15}">selected</c:if>>15</option>
		<option value="20" <c:if test="${page.cntPerPage == 20}">selected</c:if>>20</option>
	</select>
	<table border="1">
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${boardList }">
				<tr>
					<td width="10%">
						${list.rc_idx }
					</td>
					<td width="60%">
						<a href="#" onclick="to_detail(${list.rc_idx})">${list.rc_title }</a>
						<c:if test="${list.cnt != 0 }">
							<a href="#	" onclick="to_detail(${list.rc_idx})">[${list.cnt }]</a>
						</c:if>
					</td>
					<td>
						${list.id }
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${list.rc_regdate }" />
					</td>
					<td>
						${list.hit }
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr> 
				<td colspan="5">tfoot</td>
			</tr>
		</tfoot>
	</table>
	
	<!--  -->
	<form action="/TMS/searchRecruitList">
		<input type="text" name="keyword">	<!-- 검색창 -->
		<select name="target">
			<option value="t">제목</option>
			<option value="c">내용</option>
			<option value="tc">제목 & 내용</option>
			<option value="w">작성자</option>
		</select>
		<input type="submit" value="검색">
		<input type="hidden" name="cntPerPage" value="${page.cntPerPage }">
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
		<li><a href="/TMS/recruit?nowPage=1&cntPerPage=${page.cntPerPage}"><button>&lt;&lt;</button></a></li>	
		<li><a href="/TMS/recruit?nowPage=${page.startPage-1 }&cntPerPage=${page.cntPerPage}"><button>&lt;</button></a></li>	
		</c:if>		
		<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
			<c:if test="${p == page.nowPage }">
				<li>
					<a class="now marginLi" href="/TMS/recruit?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</li>
			</c:if>
			<c:if test="${p != page.nowPage }">
				<li>
					<a class="marginLi" href="/TMS/recruit?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</li>
			</c:if>
			
		</c:forEach>
		<c:if test="${page.chkEndPage }">
			<li><a href="/TMS/recruit?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}"><button>&gt;</button></a></li>
			<li><a href="/TMS/recruit?nowPage=${page.lastPage }&cntPerPage=${page.cntPerPage}"><button>&gt;&gt;</button></a></li>
		</c:if>
	</ul>
	</div>
	<!-- 페이징 끝 -->
	</div>
	
	
	
	
<script>
	function write_go(){
		location.href="/TMS/recruitWrite";
	}
</script>	
	
</body>
</html>