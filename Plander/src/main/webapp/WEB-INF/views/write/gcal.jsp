<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='/resources/js/jquery.min.js'></script>
<script src='/resources/js/moment.min.js'></script>

<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/resources/js/fullcalendar.min.js'></script>
<script src='/resources/js/ko.js'></script>
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1;
var yyyy = today.getFullYear();
if (mm < 10) {
	mm = '0'+ mm;
}
if (dd < 10){
	dd = '0' + dd;
}
var today_date = yyyy + "-" + mm + "-" + dd;
var start_date;
var start_day;
var start_mon;
var end_date;
var end_day;
var end_mon;
$(function() {
	
	  // page is now ready, initialize the calendar...
	  // 캘린더 이벤트 추가
	  $('#calendar').fullCalendar({
	    // put your options and callbacks here
	    
	    
	    
	  })
	  

	  // 드래그 배경색 처리
$("td[data-date='"+today_date+"']").css("background-color", "#fff3bf");	// 오늘 배경색 처리

	$(".fc-row td").mousedown(function(){
		
		start_date = $(this).attr("data-date");
		end_date = $(this).attr("data-date");
		start_day = start_date.substr(8) * 1; 	// 시작일 일만 출력
		start_mon = start_date.substr(5, 2) * 1;
		$("td[data-date='"+start_date+"']").css("background-color", "#b197fc");
		
		$(".fc-row td").hover(function(){
			
			end_date = $(this).attr("data-date");
			end_day = end_date.substr(8) * 1;		// 끝일 일만 출력
			end_mon = end_date.substr(5,2) * 1;
			if (start_mon == 1 && end_mon == 12){
				start_mon = 13;
			} else if (end_mon == 1 && start_mon == 12){
				end_mon = 13;
			} else if (start_mon == 1 && end_mon == 13){
				start_mon = 13;
			} else if (start_mon == 13 && end_mon == 1){
				end_mon = 13;
			} else if (start_mon == 11 && end_mon == 1){
				end_mon = 13;
			} else if (end_mon == 11 && start_mon == 1){
				start_mon = 13;
			}
			console.log("시작일: "+ start_date+ ", 종료일: "+ end_date);	
			console.log("시작월: "+ start_mon+ ", 종료월: "+ end_mon);
			
			$("td").css("background-color", "white");
			$("td[data-date='"+today_date+"']").css("background-color", "#fff3bf");	// 오늘 배경색 처리
			$("td[data-date='"+start_date+"']").css("background-color", "#b197fc")
			
			drag();
			
			
		}); 
		
		
	});
	$(".fc-row td").mouseup(function(){
		start_day *= 1;
		end_day *= 1;
		start_mon *= 1;
		end_mon *= 1;
		if (start_mon == end_mon && end_day < start_day){
			alert("시작일: "+ end_date+", 종료일: "+ start_date);
		} else if (start_mon > end_mon){
			alert("시작일: "+ end_date+", 종료일: "+ start_date);
		} else {
			alert("시작일: "+ start_date+", 종료일: "+ end_date);
		}
			
	}); 
	function drag() {
		
		if (end_mon == start_mon){
			if (end_day > start_day){
				console.log("정순");

				for (var i=start_day; i <= end_day; i++){
					if (i < 10){
						i = "0"+i;
					}
					var tmp = start_date.substr(0, 8) + i;	// 시작일, 끝일 사이 날 찾기
					$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
				}
				
			} else if (end_day < start_day){
				console.log("역순");
				
				for (var i=end_day; i <= start_day; i++){
					if (i < 10){
						i = "0"+i;
					}
					var tmp = end_date.substr(0, 8) + i;	// 시작일, 끝일 사이 날 찾기
					$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
/* 					var tmp;
					tmp = start_date;
					start_date = end_date;
					end_date = tmp; */
				}
				
			} else {
				console.log("당일");
				$("td[data-date='"+start_date+"']").css("background-color", "#b197fc");
			}
		} else if (start_mon == (end_mon + 2)) {
			for (var i = 1; i <= start_day; i++){
				i = '0' + i;
				var tmp = start_date.substr(0,8) + i;
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
			for (var i = end_day; i <= 31; i++) {
				var tmp = end_date.substr(0,8) + i;
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
			var mon = start_mon - 1;
			if (mon < 10){
				mon = '0' + mon;
			}
			var last_mon_date = end_date.substr(0, 5) + mon;
			console.log("last_mon_date: "+ last_mon_date);
			$("td[data-date*='"+last_mon_date+"']").css("background-color", "#b197fc");
		} else if (end_mon == (start_mon + 2)) {
			for (var i = 1; i <= end_day; i++){
				i = '0' + i;
				var tmp = end_date.substr(0,8) + i;
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
			for (var i = start_day; i <= 31; i++) {
				var tmp = start_date.substr(0,8) + i;
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
			var mon = end_mon - 1;
			if (mon < 10){
				mon = '0' + mon;
			}
			var last_mon_date = start_date.substr(0, 5) + mon;
			console.log("last_mon_date: "+ last_mon_date);
			$("td[data-date*='"+last_mon_date+"']").css("background-color", "#b197fc");
		}
		else if (end_mon > start_mon) {	// 다음 달까지 드래그 한 경우
			for (var i = start_day; i <= 31; i++){
				if (i < 10){
					i = "0"+i;
				}
				var tmp = start_date.substr(0, 8) + i;	// 시작일, 끝일 사이 날 찾기
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
			for (var i = 1; i <= end_day; i++){
				if (i < 10){
					i = "0"+i;
				}
				var tmp = end_date.substr(0, 8) + i;	// 시작일, 끝일 사이 날 찾기
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
		} else if (start_mon > end_mon) {
			for (var i = end_day; i <= 31; i++){
				if (i < 10){
					i = '0' + i;
				}
				var tmp = end_date.substr(0,8) + i;
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
			for (var i = 1; i <= start_day; i++){
				if (i < 10) {
					i = '0' + i;
				}
				var tmp = start_date.substr(0,8) + i;
				$("td[data-date='"+tmp+"']").css("background-color", "#b197fc");
			}
		}
	}

});


</script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  .fc-sun {
  	color: red;
  }
  .fc-sat {
  	color: blue;
  }
</style>
</head>
<body>

  <div id='loading'>loading...</div>

  <div id='calendar'></div>

</body>
</html>
