<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/commons/head.jsp" />
<meta charset="UTF-8">
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script> 

<style>
	.zeroPad { padding: 0px; }
	.smallDate { color: gray; font-size: 0.7em;}
	.header {
		font-family: 'NanumSquare', sans-serif;
		font-weight: 400;
		color: #666;
		font-size: 1.2rem;
	}
	.center { text-align: center; }
	.write { float: right; }
	.write::after {
		content: "";
		clear: both;
		display: table;
	}
	/* 버튼 */
	.button {
		display: inline-block;
		padding: 6px 12px;
		border-radius: 4px;
		font-size: 14px;
		text-align: center;
		border: 1px solid #685D79;
		background-color: #685D79;
		cursor: pointer;
		color: white;
	}
	
	.button:hover {
		border: 1px solid #685D79;
		background-color: white;
		color: black;
	}
	/* 버튼 끝 */
	
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
	
</style>
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
	
	<!-- 후기 게시판일 때 -->
	<c:if test="${ct_idx == 3 }">
		<p class="center" style="font-weight: 700; font-size: 2em;">[ REVIEW ]</p>
	</c:if>
	<!-- 후기 게시판이 아닐 때  -->
	<c:if test="${ct_idx != 3 }">
		<p class="center" style="font-weight: 700; font-size: 2em;">[ 글쓰기 ]</p>
	</c:if>
	
	<div class="bodyform"
		style="width: 75%; margin: auto; background-color: #e9ecef; padding: 20px;
		border-radius: 15px;">
		<div> <!-- 글쓰기 폼 -->
			<form id="articleForm" role="form" action="/TMS/boardWrite" method="post"><!--  -->
				<br style="clear: both">
				<input type="hidden" name="ct_idx" value="${ct_idx }">
				
				<!-- 후기 내역 시작 -->
				<div class="center">
					<c:if test="${ct_idx == 3 }">
						<select id="bk_idx" class="opt">
							<c:forEach var='list' items='${bookList }'>
								<option value="${list.bk_idx }">
									<c:if test="${list.sct_idx == 1 }">개인실 (${list.s_col } 번)</c:if>
									<c:if test="${list.sct_idx == 2 }">4인실</c:if>
									<c:if test="${list.sct_idx == 3 }">8인실</c:if>
									<c:if test="${list.sct_idx == 4 }">12인실</c:if>
									(${list.start_time.substring(0,16) } ~ ${list.end_time.substring(0,16) })
								</option>
							</c:forEach>
						</select>
					</c:if>
				</div> <!-- 후기 내역 끝 -->
				
				<hr><br>
				<table style="margin: auto;">
					<tr>
						<td>
							<div class="col-xs-9 zeroPad">
								<input type="text" class="form-control" id="b_title" name="b_title" placeholder="제목" required><!--  -->
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<textarea class="form-control" id="summernote" name="b_content" placeholder="content" required></textarea><!--  -->
						</td>
					</tr>
				</table>
				<input type="hidden" name="id" value="${usersVO.id }">
				<br><br>
				
				<!-- 글쓰기 버튼 -->
				<div class="write">
					<input class="button" type="button" onclick="submitBtn(this.form)" value='글 작성'>&nbsp;
					<input class="button" type="reset" value="취소">
				</div>
				<br>
				
			</form>
		</div> <!-- 글쓰기 폼 끝 -->
	<br>
	</div> <!-- bodyform 끝 -->
	<br><br><br>
	<hr>
	<!-- 허해서 넣은 풋터 -->
	<p class="center" style="font-size: 17px;">© turtlesmiracle</p><br><br>
	<!-- 허해서 넣은 풋터 끝 -->
	
	

<script type="text/javascript">
	function submitBtn(frm){
		var title = frm.b_title.value;
		if (title == ''){
			alert("제목을 입력해 주세요");
			$("#b_title").focus();
			return false;
		}
		
		var content = frm.b_content.value;
		if (content == ''){
			alert("내용을 입력해 주세요");
			$('#summernote').summernote('focus');
			return false;
		}
		if ('${ct_idx}' == 3){
			
			var bk_idx = $("#bk_idx").val();
			$.ajax({
				url: '/minusReview',
				type: 'get',
				data: {'bk_idx':bk_idx, 'id':'${usersVO.id}'},
				dataType: 'text', 
				success: function(result) {
					if (result == 'success'){
						document.getElementById("articleForm").submit();
					} else if (result == 'fail'){
						alert("리뷰 작성 실패. 관리자에게 문의해주세요.");
						return false;
					}
				}, error: function(error){
						alert("리뷰 작성 실패. 관리자에게 문의해주세요.");
						return false;
				}
			})
		} else {
			document.getElementById("articleForm").submit();
		}
	}
	
	
	
    $(document).ready(function() {
      $('#summernote').summernote({
    	placeholder: 'content',
        minHeight: 370,
        maxHeight: null,
        focus: true,
        lang : 'ko-KR',
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
      });
    });
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/imageUpload',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
        	setTimeout(function(){
	        	url = '/resources/upload'+url;
	        	console.log("url: "+ url);
	          $(el).summernote('editor.insertImage', url);
	          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        	}, 3000)
        }
      });
    }
</script>

</body>
</html>