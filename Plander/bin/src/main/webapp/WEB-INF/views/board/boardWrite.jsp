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
</style>
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
	<h3>게시판 글 작성 페이지</h3>
<form id="articleForm" role="form" action="/TMS/boardWrite" method="post"><!--  -->
 <br style="clear: both">
 <input type="hidden" name="ct_idx" value="${ct_idx }">
	<!-- 후기 내역 시작 -->
	<c:if test="${ct_idx == 3 }">
		<select id="bk_idx">
		<c:forEach var='list' items='${bookList }'>
			<option value="${list.bk_idx }">
			<c:if test="${list.sct_idx == 1 }"> 
				개인실 (${list.s_col } 번)		
			</c:if>
			<c:if test="${list.sct_idx == 2 }">
				4인실				
			</c:if>
			<c:if test="${list.sct_idx == 3 }">
				8인실				
			</c:if>
			<c:if test="${list.sct_idx == 4 }">
				12인실				
			</c:if>
			(${list.start_time.substring(0,16) } ~ ${list.end_time.substring(0,16) })
			</option>
		</c:forEach>
		</select>
	</c:if>
	<!-- 후기 내역 끝 -->
	<table>
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
		<tr>
			<td>
				<input type="button" class="btn btn-primary pull-right" onclick="submitBtn(this.form)" value='글 작성'>
			</td>
		</tr>
	</table>
	<input type="hidden" name="id" value="${usersVO.id }">
</form>


<script type="text/javascript">
	function submitBtn(frm){
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