<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!---*** Start: Bootstrap 3.3.7 version files. ***--->
<script language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!---*** End: Bootstrap 3.3.7 version files. ***--->
    <!--  -->

<script src='/resources/js/fullcalendar.js'></script>
<script src='/resources/js/gcal.js'></script>
<!-- <script src='/resources/js/jquery.min.js'></script> -->

<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' />
<script src='/resources/js/ko.js'></script>
<script>


	$(function() {
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
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek'
			},
			dayClick : function(date) {
				//alert('clicked ' + date.format());
			},
			select : function(startDate, endDate) {
				//alert('selected ' + startDate.format() + ' to ' + endDate.format());
				console.log("endDate: "+ endDate.format());
				// 날짜 길이 startDate.format().length
				  $('input[name="daterange"]').daterangepicker({
				    opens: 'center',
				    "autoApply": true,
				    dateFormat: 'yy-mm-dd'
				  }, function(start, end, label) {
				    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
				  });
				
				$('#myModal').modal('show');
				//$("#start_date").html(startDate.format("YYYY-MM-DD HH:mm"));
				$("#start_date").html(startDate.format("YYYY.MM.DD"));
				$("#end_date").html(endDate.format("YYYY.MM.DD"));
			},
			events : [ 
				<c:forEach var="list" items="${planList}">
					<c:if test="${not empty list}">
						{
							title : "${list.p_title}",
							start : "${list.p_start_date}",
							end : "${list.p_end_date}",
							url: 'https://scontent-icn1-1.xx.fbcdn.net/v/t31.0-8/10383789_1539879212958441_3985988292410140175_o.png?_nc_cat=108&_nc_ht=scontent-icn1-1.xx&oh=a84657bf08f258bb5c71691201645595&oe=5CA2AE8C'
						},
					</c:if>
				</c:forEach>
				{
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

.fc-sun {
	color: red;
}

.fc-sat {
	color: blue;
}
.fc-highlight {
	background-color: #EA4C89;
}
.fc-event {
	background-color: #b197fc;
	opacity: 0.6;
}
</style>
</head>
<body>

	<div id='loading'>loading...</div>

	<div id='calendar'></div>




	<!--  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">일정 작성</h4>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<select name="category">
								<c:forEach var="ctList" items="${ctList }">
									<option value="${ctList.ct_idx }">${ctList.ct_name }</option>
								</c:forEach>
							</select>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="daterange" value="2018.12.23.-2018.12.25."/></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">작성완료</button>
					<button type="button" class="btn btn-danger">상세작성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="modal_close">닫기</button>
				</div>
			</div>
		</div>
	</div>


<body>

<script>
$(function() {

});
</script>

	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
