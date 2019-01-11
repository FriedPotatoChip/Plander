<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<h3>- 쪽지스 -</h3>
	<div class="myBook_nav">
		<strong><a href="javascript:click()"
			onclick="fetch_book('/TMS/admin/recvMsg?nowPage=1')">받은쪽지</a></strong>
		&nbsp;|&nbsp;<strong><a href="javascript:click()"
			onclick="fetch_book('/TMS/admin/sendMsg?nowPage=1')">보낸쪽지</a></strong>
		<table id="myBook"></table>
	</div>
	<script>
		// 클릭 시 스크롤이 자동으로 위로 올라가는 현상
		function click() {
			return;
		}
		
		//내용 출력(fetch api)
		function fetch_book(name) {
			fetch(name).then(function(response) {
				response.text().then(function(text) {
					document.querySelector('#myBook').innerHTML = text;
				});
			});
		}
	</script>
</body>
</html>