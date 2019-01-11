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
	h3{ margin-top: 0px; }
	a {text-decoration: none;}
	.c-comment { padding-left: 52px; 	}

	ul, ol { list-style: none; }
	#pagingList li { float: left; }
	.marginLi { margin-left: 5px; margin-right: 5px; }	
	.now { background-color: orange; }
	.commDate { font-size: 0.75em; color: gray;}
	.user { width: 30px; height: 30px; border-radius: 50%; }
</style>
<script>
/* 신청하기, 신청 취소를 위한 확인값 설정 */
	<c:if test="${empty apply}">
		<c:set var="chkId" value="true" />
	</c:if>
	<c:set var="flag" value="true" />
	<c:forEach var="apply" items="${apply}">
		<c:if test="${flag}" >
			<c:if test="${apply.id != usersVO.id}">
				<c:set var="chkId" value="true" />
			</c:if>
			<c:if test="${apply.id == usersVO.id}">
				<c:set var="chkId" value="false" />
				<c:set var="flag" value="false" />
			</c:if>
		</c:if>
	</c:forEach>
/* 확인값 설정 끝 */



$(document).ready(function(){

	<!-- 신청 버튼 시작 -->
	<c:if test="${usersVO.id != rc_board.id && chkId }">
		<c:if test="${rc_board.cur_mem < rc_board.max_mem }">
			$("#hideApply").css("display", "block");
		</c:if>
	</c:if>
	<c:if test="${not chkId && usersVO.id != rc_board.id }">
		$("#hideCancel").css("display", "block");
	</c:if> 
		<!-- 신청 버튼 끝 -->
	
	<!-- 댓글 페이징 -->
	paging(1);
	<!-- 목록 출력 ajax -->
	boardList(${nowPage});

});
<!-- 상세글 하단에 글목록 출력 -->
function boardList(nowPage){

	$.ajax({
		url: "/recruitListAjax",
		type: 'get',
		dataType: "json",
		data: {'nowPage':nowPage, 'cntPerPage':${cntPerPage}},
		success: function(list){
			
			var html = "";
			html += "<b>모집게시판</b><hr>";
			html += "<table>"
			$.each(list,function(index, value){
				if (index == 0){ 
					window.chkEndPage = value.rc_title;
					window.chkStartPage = value.rc_content;
				} else{
					var regdate = new Date(value.rc_regdate);
					var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
					html += "<tr>";
					html += "<td width='80%'>";
					if ('${board.b_idx}' == value.rc_idx){
						html += "<b>";
					}
					html += "<a href='/TMS/recruitDetail?idx="+value.rc_idx+"&nowPage=${nowPage}&cntPerPage=${cntPerPage}'>";
					html += value.rc_title;
					if (value.cnt != 0){
						html += "["+value.cnt+"]";
					} 
					html += "</a>";
					if ('${board.rc_idx}' == value.rc_idx){
						html += "</b>";
					}
					html += "</td>";
					html += "<td>"; 
					html += date; 					
					html += "</td>";
					html += "</tr>";
				}
			})
			html += "</table>";
			html += "<hr>";
			if (chkStartPage == "true"){
				html += "<a class='hoverPointer' onclick='boardList("+(nowPage - 1)+")'>&lt;이전</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			}
			if (chkEndPage == "true"){
				html += "<a class='hoverPointer' onclick='boardList("+(nowPage + 1)+")'>다음&gt;</a>";
			}
			
			
			$("#recruitListAjax").html(html);
			
		}, error: function(error){
			console.log("error발생: "+ error);
		}
	});
	
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
	
 	<h3>모집글 상세조회 페이지</h3>
	
	<div>
		<a href="/TMS/recruit?nowPage=${nowPage }&cntPerPage=${cntPerPage}" style="font-size: 0.8em;"><strong>모집 게시판</strong></a>
		<h3>${rc_board.rc_title }</h3>
		<div>
			<c:if test='${empty rc_board.user_profileImagePath }'>
				<img class="user" src="/resources/images/users.png" alt="user"/>
			</c:if>
			<c:if test='${not empty rc_board.user_profileImagePath }'>
				<img class="user" src="${rc_board.user_profileImagePath }" alt="user"/>
			</c:if>
			<span>${rc_board.id }</span> 
		</div>
		<p><fmt:formatDate value="${rc_board.rc_regdate }" pattern="yyyy.MM.dd HH:mm"/></p>
		<hr>
		<div id="content">${rc_board.rc_content }</div>
		<br><br><br>
	</div>	
	
	<div>
		<!-- 현재원 / 모집정원 -->
		<p><span id="cur_mem">${rc_board.cur_mem }</span> / <span id="max_mem">${rc_board.max_mem }</span></p>
		
		<c:if test="${rc_board.onOff eq 'ON' }">
			<c:if test="${usersVO.id == rc_board.id && rc_board.cur_mem == rc_board.max_mem}">
				<button onclick="endRecruit()">모집 마감</button><br> 	
			</c:if>
		</c:if>
		<!-- 신청 버튼 시작 -->
		<button class="appBtn" id="hideApply" style="display:none;" onclick="apply()">신청하기</button>
		<button class="appBtn" id="hideCancel" style="display:none;" onclick="applyCancel()">신청취소</button>
		<!-- 신청 버튼 끝 -->
		
		<!-- 수정/ 삭제 버튼 -->
		<c:if test="${(sessionScope.usersVO.id == rc_board.id) || sessionScope.usersVO.rank == 1 }">
			<button onclick="modify()">수정하기</button>
			<button onclick="deleteRec()">삭제하기</button>
		</c:if>
		
	</div>
	<!-- 댓글 출력 -->
	<div id="comments">
	</div>
	
	<!-- 페이징 시작 -->
	<div id="paging">
	<ul id="pagingList">

	</ul>
	</div>
	<!-- 페이징 끝 -->
	<br>
	
	<!-- 댓글 작성 -->
	<c:if test="${not empty usersVO }">
		<div>
			<form name="commentAjax">
				<c:if test='${empty usersVO.user_profileImagePath }'>
					<img class="user" src="/resources/images/users.png" alt="user"/>
				</c:if>
				<c:if test='${not empty usersVO.user_profileImagePath }'>
					<img class="user" src="${usersVO.user_profileImagePath }" alt="user"/>
				</c:if>
				<input type="text" value="${usersVO.id }" name="id" readonly><br>
				<textarea rows="8" cols="80" name="c_content" id="c_content" required></textarea>
				<input type="hidden" value="${rc_board.rc_idx }" name="rc_idx">
				<input type="button" onclick="registerComm()" value="댓글단다">
			</form>
		</div>
	</c:if>
	<br>
	<br>
	<br>
	
	<!-- 글 목록 보여주기 (5개씩만) -->
	<div id="recruitListAjax">
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
				var html = "<hr>"; 
				
				var arrC_idx = new Array();
				var arrId = new Array();
				
				$.each(data,function(index, value){
					console.log("패스: "+ value.user_profileImagePath);
					var regdate = new Date(value.c_regdate);
					var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
				    if (value.level == 1){
					    html += "<div class='comm comment' id='comm"+value.c_idx+"'>";
						html += "<div class='comm_id'>";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>";
						}else {
							html += "<img class='user' src='"+value.user_profileImagePath+"' alt='user'/>";
						}
						html += "<strong id='' class=''>"+value.id+"</strong></div>";
						html += "<div>"+value.c_content+"</div>";
						arrC_idx.push(value.c_idx);
						arrId.push(value.id);
				    } else {
				    	html += "<div class='comm c-comment' id='comm"+value.c_idx+"'>";
				    	html += "<div>&rdsh; ";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>";
						}else {
							html += "<img class='user' src='"+value.user_profileImagePath+"' alt='user'/>";
						}
				    	html += "<strong id=''>"+value.id+"</strong></div>";
				    	html += "<div><strong class='"+value.rp_idx+"'></strong>"+value.c_content+"</div>";
						arrC_idx.push(value.c_idx);
						arrId.push(value.id);
				    }
			    	html += "<div class='commDate'>"+date+"</div>";
					html += "<div><button onclick='replyBtn("+value.c_idx+")')'>답글</button>";
				    if (value.id == '${sessionScope.usersVO.id}' && value.del == 0){
				    	html += "<button onclick='modifyComm(&#39;"+value.c_content+"&#39;, "+value.c_idx+")'>수정</button>";
				    	html += "<button onclick='deleteComm("+value.c_idx+")'>삭제</button>";
				    	html += "</div>";
				    }
				    	html += "</div></div>";
				});
		
				$("#comments").html(html);
				console.log("arrC_idx: "+ arrC_idx); 
				console.log("arrId: "+ arrId);
				for (var i in arrC_idx){
					$("."+ arrC_idx[i]).html("["+arrId[i]+"]");
					console.log(arrId[i]); 
				}
			}, error: function(){
				alert("댓글 로딩 실패");
			}
			
		});
	}

	/* 댓글 등록 ajax */
	function registerComm(){
		var c_content = document.getElementById("c_content");
		if (c_content.value == ""){
			alert("내용을 입력해주세요");
			c_content.focus();
			return false;
		}
		var commentData = $("form[name=commentAjax]").serialize();
		
		$.ajax({
			url: '/registerComm',
			type: 'post',
			dataType: 'text',
			data: commentData,
			success: function(data){
				alert("댓글을 남겼습니다");
				$("#c_content").val("");
				paging(nowPage);
			}, error: function(){
				alert("댓글 달기 실패");
			}
		});
	}
		window.clickCnt = 0;
	/* 대댓글 인풋창 추가 */
	function replyBtn(data){
		var id = "comm" + data;
		clickCnt++;
		$(".replyComm").css("display", "none");
		var html = "<div class='replyComm c-comment'>";
		html += "<form name='replyCommAjax"+clickCnt+"'>";
		html += "<span style='font-family: 굴림;'>&rdsh;</span> <strong>댓글 작성</strong><br>";
		html += "<textarea rows='4' cols='80' name='c_content'></textarea>";
		html += "<input type='hidden' value='${usersVO.id }' name='id'>";
		html += "<input type='hidden' value='${rc_board.rc_idx }' name='rc_idx'>";
		html += "<input type='hidden' value='"+data+"' name='rp_idx'>";
		html += "<input type='button' onclick='registerReplyComm()' value='대댓단다'>";
		html += "<input type='button' onclick='cancelModify()' value='취소'>"; 
		html += "</form>";
		$("#"+ id).append(html);
	}
	/* 대댓글 등록 ajax */
	function registerReplyComm(){
		if ($("form[name='replyCommAjax"+clickCnt+"'] textarea[name='c_content']").val() == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
		var commentData = $("form[name='replyCommAjax"+clickCnt+"']").serialize();
		document.getElementById("c_content").value = "";
		$.ajax({
			url: '/registerReplyComm',
			type: 'post',
			dataType: 'text',
			data: commentData,
			success: function(data){
				alert("댓글을 남겼습니다");
				paging(nowPage);
			}, error: function(){
				alert("댓글 달기 실패");
			}
		});
	}
	/* 댓글 삭제 */
	function deleteComm(c_idx){
		var confirm = window.confirm("댓글을 정말 삭제하시겠습니까?");
		if (confirm){
			$.ajax({
				url: "/deleteComm",
				type: "get",
				data: {'c_idx':c_idx, 'rc_idx':'${rc_board.rc_idx}'},
				dataType: "text",
				success: function(result){
					if (result == 'success'){
						alert("댓글을 삭제하였습니다.");
						paging(nowPage);
					} else {
						alert("댓글 삭제에 실패하였습니다.\n관리자에게 문의해주세요.");
					}
				}, error: function(error){
					alert("댓글 삭제 ajax 실패");
				}
			})
		}
	}
	
	
	/* 댓글 수정 인풋창 추가 */
	function modifyComm(c_content, c_idx){
		console.log(c_content);
		console.log(c_idx);
		var id = 'comm'+ c_idx; 
		clickCnt++;
		$(".replyComm").css("display", "none");
		var html = "<div class='replyComm'>";
		html += "<form name='updateCommAjax"+clickCnt+"'>";
		html += "&rdsh; <strong>댓글 수정</strong><br>";
		html += "<textarea rows='8' cols='80' name='c_content'>"+c_content+"</textarea>";
		html += "<input type='hidden' value='"+c_idx+"' name='c_idx'>";
		html += "<input type='button' onclick='modifyCommAjax()' value='수정'>";
		html += "<input type='button' onclick='cancelModify()' value='취소'>"; 
		html += "</form>";
		$("#"+ id).append(html);
	}
	/* 댓글 수정 취소 */
	function cancelModify(){
		$(".replyComm").css("display", "none");
	}
	
	/* 댓글 수정 ajax */
	function modifyCommAjax(){
		var commentData = $("form[name=updateCommAjax"+clickCnt+"]").serialize();
		console.log(commentData);
		
		$.ajax({
			url: '/modifyComm',
			type: 'post',
			dataType: 'text',
			data: commentData,
			success: function(result){
				if (result == 'success'){
					alert("댓글 수정을 완료했습니다");
				}else if (result == 'fail'){
					alert("댓글 수정에 실패하였습니다.\n관리자에게 문의하세요.");
				}
				paging(nowPage);
			}, error: function(){
				alert("댓글 달기 실패");
			}
		});
	}
	/* 모집마감 클릭시 쿠폰 발행 */
	function endRecruit(){
		var confirm = window.confirm("모집을 마감하면 다시 되돌릴 수 없습니다. \n모집마감을 진행하시겠습니까?");
		if (!confirm){
			return false;
		}
		$.ajax({
			url: "/endRecruit",
			type: "get", 
			data: {"rc_idx":'${rc_board.rc_idx}' ,"id":'${usersVO.id}'},
			dataType: "text",
			success: function(result){
				if (result == 'success'){
					alert("모집을 성공적으로 마감했습니다.");
					window.location.reload();
				} else if (result == 'fail'){
					alert("모집을 마감하는데 실패했습니다. \n관리자에게 문의 바랍니다.");
				}
			}, error: function(error){
					alert("모집을 마감하는데 실패했습니다. \n관리자에게 문의 바랍니다.");
			}
		})
	}
	

</script>
</body>
</html>