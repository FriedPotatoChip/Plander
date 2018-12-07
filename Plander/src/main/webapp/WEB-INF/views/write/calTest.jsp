<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
(function($){

	 //구글 캘린더 API 연동
	 $.googleEventCalcInfo = function(option) {
	  var events = [];

	  var data = {
	   key: option.auth_key
	   , timeMin: option.start_time
	   , timeMax: option.end_time
	   , timeZone: 'Asia/Seoul'
	   , singleEvents: true
	   , maxResults: 99
	  };

	  $.ajax({
	   googleCalendarId: null 
	   , url: 'https://www.googleapis.com/calendar/v3/calendars/' + encodeURIComponent(option.client_id)  + '/events'
	   , data: data
	   , async: false
	   , cache: false
	   , startParam: false
	   , endParam: false 
	   , timezoneParam: false 
	   , success: function(data) {
	    if (data.error) {
	     alert('Google Calendar API: ' + data.error.message, data.error.errors);
	    } else if (data.items) {
	     $.each(data.items, function(i, entry) {
	      events.push({
	       id: entry.id
	       , summary: entry.summary
	       , start: entry.start.date
	       , end: entry.end.date
	       , url: entry.htmlLink
	       , location: entry.location
	       , description: entry.description
	      });
	     });
	    }
	   }
	   , error: function(jqXHR, textStatus, errorThrown) {
	    var errorMsg = 'status(code) : ' + jqXHR.status + '\n';
	    errorMsg += 'statusText : ' + jqXHR.statusText + '\n';
	    errorMsg += 'responseText : ' + jqXHR.responseText + '\n';
	    errorMsg += 'textStatus : ' + textStatus + '\n';
	    errorMsg += 'errorThrown : ' + errorThrown;
	    alert(errorMsg);
	    return false;
	   }
	  }); 
	  return events;
	 };
	})(jQuery);
</script>
</head>
<body>

</body>
</html>