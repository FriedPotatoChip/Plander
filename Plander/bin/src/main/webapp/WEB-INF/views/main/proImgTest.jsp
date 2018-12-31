<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://jcrop-cdn.tapmodo.com/v0.9.12/js/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v0.9.12/css/jquery.Jcrop.css" type="text/css" />
<script>
	
$(document).ready(function() {
    $("#imgInput").on("change", fileChange);
});
	var jcrop_api;
	var target;
//callback function
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

	function fileChange(e) {
		e.preventDefault();
		console.log("이미지 온체인지"); 
	
	
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
	            target = e.target.result;
	        } 
	        reader.readAsDataURL(f); 

	    }); 
	}
$(function(){
	 var cnt = 1;
	$("#profileImg").on("load", function(){
		console.log("jcrop: "+ jcrop_api); 
		console.log("이미지 온로드");
		
		if (cnt == 1){
	        $('#profileImg').Jcrop({
	    	    setSelect: [0,0,100,100],
	    	    onChange: showCoords, 
	    	    onSelect: showCoords,
	    		aspectRatio: 1
	        }, function(){
	        	jcrop_api = this;
	        })
		} else {
			jcrop_api.setImage(target);
		}
        cnt ++;
	})
});
</script> 
</head>
<body>

<form id="form" action="/TMS/profileUpload" name="imgForm" method="post" enctype="multipart/form-data" onclick="">
	<input type='file' name="file" id="imgInput" />
	<input type="text" name="x" id="x" />
	<input type="text" name="y" id="y" />
	<input type="text" name="w" id="w" />
	<input type="text" name="h" id="h" />
	<input type="submit" value="수정">
</form> 
	<img id="profileImg" src="#">
	
	<input type="button" value="전송" onclick="sendFile()">


</body>
</html>