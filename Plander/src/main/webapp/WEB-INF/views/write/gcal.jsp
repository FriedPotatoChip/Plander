<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href="/resources/css/datepicker.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/resources/js/datepicker.js"></script>

<script src='/resources/js/moment.min.js'></script>

<!---*** Start: Bootstrap 4.1.3 version files. ***--->
<script language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- <script language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!---*** End: Bootstrap 3.3.7 version files. ***--->


<script src='/resources/js/fullcalendar.js'></script>
<script src='/resources/js/gcal.js'></script>
<!-- <script src='/resources/js/jquery.min.js'></script> -->

<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' />
<script src='/resources/js/ko.js'></script>
<script>
var start_date;
var end_date;
var clickChk = 0;
var days;
function calDays() {
	if(end_date == undefined || start_date == undefined) {
		return;
	}
	days = ((end_date - start_date + (1000*60*60*24))/60/60/24/1000);
	
	$("#days").html(days+ "일");
	$("#daysForm").attr("value", days);
	console.log("start_date: "+ start_date+ ", end_date: "+ end_date);
}
$(function() {

	
	
	var $start = $('#start'),
		$end = $('#end');
		$start.datepicker({
			language: 'ko',
			autoClose: true,
			onSelect: function (fd, date) {
				$end.data('datepicker').update('minDate', date)
				console.log("date: "+ date+ ", end_date: "+ end_date);
				if (end_date == undefined) {
					$("#days").html("");
				}
				start_date = date.getTime();
				calDays();
			},
			navTitles: {
			    days: '<i>yyyy</i>년 MM',
			    months: 'yyyy',
			    years: 'yyyy1 - yyyy2'
			}
		})
		$end.datepicker({
			language: 'ko',
			autoClose: true,
			onSelect: function (fd, date) {
				$start.data('datepicker').update('maxDate', date)
				console.log("date: "+ date+ date.getTime());
				if (start_date == undefined) {
					$("#days").html("");
				}
				end_date = date.getTime();
				calDays();
			},
			navTitles: {
			    days: '<i>yyyy</i>년 MM',
			    months: 'yyyy',
			    years: 'yyyy1 - yyyy2'
			}
		})
});
</script>

<script>
	$(function() {
		$("#start").on("click", function(){
		})
		// page is now ready, initialize the calendar...
		// 캘린더 이벤트 추가
		$('#calendar').fullCalendar({
			// put your options and callbacks here
		    // defaultView: 'agendaWeek',
			/* eventClick: function(event) {
			  if (event.url) {
			    window.open(event.url);
			    return false;
			  }
			} */
			googleCalendarApiKey : "AIzaSyDisTxcq4fh9fLuRaWT29TEP8TwfOTtYDs",
            eventSources : [
                // 대한민국의 공휴일
                {
                      googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
                    , className : "koHolidays"
                    , color : "#FF0000"
                    , textColor : "#FFFFFF"
                }],
		    nowIndicator: true,
			selectable : true,
			defaultView: 'month',
			editable: true,
			height: '300px', 
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
				//agendaWeek, month
			},
			dayClick : function(date) {
				//alert('clicked ' + date.format());
			},
			select : function(startDate, endDate) {
				window.scrollTo(0,0);
				// 선택 날짜 기간 
				days = ((endDate - startDate)/60/60/24/1000);
				console.log("선택 날짜 기간: "+ days);
				$("#days").html(days+ "일");
				$("#daysForm").attr("value", days);
				// 날짜 길이 startDate.format().length
				var endDate_date = endDate.format("YYYY-MM-DD").substr(8,2);
				endDate_date -= 1;
				if (endDate_date < 10) {
					endDate_date = '0' + endDate_date;
				}
				var endDate_fix = endDate.format("YYYY-MM-DD").substr(0,8) + endDate_date;
				/* $("#start").attr("value", startDate.format("YYYY-MM-DD")); */
				document.getElementById("start").value=startDate.format("YYYY-MM-DD");
				/* $("#end").attr("value", endDate.format("YYYY-MM-DD")); */
				document.getElementById("end").value=endDate_fix;
				$('#myModal').modal('show');
				//$("#start_date").html(startDate.format("YYYY-MM-DD HH:mm"));
			},
			events : [ 
				
				<c:forEach var="list" items="${planList}">
					<c:if test="${not empty list}">
						{
							title : "${list.p_title}",
							color : "#b197fc",
							allDay : true,
							start : "${list.p_start_date}",
							end : "${list.p_end_date}",
							url: 'https://scontent-icn1-1.xx.fbcdn.net/v/t31.0-8/10383789_1539879212958441_3985988292410140175_o.png?_nc_cat=108&_nc_ht=scontent-icn1-1.xx&oh=a84657bf08f258bb5c71691201645595&oe=5CA2AE8C'
						},
					</c:if>
				</c:forEach>
				{
			        title:"My repeating event",
			        start: '10:00', // a start time (10am in this example)
			        end: '14:00', // an end time (6pm in this example)
			        
			        dow: [ 1, 4 ] // Repeat monday and thursday
				} 
			]

		})

	});
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
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

.fc-sun { color: red; }
.fc-sat { color: blue; }
.fc-highlight {	background-color: #EA4C89; }
.fc-event {	opacity: 0.6; }
.right { text-align: right; }
.width100 { width: 100%; }
.fontBig { font-size: 2.0em; }
.dateFont { font-size: 1.2em; }
.borderZero { border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; }
</style>
</head>
<body>
	<div id='loading'>loading...</div>

	<div class="row">
		<div id="miniCal" class="datepicker-here col-2" data-language="ko"></div>
		<div id='calendar' class="col-8"></div>
	</div>
 
	<!--  -->
					<form method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">일정 작성</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
					<!-- 폼태그 -->
						<table id="modalTable" class="table">
							<tr>  
								<td colspan="2"><input id="p_title" type="text" name="p_title" class="width100 fontBig borderZero" placeholder="제목 및 내용"></td>
							</tr>
						<tr>
							<td colspan="2">
								<select class="custom-select" id="inputGroupSelect01" name="ct_idx">
									<c:forEach var="ctList" items="${ctList }">
										<option value="${ctList.ct_idx }">${ctList.ct_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>시작</th>
							<td>
								<input autocomplete="off" placeholder="startDate" type='text' name="p_start_date" class='datepicker-here borderZero dateFont' data-language='ko' data-position='bottom right' id="start"><span id="days"></span>
							</td>
						</tr>
						<tr>
							<th>종료</th>
							<td>
								<input autocomplete="off" placeholder="endDate" type='text' name="p_end_date" class='borderZero datepicker-here dateFont' data-language='ko' data-position='bottom left' id="end">
							</td>
						</tr> 
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onClick="writePlan(this.form)">작성완료</button>
					<button type="button" class="btn btn-danger" onClick="writePlanD(this.form)">상세작성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="modal_close">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="days" id="daysForm">
					</form>
	

<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>

<button type="button" class="btn btn-link">Link</button>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script>

	function writePlan(frm){
		var p_title = document.getElementById("p_title").value;
		if (p_title == "") {
			alert("제목을 입력해주세요");
			return false;
		}
		frm.action = "/Plander/write";
		frm.submit();
	}
	function writePlanD(frm){
		/* var p_title = document.getElementById("p_title").value;
		if (p_title == "") {
			alert("제목을 입력해주세요");
			return false;
		} */
		frm.action = "/Plander/write/detail";
		frm.submit();
	}
</script>
</body>
</html>
