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

		function msgDel(rm_idx, nowPage) {
			$.ajax({
				url : '/msgDel',
				type : 'post',
				data : {
					'rm_idx' : rm_idx
				},
				dataType : 'text',
				success : function(result) {
					if (result == 'success') {
						alert("쪽지를 삭제했습니다.");
					} else {
						alert("쪽지 삭제에 실패했습니다.\n관리자에게 문의하세요");
					}
				},
				error : function(error) {
					alert("쪽지 삭제에 실패했습니다.\n관리자에게 문의하세요");
				}
			})

			fetch_book('/TMS/admin/recvMsg?nowPage=' + nowPage);
		}
	</script>

</body>
</html>