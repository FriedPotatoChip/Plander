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
	a { text-decoration: none; color: #4d4d4d; }
	a:hover { color: #4d4d4d; }
	.center { text-align: center; }
	
	/* 상세보기 페이지 버튼 */
	.btnOpt {
		padding: 3px 8px;
		background-color: white;
		border: 1px solid #ced4da;
		color: dimgray;
		font-size: 0.85em;
	}
	.btnOpt:hover {
		padding: 3px 8px;
		background-color: white;
		border: 1px solid #ced4da;
		color: black;
	}
	/* 상세보기 버튼 끝 */
	
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
	.idBox { border: 1px; border-radius: 3px; }
	.hoverPointer:hover { cursor: pointer; }
	
	.c-comment { padding-left: 52px; 	}
	.commDate { font-size: 0.75em; color: gray;}
	.user { width: 30px; height: 30px; border-radius: 50%; }
	
	.comm {
		border-bottom: 1px solid #e6e6e6;
		padding-bottom: 10px;
		padding-top: 10px;
	}
	
	ul, ol { list-style: none; }
	
	/* 클릭시 레이어 */	
	.idDiv { cursor: pointer; display: inline-block; }
	.popupLayer {
		position: absolute;
		display: none;
		background-color: #ffffff;
		border: solid 2px #d0d0d0;
		width: 130px;
		height: 120px;
		padding: 10px;
		padding-top: 18px; padding-left: 15px;
	}
	.popupLayer div {
		position: absolute;
		top: 0px;
		right: 5px
	}
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
			html += "<p style='font-weight: 700;'><a href='/recruit?nowPage=${nowPage }&cntPerPage=${cntPerPage}'>모집 게시판</a> 카테고리 글</p><hr>";
			html += "<table width='100%'>";
			$.each(list,function(index, value){
				if (index == 0){ 
					window.chkEndPage = value.rc_title;
					window.chkStartPage = value.rc_content;
				} else{
					var regdate = new Date(value.rc_regdate);
					var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
					var day = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate();
					html += "<tr>";
					html += "<td width='80%'>";
						if ('${board.b_idx}' == value.rc_idx){
							html += "<b>";
						}
					html += "<a style='font-size: 0.9rem;' href='/recruitDetail?idx="+value.rc_idx+"&nowPage=${nowPage}&cntPerPage=${cntPerPage}'>";
					html += value.rc_title;
						if (value.cnt != 0){
							html += "<span style='color: #D8737F;'>["+value.cnt+"]</span>";
						} 
					html += "</a>";
						if ('${board.rc_idx}' == value.rc_idx){
							html += "</b>";
						}
					html += "</td>";
					html += "<td width='20%' style='text-align: right; font-size: 0.9rem;'>"; 
					html += day;
					html += "</td>";
					html += "</tr>";
				}
			})
			html += "</table>";
			html += "<hr>";
			html += "<div class='center'>";
				if (chkStartPage == "true"){
					html += "<a class='hoverPointer' style='font-size: 0.85rem;' onclick='boardList("+(nowPage - 1)+")'>〈&nbsp;이전</a>&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				if (chkEndPage == "true"){
					html += "<a class='hoverPointer' style='font-size: 0.85rem;' onclick='boardList("+(nowPage + 1)+")'>다음&nbsp;〉</a>";
				}
			html += "<div>";
				
			$("#recruitListAjax").html(html);
			
		}, error: function(error){
			console.log("error발생: "+ error);
		}
	});
	
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
	</div> <!-- 헤더 끝 -->
	<br>
	
	<div class="bodyform" style="width: 55%; margin: auto;">
		<div>
			<br>
			<!-- 요기 글목록 한번 더 출력 =============================================================== -->
			<!-- 글 목록 보여주기 (5개씩만) -->
			<!-- 헤더 아래 글목록 끝 -->
			
			<h4>${rc_board.rc_title }</h4>
			<div class='idDiv' userId='${rc_board.id }'>
				<c:if test='${empty rc_board.user_profileImagePath }'>
					<img class="user" src="/resources/images/users.png" alt="user"/>
				</c:if>
				<c:if test='${not empty rc_board.user_profileImagePath }'>
					<img class="user" src="${rc_board.user_profileImagePath }" alt="user"/>
				</c:if>
				<span>${rc_board.id }</span>&nbsp;&nbsp;&nbsp;
				<span style="font-size: 0.85rem;"><fmt:formatDate value="${rc_board.rc_regdate }" pattern="yyyy.MM.dd HH:mm"/></span>
			</div>
			<hr>
			
			<div id="content">${rc_board.rc_content }</div>
			<br><br><br>
		</div>
		
		<div>
			<span id="cur_mem">${rc_board.cur_mem }</span> / <span id="max_mem">${rc_board.max_mem }</span>
			&nbsp;&nbsp;
			<!-- 현재원 / 모집정원 -->
			
			<c:if test="${rc_board.onOff eq 'ON' }">
				<c:if test="${usersVO.id == rc_board.id && rc_board.cur_mem == rc_board.max_mem}">
					<button class="btnOpt" onclick="endRecruit()">모집 마감</button>
				</c:if>
			</c:if>
			
			<!-- 신청 버튼 시작 -->
			<button class="appBtn btnOpt" id="hideApply" style="display:none;" onclick="apply()">신청하기</button>
			<button class="appBtn btnOpt" id="hideCancel" style="display:none;" onclick="applyCancel()">신청취소</button>
			<!-- 신청 버튼 끝 -->
			
		</div> <!-- 모집인원 버튼 끝 -->
	
		<!-- 수정/삭제 버튼 -->
		<div>
			<c:if test="${(sessionScope.usersVO.id == rc_board.id) || sessionScope.usersVO.rank == 1 }">
				<p style="text-align: right;">
					<button class="btnOpt" onclick="modify()">수정</button>
					<button class="btnOpt" onclick="deleteRec()">삭제</button>
				</p>
			</c:if>
		</div> <!-- 수정 삭제버튼 끝 -->
		
		<hr>
		<!-- 댓글 출력 -->
		<div id="comments">
		</div>
		
		<br>
		<!-- 페이징 시작 -->
		<div id="paging">
			<ul id="pagingList" class="pagination justify-content-center">
		
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
					<input type="text" value="${usersVO.id }" name="id" size="10" class="idBox" readonly><br>
					<textarea rows="3" name="c_content" id="c_content" required
						placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."
						style="width:100%; overflow:visible; text-overflow:ellipsis;"></textarea>
					<input type="hidden" value="${rc_board.rc_idx }" name="rc_idx">
					<input type="button" class='btnOpt' onclick="registerComm()" value="등록">
				</form>
			</div>
		</c:if>
		<br>
		<br>
		<br>
		
		<!-- 글 목록 보여주기 (5개씩만) -->
		<div id="recruitListAjax">
		</div>
		
		<br><br><br>
	</div> <!-- bodyform 끝 -->
	
	<hr>
	<!-- 허해서 넣은 풋터 -->
		<p class="center" style="font-size: 17px;">© turtlesmiracle</p><br><br>
	<!-- 허해서 넣은 풋터 끝 -->
	
	
<script>
	/* 신청하기 */
	function apply(){
	      $.ajax({
	          type: "get",
	          url: '/apply',
	          data: {'id':'${usersVO.id}', 'rc_idx':'${rc_board.rc_idx}', 'cb_idx':'1'},
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
	        		  alert("모집글에 신청하였습니다.");
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
			location.href="/modifyRec?rc_idx=${rc_board.rc_idx}";
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
					html += "<li class='page_edge'><a class='p-n' href='#' onclick='paging("+startPage-1+")'>〈</a></li>"
				}
				for (var i = startPage; i <= endPage; i++){
					if (startPage == 1 && endPage == 1){
						html += "";
					} else if (i == nowPage){
						html += "<li class='page_edge now'>";
						html += "<a style='color: white;' href='#'>"+i+"</a>";
						html += "</li>";					
					} else if (i != nowPage){
						html += "<li class='page_edge'>";
						html += "<a class='p-n' href='#' onclick='paging("+i+")'>"+i+"</a>";
						html += "</li>";
					}
				}
				if (chkEndPage){
					html += "<li class='page_edge'><a class='p-n' href='#'onclick='paging("+endPage+1+")'>〉</a></li>";
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
				var html = ""; 
				
				var arrC_idx = new Array();
				var arrId = new Array();
				
				$.each(data,function(index, value){
					console.log("패스: "+ value.user_profileImagePath);
					var regdate = new Date(value.c_regdate);
					var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
				    if (value.level == 1){
					    html += "<div class='comm comment' id='comm"+value.c_idx+"'>";
						html += "<div class='comm_id idDiv' userId='"+value.id+"'>";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>&nbsp;";
						}else {
							html += "<img class='user' src='"+value.user_profileImagePath+"' alt='user'/>&nbsp;";
						}
						html += "<strong id='' class=''>"+value.id+"</strong></div>";
						html += "<div>"+value.c_content+"</div>";
						arrC_idx.push(value.c_idx);
						arrId.push(value.id);
				    } else {
				    	html += "<div class='comm c-comment' id='comm"+value.c_idx+"'>";
				    	html += "<div class='idDiv' userId='"+value.id+"'><span style='font-family: 맑은 고딕;'>&rdsh;</span> ";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>&nbsp;";
						}else {
							html += "<img class='user' src='"+value.user_profileImagePath+"' alt='user'/>&nbsp;";
						}
				    	html += "<strong id=''>"+value.id+"</strong></div>";
				    	html += "<div><strong class='"+value.rp_idx+"'></strong>"+value.c_content+"</div>";
						arrC_idx.push(value.c_idx);
						arrId.push(value.id);
				    }
			    	html += "<div class='commDate'>"+date+"</div>";
					html += "<div><button class='btnOpt' onclick='replyBtn("+value.c_idx+")')'>답글</button>&nbsp;";
				    if (value.id == '${sessionScope.usersVO.id}' && value.del == 0){
				    	html += "<button class='btnOpt' onclick='modifyComm(&#39;"+value.c_content+"&#39;, "+value.c_idx+")'>수정</button>&nbsp;";
				    	html += "<button class='btnOpt' onclick='deleteComm("+value.c_idx+")'>삭제</button>";
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
					$("#showWritten").attr("href", "/searchRecruitList?keyword="+userId+"&target=w")
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
						$('html, body').animate(divTop, 0);
					});
				});
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
		var html = "<div class='replyComm c-comment' style='background-color: #f2f2f2; padding: 15px;'>";
		html += "<form name='replyCommAjax"+clickCnt+"'>";
		html += "<span style='font-family: 굴림;'>&rdsh;</span><br>";
		html += "<textarea rows='3' name='c_content' style='width:100%; overflow:visible; text-overflow:ellipsis;'></textarea>";
		html += "<input type='hidden' value='${usersVO.id }' name='id'>";
		html += "<input type='hidden' value='${rc_board.rc_idx }' name='rc_idx'>";
		html += "<input type='hidden' value='"+data+"' name='rp_idx'>";
		html += "<input type='button' class='btnOpt' onclick='registerReplyComm()' value='등록'>&nbsp;";
		html += "<input type='button' class='btnOpt' onclick='cancelModify()' value='취소'>"; 
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
		console.log("comData: "+ commentData);
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
		html += "<span style='font-family: 굴림;'>&rdsh;</span><br>";
		html += "<textarea rows='3' name='c_content' style='width:100%; overflow:visible; text-overflow:ellipsis;'>"+c_content+"</textarea>";
		html += "<input type='hidden' value='"+c_idx+"' name='c_idx'>";
		html += "<input type='button' class='btnOpt' onclick='modifyCommAjax()' value='수정'>&nbsp;";
		html += "<input type='button' class='btnOpt' onclick='cancelModify()' value='취소'>"; 
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
	<div class="popupLayer">
		<div>
			<span onClick="closeLayer()" style="cursor:pointer; font-size: 0.85em; color: gray;" title="닫기">X</span>
		</div>
		<a id="sendMsg" href="#">쪽지 보내기</a><br>
		<a id="userProfile" href="#">회원 정보 보기</a><br>
		<a id="showWritten" href="#">작성글 보기</a><br>
	</div>
<script>
function closeLayer() {
	$(".popupLayer").hide();
}
</script>
</body>
</html>