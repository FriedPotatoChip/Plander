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
	.hoverPointer:hover{ cursor: pointer; }
	#board, #comments { border: 1px solid black; }
	.comm { border: 1px solid blue; }
	.user { width: 30px; height: 30px; border-radius: 50%; }
</style>
<script>


$(document).ready(function(){
	window.category = ""; 
	if ('${board.ct_idx}' == 1){
		$("#boardType").html("공지사항");
		category = "공지사항";
	}else if ('${board.ct_idx}' == 2){
		$("#boardType").html("자유게시판");	
		category = "자유게시판";
	}else if ('${board.ct_idx}' == 3){
		$("#boardType").html("후기게시판");	
		category = "후기게시판";
	}else if ('${board.ct_idx}' == 4){
		category = "QNA";
	}
		$("#boardType").html(category);
	<!-- 댓글 페이징 -->
	paging(1);
	
	
	boardList(${nowPage});
	
	
});
	<!-- 상세글 하단에 글목록 출력 -->
	function boardList(nowPage){

		$.ajax({
			url: "/boardListAjax",
			type: 'get',
			dataType: "json",
			data: {'nowPage':nowPage, 'ct_idx':'${board.ct_idx}', 'cntPerPage':${cntPerPage}},
			success: function(list){
				
				var html = "";
				html += "<b>"+ category+ "</b><hr>";
				html += "<table>"
				$.each(list,function(index, value){
					if (index == 0){ 
						window.chkEndPage = value.b_title;
						window.chkStartPage = value.b_content;
					} else{
						var regdate = new Date(value.b_regdate);
						var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
						html += "<tr>";
						html += "<td width='80%'>";
						if ('${board.b_idx}' == value.b_idx){
							html += "<b>";
						}
						html += "<a href='/TMS/boardDetail?idx="+value.b_idx+"&nowPage=${nowPage}&cntPerPage=${cntPerPage}'>";
						html += value.b_title;
						if (value.cnt != 0){
							html += "["+value.cnt+"]";
						} 
						html += "</a>";
						if ('${board.b_idx}' == value.b_idx){
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
				
				
				$("#boardListAjax").html(html);
				
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
	
	<div id="board">
		<a href="/TMS/board?ct_idx=${board.ct_idx }&nowPage=${nowPage }&cntPerPage=${cntPerPage}" style="font-size: 0.8em;"><strong id="boardType"></strong></a>
		<h3>${board.b_title }</h3>
		<div>
			<c:if test='${empty board.user_profileImagePath }'>
				<img class="user" src="/resources/images/users.png" alt="user"/>
			</c:if>
			<c:if test='${not empty board.user_profileImagePath }'>
				<img class="user" src="${board.user_profileImagePath }" alt="user"/>
			</c:if> 
			<span>${board.id }</span>
		</div> 
		<p><fmt:formatDate value="${board.b_regdate }" pattern="yyyy.MM.dd HH:mm"/></p>
		<hr>
		<div id="content">${board.b_content }</div>
		<br><br><br>
		<c:if test="${(sessionScope.usersVO.id == board.id) || sessionScope.usersVO.rank == 1 }">
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
				<input type="hidden" value="${board.b_idx }" name="b_idx">
				<input type="button" onclick="registerComm()" value="댓글단다">
			</form>
		</div>
	</c:if>
	
	<br>
	<br>
	<br>
	<!-- 글 목록 보여주기 (5개씩만) -->
	<div id="boardListAjax">
	</div>	
	
	
<script>
	/* 글 삭제 */
	function deleteRec(){
		
		var confirm = window.confirm("게시글을 정말 삭제하시겠습니까?");
		
		if (confirm){
			location.href="/deleteBoard?b_idx=${board.b_idx}&ct_idx=${board.ct_idx}";	
		}
		
	}
	
	/* 글 수정 */
	function modify(){
		
		var confirm = window.confirm("게시글을 수정하시겠습니까?");
		
		if (confirm){
			location.href="/TMS/modifyBoard?b_idx=${board.b_idx}";
		}
	}
	
	/* 댓글 출력 ajax */
	function paging(nowPage){
		$.ajax({
			type: 'get',
			url: '/commBoardPaging',
			dataType: 'json',
			data: {'nowPage':nowPage, 'b_idx':'${board.b_idx}'},
			success: function(page){
				console.log("페이징 처리");
				window.startPage = page.startPage;
				window.endPage = page.endPage;
				window.nowPage = page.nowPage;
				window.chkStartPage = page.chkStartPage;
				window.chkEndPage = page.chkEndPage;
				window.start = page.start;
				window.end = page.end;
				
				if (endPage != 1){
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
				}
				
				commAjax();
			}, error: function(){
				console.log("페이징 처리 실패");
			}
		})
	}

	function commAjax(){
		$.ajax({
			type: 'get',
			url: '/commentBoardList',
			dataType: 'json',
			data: {'b_idx':'${board.b_idx}', 'start':start, 'end':end},
			success: function(data){
				console.log(data);
				var html = "<hr>"; 
				
				var arrC_idx = new Array();
				var arrId = new Array();
				
				$.each(data,function(index, value){ 
					var regdate = new Date(value.c_regdate);
					var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
				    if (value.level == 1){
					    html += "<div class='comm comment' id='comm"+value.c_idx+"'>";
						html += "<div class='comm_id'>";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>";
						} else {
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
						} else {
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
			url: '/registerBoardComm',
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
		window.clickCnt = 0;
	/* 대댓글 인풋창 추가 */
	function replyBtn(data){
		var id = "comm" + data;
		clickCnt++;
		$(".replyComm").css("display", "none");
		var html = "<div class='replyComm'>";
		html += "<form name='replyCommAjax"+clickCnt+"'>";
		html += "&rdsh; <strong>댓글 작성</strong><br>";
		html += "<textarea rows='8' cols='80' name='c_content'></textarea>";
		html += "<input type='hidden' value='${usersVO.id }' name='id'>";
		html += "<input type='hidden' value='${board.b_idx }' name='b_idx'>";
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
			url: '/registerBoardReplyComm',
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
				url: "/deleteBoardComm",
				type: "get",
				data: {'c_idx':c_idx, 'b_idx':'${board.b_idx}'},
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
			url: '/modifyBoardComm',
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
</script>
</body>
</html>