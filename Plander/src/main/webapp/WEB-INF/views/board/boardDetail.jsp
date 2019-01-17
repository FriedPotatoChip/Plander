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
	.hoverPointer:hover{ cursor: pointer; }
	
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
				html += "<p style='font-weight: 700;'>" + category + " 카테고리 글</p><hr>";
				html += "<table width='100%'>"
				$.each(list,function(index, value){
					if (index == 0){ 
						window.chkEndPage = value.b_title;
						window.chkStartPage = value.b_content;
					} else{
						var regdate = new Date(value.b_regdate);
						var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
						var day = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate();
						html += "<tr>";
						html += "<td width='80%'>";
						if ('${board.b_idx}' == value.b_idx){
							html += "<b>";
						}
						html += "<a style='font-size: 0.9rem;' href='/boardDetail?idx="+value.b_idx+"&nowPage=${nowPage}&cntPerPage=${cntPerPage}'>";
						if("${board.b_idx}" == value.b_idx){
							html += '<b style="font-size: 1.1em;">'+ value.b_title + '</b>';
						} else {
							html += value.b_title;
						}
						if (value.cnt != 0){
							html += "<span style='color: #D8737F;'>["+value.cnt+"]</span>";
						} 
						html += "</a>";
						if ('${board.b_idx}' == value.b_idx){
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
				
				$("#boardListAjax").html(html);
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
		<br>
		<div id="board">
			<a href="/board?ct_idx=${board.ct_idx }&nowPage=${nowPage }&cntPerPage=${cntPerPage}"
				style="font-size: 0.8em;">
				<strong id="boardType"></strong>
			</a>
			
			<!-- 제목 -->
			<h4>${board.b_title }</h4>
			<div class="idDiv" userId="${board.id }">
				<c:if test='${empty board.user_profileImagePath }'>
					<img class="user" src="/resources/images/users.png" alt="user"/>
				</c:if>
				<c:if test='${not empty board.user_profileImagePath }'>
					<img class="user" src="${board.user_profileImagePath }" alt="user"/>
				</c:if> 
				<span>${board.id }</span>&nbsp;&nbsp;&nbsp;
				<span style="font-size: 0.85rem;"><fmt:formatDate value="${board.b_regdate }" pattern="yyyy.MM.dd HH:mm"/></span>
			</div> 
			
			<hr>
			<div id="content">${board.b_content }</div>
			<br><br><br>
			
			<c:if test="${(sessionScope.usersVO.id == board.id) || sessionScope.usersVO.rank == 1 }">
				<p style="text-align: right;">
					<button class="btnOpt" onclick="modify()">수정</button>
					<button class="btnOpt" onclick="deleteRec()">삭제</button>
				</p>
			</c:if>
		</div>	
	
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
					<input type="hidden" value="${board.b_idx }" name="b_idx">
					<input type="button" class="btnOpt" onclick="registerComm()" value="등록">
				</form>
			</div>
		</c:if>
		<br>
		<br>
		<br>
		
		<!-- 글 목록 보여주기 (5개씩만) -->
		<div id="boardListAjax">
		</div>
	
		<br><br><br>
	</div> <!-- bodyform 끝 -->
	
	<hr>
	<!-- 허해서 넣은 풋터 -->
		<p class="center" style="font-size: 17px;">© turtlesmiracle</p><br><br>
	<!-- 허해서 넣은 풋터 끝 -->
	
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
			location.href="/modifyBoard?b_idx=${board.b_idx}";
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
				var html = ""; 
				
				var arrC_idx = new Array();
				var arrId = new Array();
				
				$.each(data,function(index, value){ 
					var regdate = new Date(value.c_regdate);
					var date = regdate.getFullYear() + "."+ (regdate.getMonth()+1) + "."+ regdate.getDate()+ " "+ regdate.getHours()+ ":"+ regdate.getMinutes();
				    if (value.level == 1){
					    html += "<div class='comm comment' id='comm"+value.c_idx+"'>";
						html += "<div class='comm_id idDiv' userId='"+value.id+"'>";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>&nbsp;";
						} else {
							html += "<img class='user' src='"+value.user_profileImagePath+"' alt='user'/>&nbsp;";
						}
						html += "<strong id='' class=''>"+value.id+"</strong></div>";
						html += "<div>"+value.c_content+"</div>";
						arrC_idx.push(value.c_idx);
						arrId.push(value.id);
				    } else {
				    	html += "<div class='comm c-comment' id='comm"+value.c_idx+"'>";
				    	html += "<div class='idDiv' userId='"+value.id+"'><span style='font-family: 굴림;'>&rdsh;</span> ";
						if (value.user_profileImagePath == null){
							html += "<img class='user' src='/resources/images/users.png' alt='user'/>&nbsp;";
						} else {
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
					$("#showWritten").attr("href", "/searchList?keyword="+userId+"&target=w&ct_idx=${board.ct_idx}");
					$("#showWritten").attr("href", "/searchList?keyword="+userId+"&target=w&ct_idx=${board.ct_idx}")
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
			url: '/registerBoardComm',
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
		var html = "<div class='replyComm' style='background-color: #f2f2f2; padding: 15px;'>";
		html += "<form name='replyCommAjax"+clickCnt+"'>";
		html += "<span style='font-family: 굴림;'>&rdsh;</span><br>";
		html += "<textarea rows='3' name='c_content' style='width:100%; overflow:visible; text-overflow:ellipsis;'></textarea>";
		html += "<input type='hidden' value='${usersVO.id }' name='id'>";
		html += "<input type='hidden' value='${board.b_idx }' name='b_idx'>";
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