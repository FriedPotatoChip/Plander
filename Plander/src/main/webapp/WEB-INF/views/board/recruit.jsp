<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style> 
	thead, tfoot { background-color: violet; } 
	table { text-align: center; }
	#paging { background-color: aqua; width: 100%; height: 30px; border: 1px; }
</style>  	
</head>
<body>
	
	<h3>모집 게시판임</h3>
	
	<div>
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
						<a href="/TMS/detail?idx=${list.rc_idx }">${list.rc_title }</a>
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
	
	<input type="text" name="keyword">	<!-- 검색창 -->
	<select name="target">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="title_content">제목 & 내용</option>
	</select>
	<br>
	<input type="button" value="글쓰기" id="write" onclick="write_go()">
	<br> 
	<div id="paging">페이징</div>
	</div>
	
	
	
	
<script>
	function write_go(){
		location.href="/TMS/recruitWrite";
	}
</script>	
	
</body>
</html>