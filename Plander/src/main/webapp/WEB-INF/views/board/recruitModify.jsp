<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script> 


<style>
	.zeroPad { padding: 0px; }
</style>
</head>
<body>
	<h3>모집 게시판 글 작성 페이지</h3>
	
<form id="articleForm" role="form" action="/TMS/modifyRec" method="post">
 <br style="clear: both">
	<table>
		<tr>
			<td>
				<div class="col-xs-9 zeroPad">
					<input type="text" class="form-control" id="rc_title" name="rc_title" placeholder="제목" value="${rc_board.rc_title }"  required>
				</div>
				<div class="col-xs-3 zeroPad">
					<input type="number" class="form-control" placeholder="최대인원" name="max_mem" value="${rc_board.max_mem }" required>
				</div>
			</td>
		</tr>  
		<tr>
			<td>
				<br>
				<textarea class="form-control" id="summernote" name="rc_content" placeholder="content" required></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">수정하기</button>
			</td>
		</tr>
	</table>
	<input type="hidden" name="rc_idx" value="${rc_board.rc_idx }">
		
</form>


<script type="text/javascript">
    $(document).ready(function() {
      $("#summernote").summernote('code', '${rc_board.rc_content}');
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