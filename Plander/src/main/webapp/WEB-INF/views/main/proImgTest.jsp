<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/js/Jcrop.js"></script>
<link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/css/Jcrop.css" type="text/css">
<script>
//callback function
$(document).ready(function(){
	var showCoords = function(c)
	{
	    $('#x').val(c.x);
	    $('#y').val(c.y);
	    $('#w').val(c.w);
	    $('#h').val(c.h);
	    window.x = c.x;
	    window.y = c.y;
	    window.w = c.w;
	    window.h = c.h;
	};
	
	// JCrop 호출
	$('#img').Jcrop({
	    setSelect: [0,0,100,100],
	    onChange: showCoords, 
	    onSelect: showCoords,
		aspectRatio: 1
	});
	
	
	//
$(document).ready(function() {
    $("#imgInput").on("change", fileChange);
});

	function fileChange(e) {
		e.preventDefault();
	
	
		var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	
	    filesArr.forEach(function(f) {
	        if(!f.type.match("image.*")) {
	            alert("확장자는 이미지 확장자만 가능합니다.");
	            return false;
	        }
	
	        sel_file = f;
	
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            $("#profileImg").attr("src", e.target.result);
	            
	        }
	        reader.readAsDataURL(f); 
	        
	    	$('#profileImg').Jcrop({
	    	    setSelect: [0,0,100,100],
	    	    onChange: showCoords, 
	    	    onSelect: showCoords,
	    		aspectRatio: 1
	    	});
	    });
	}
})
</script>
</head>
<body>
<form action="/crop">
</form>


<form id="form" action="/TMS/profileUpload" name="imgForm" method="post" enctype="multipart/form-data" onclick="">
	<input type='file' name="file" id="imgInput" />
	<input type="text" name="x" id="x" />
	<input type="text" name="y" id="y" />
	<input type="text" name="w" id="w" />
	<input type="text" name="h" id="h" />
	<input type="submit" value="수정">
</form>
	<img id="profileImg" src="#" alt="your image" />
	<input type="button" value="전송" onclick="sendFile()">


</body>
</html>