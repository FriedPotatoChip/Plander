<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 상세 작성</title>
<link href="/resources/css/datepicker.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/resources/js/datepicker2.js"></script>

<!-- Timepicker -->
<link href="/resources/css/timepicker.css" rel="stylesheet">
<script src="/resources/js/timepicker.js"></script>
<!---*** Start: Bootstrap 4.1.3 version files. ***--->
<script language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script>
$(function(){
	
	var start_date = '${PlannerVO.p_start_date}';
	var count_date = new Date(start_date);
	for(var i=0; i < ${PlannerVO.days}; i++){
		var days_date;
		var days_html;
		var days_newDate;
		days_date = count_date.getTime() + 1000 * 60 * 60 * 24 * i;
		days_newDate = new Date(days_date);
		days_html = days_newDate.getFullYear() + "-" + days_newDate.getMonth() + "-" + days_newDate.getDate();
		console.log("days_html: "+ days_html);
		$("#days"+(i+1)).html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+days_html);
		$("#days"+ (i+1)+ "div").attr("date", days_html);
	}
	console.log("시작일: "+ start_date);
	
	
	
	
	$(".tp").on("change", function(){
		console.log($(this).find("input").first().val());
	})

})
</script>
<style>
.fontBig { font-size: 2.0em; }
.borderZero { border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; }
.daysSpan { font-size: 0.7em; color: #adb5bd; font-weight: normal; }
.daysDiv { font-size: 1.2ev; font-weight: bold; }
</style>
</head>
<body>

	<h3>플래너 상세 작성</h3>
	<table class="table">
		<tr>
			<td>
				<c:if test='${empty PlannerVO.p_title }'>
					<input type="text" class="fontBig borderZero" placeholder="제목 추가">
				</c:if>
				<c:if test='${not empty PlannerVO.p_title }'>
					<input type="text" class="fontBig borderZero" value="${PlannerVO.p_title }">
				</c:if>
			</td>
		</tr>
		
		<c:forEach var="i" begin="1" end="${PlannerVO.days }">
		<tr>
			<td>
				<div class="header" id="days${i }div">
					<div class="dataHeader daysDiv">
						Days${i }<span class="daysSpan" id="days${i }"></span>
					</div>
					<div class="blank">
					
					</div> 
				</div>
				<div class="content">
					<input type="text" id="startTime${i }" name="startTime" onChange="checkTime()">
					<input type="text" id="endTime${i }" name="endTime">
					<input type="text">
					<%-- <input autocomplete="off" value="${PlannerVO.p_start_date }" placeholder="startDate" type='text' name="p_start_date" class='datepicker-here borderZero dateFont' data-language='ko' data-position='bottom right' id="start"> --%>
				</div>
			</td>
		</tr>
		</c:forEach>	
			
			
			
	</table>
<script>
for (var i=1; i<=${PlannerVO.days}; i++){
	
	$("#startTime"+i).timepicker();
	$('#endTime'+i).timepicker();
}
</script>
</body>
</html>