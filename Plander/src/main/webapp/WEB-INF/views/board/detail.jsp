<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	h3{ margin-top: 0px; }
	a {text-decoration: none;}
	.c-comment { padding: 52px; }

	ul, ol { list-style: none; }
	#pagingList li { float: left; }
	.marginLi { margin-left: 5px; margin-right: 5px; }	
	.now { background-color: orange; }
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
/* 신청하기, 신청 취소를 위한 확인값 설정 */
	<c:if test="${empty apply}">
		<c:set var="chkId" value="true" />
	</c:if>
	<c:forEach var="apply" items="${apply}">
		<c:if test="${apply.id != usersVO.id}">
			<c:set var="chkId" value="true" />
		</c:if>
		<c:if test="${apply.id == usersVO.id}">
			<c:set var="chkId" value="false" />
		</c:if>
	</c:forEach>
/* 확인값 설정 끝 */

/* 댓글 출력 ajax */

function paging(nowPage){
	$.ajax({
		type: 'get',
		url: '/commPaging',
		dataType: 'json',
		data: {'nowPage':nowPage, 'rc_idx':'${rc_board.rc_idx}'},
		success: function(page){
			console.log("페이징 처리");
			window.startPage = page.startPage;
			window.endPage = page.endPage;
			window.nowPage = page.nowPage;
			window.chkStartPage = page.chkStartPage;
			window.chkEndPage = page.chkEndPage;
			window.start = page.start;
			window.end = page.end;
			
			var html = "";
			
			if (chkStartPage){
				html += "<li><a href='#' onclick='paging("+startPage-1+")'><button>&lt;</button></a></li>"
			}
			for (var i = startPage; i <= endPage; i++){
				if (startPage == 1 && endPage == 1){
					html += "";
				} else if (i == nowPage){
					html += "<li>";
					html += "<a class='now marginLi' href='#'>"+i+"</a>";
					html += "</li>";					
				} else if (i != nowPage){
					html += "<li>";
					html += "<a class='marginLi' href='#' onclick='paging("+i+")'>"+i+"</a>";
					html += "</li>";
				}
			}
			if (chkEndPage){
				html += "<li><a href='#'onclick='paging("+endPage+1+")'><button>&gt;</button></a></li>";
			}
			
			$("#pagingList").html(html);
			
			
			
			
			
			
			
			
			commAjax();
		}, error: function(){
			console.log("페이징 처리 실패");
		}
	})
}
function commAjax(){
	$.ajax({
		type: 'get',
		url: '/commentList',
		dataType: 'json',
		data: {'rc_idx':'${rc_board.rc_idx}', 'start':start, 'end':end},
		success: function(data){
			console.log(data);
			$.each(data,function(index, value){
			    console.log('My array has at position ' + index + ', this value: ' + value.level);
			    
			    
			    
			    
			    
			    
			    
			});
		}, error: function(){
			alert("댓글 로딩 실패");
		}
		
	});
}

/* 댓글 등록 ajax */
function registerComm(){
	var commentData = $("form[name=commentAjax]").serialize();
	document.getElementById("c_content").value = "";
	
	$.ajax({
		url: '/registerComm',
		type: 'post',
		dataType: 'text',
		data: commentData,
		success: function(data){
			alert("댓글을 남겼습니다");
		}, error: function(){
			alert("댓글 달기 실패");
		}
	});
}
$(document).ready(function(){
	paging(1);

});
</script>
</head>
<body> 
	
	<h3>모집글 상세조회 페이지</h3>
	
	<div>
		<a href="/TMS/recruit" style="font-size: 0.8em;"><strong>모집 게시판</strong></a>
		<h3>${rc_board.rc_title }</h3>
		<a href="#">${rc_board.id }</a> 
		<p><fmt:formatDate value="${rc_board.rc_regdate }" pattern="yyyy.MM.dd HH:mm"/></p>
		<hr>
		<div id="content">${rc_board.rc_content }</div>
		<br><br><br>
	</div>	
	
	<div>
		<!-- 현재원 / 모집정원 -->
		<p><span id="cur_mem">${rc_board.cur_mem }</span> / <span id="max_mem">${rc_board.max_mem }</span></p>
		<!-- 신청하기 버튼 시작 -->
		<c:if test="${usersVO.id != rc_board.id && chkId }">
			<c:if test="${rc_board.cur_mem < rc_board.max_mem }">
				<button class="appBtn" id="apply" onclick="apply()">신청하기</button>
			</c:if>
		</c:if>
			<button class="appBtn" id="hideApply" style="display:none;" onclick="apply()">신청하기</button>
		<!-- 신청하기 버튼 끝 -->
		
		<!-- 신청취소 버튼 시작 -->
		<c:if test="${not chkId && usersVO.id != rc_board.id }">
			<button class="appBtn" onclick="applyCancel()">신청취소</button>
		</c:if>
			<button class="appBtn" id="hideCancel" style="display:none;" onclick="applyCancel()">신청취소</button>
		<!-- 신청취소 버튼 끝 -->
		
		
		<c:if test="${sessionScope.usersVO.id == rc_board.id }">
			<button onclick="modify()">수정하기</button>
			<button onclick="deleteRec()">삭제하기</button>
		</c:if>
		
	</div>
	<div>
		<h4>댓글</h4>
		<hr>
		<div class="comm comment">
			<div><strong>작성자</strong></div>
			<div>댓글 내용</div>
			<div>작성일</div>
			<div><button>답글</button></div>
		</div>
		
		<div class="comm c-comment">
		
			<div>&rdsh; <strong>작성자</strong></div>
			<div>댓글 내용</div>
			<div>작성일</div>
			<div><button>답글</button></div>
		</div>
	</div>
	
	<!-- 페이징 시작 -->
	<div id="paging">
	<ul id="pagingList">

	</ul>
	</div>
	<!-- 페이징 끝 -->
	<br>
	
	<!-- 댓글 작성 -->
	<div>
		<form name="commentAjax">
			<input type="text" value="${usersVO.id }" name="id" readonly><br>
			<textarea rows="8" cols="80" name="c_content" id="c_content" required></textarea>
			<input type="hidden" value="${rc_board.rc_idx }" name="rc_idx">
			<input type="button" onclick="registerComm()" value="댓글단다">
		</form>
	</div>
	
<script>
	/* 신청하기 */
	function apply(){
	      $.ajax({
	          type: "get",
	          url: '/apply',
	          data: {'id':'${usersVO.id}', 'rc_idx':'${rc_board.rc_idx}'},
	          dataType: 'text',
	          success: function(result) {
		        	  var cur_mem = document.getElementById("cur_mem").innerHTML;
		        	  var max_mem = document.getElementById("max_mem").innerHTML;
	        	  if (result == 'success'){
	        		  cur_mem = cur_mem * 1;
	        		  cur_mem += 1;
	        		  $("#cur_mem").html(cur_mem);
	        		  
	        		  $(".appBtn").css("display", "none");
	        		  $("#hideCancel").css("display", "block");
	        		  
	        	  } else if(result == 'fail'){
	        		  alert("신청하기에 실패하였습니다.\n관리자에게 문의해주세요.")
	        	  }
			  }, error: function (){
	        		  alert("신청하기에 실패하였습니다.\n관리자에게 문의해주세요.")
			  }
	        });
	}
	
	/* 신청 취소 */
	function applyCancel(){
	      $.ajax({
	          type: "get",
	          url: '/applyCancel',
	          data: {'id':'${usersVO.id}', 'rc_idx':'${rc_board.rc_idx}'},
	          dataType: 'text',
	          success: function(result) {
	        	  var cur_mem = document.getElementById("cur_mem").innerHTML;
	        	  var max_mem = document.getElementById("max_mem").innerHTML;
        	  if (result == 'success'){
        		  cur_mem = cur_mem * 1;
        		  cur_mem -= 1;
        		  $("#cur_mem").html(cur_mem);
        		  
        		  $(".appBtn").css("display", "none");
        		  $("#hideApply").css("display", "block");
        		  
        	  } else if(result == 'fail'){
        		  alert("신청하기에 실패하였습니다.\n관리자에게 문의해주세요.")
        	  }
			  }, error: function (){
				  alert("fail");
        		  alert("신청하기에 실패하였습니다.\n관리자에게 문의해주세요.")
			  }
	        });
	}
	
	/* 글 삭제 */
	function deleteRec(){
		
		var confirm = window.confirm("게시글을 정말 삭제하시겠습니까?");
		
		if (confirm){
			location.href="/deleteRec?rc_idx=${rc_board.rc_idx}";	
		}
		
	}
	
	/* 글 수정 */
	function modify(){
		
		var confirm = window.confirm("게시글을 수정하시겠습니까?");
		
		if (confirm){
			location.href="/TMS/modifyRec?rc_idx=${rc_board.rc_idx}";
		}
	}
</script>
</body>
</html>