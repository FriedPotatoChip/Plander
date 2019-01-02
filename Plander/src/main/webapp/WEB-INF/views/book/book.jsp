<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/commons/head.jsp"></jsp:include>
<title>예약 페이지</title>

<style>
	#container { width: 90%; margin: auto; }
	* { text-decoration: none; }
	.center { text-align: center; }
	
	/* 지점 좌석 현황 및 요금 */
	.boxoutside {
		width: 100%;
		height: auto;
	}
	.box { float: left; }
	.boximg {
		display: block;
		width: 75%; height: auto;
		margin-left: auto; margin-right: auto;
		overflow: hidden;
	}
	
	.boxoutside::after {
		content: "";
		clear: both;
		display: table;
	}
	
	.price {
		display: block;
		width: 75%;
		margin-left: auto; margin-right: auto;
	}
	
</style>

</head>
<body>
<!-- 헤더 -->
<!-- Header -->
<c:if test="${empty sessionScope.usersVO }">
	<jsp:include page="/commons/header.jsp" />
</c:if>
<c:if test="${not empty sessionScope.usersVO }">
	<c:if test="${sessionScope.usersVO.id != 'admin' }">
		<jsp:include page="/commons/loginheader.jsp" />
	</c:if>
	<c:if test="${sessionScope.usersVO.id == 'admin' }">
		<jsp:include page="/commons/adminLoginheader.jsp" />
	</c:if>
</c:if>
<!-- 헤더 끝 --><br><br><br>

<div id="container">

<div class="price">
	<table border="1px solid" style="width: 100%;">
		<thead>
			<tr>
				<td width="10%;"></td>
				<th width="10%;" class="center">개인석(1인)</th>
				<th width="10%;" class="center">4인실</th>
				<th width="10%;" class="center">8인실</th>
				<th width="10%;" class="center">12인실</th>
			</tr>
		</thead>
		<tr>
			<td>평일 8:00 ~ 18:00</td>
			<td class="center">1시간 1,500원</td>
			<td class="center">1시간 1,800원</td>
			<td class="center">1시간 2,000원</td>
			<td class="center">1시간 2,200원</td>
		</tr>
		<tr>
			<td>평일 18:00 ~ 22:00</td>
			<td class="center">1시간 1,800원</td>
			<td class="center">1시간 2,000원</td>
			<td class="center">1시간 2,000원</td>
			<td class="center">1시간 2,200원</td>
		</tr>
		<tr>
			<td>주말(토,일)</td>
			<td class="center">1시간 1,800원</td>
			<td class="center">1시간 2,000원</td>
			<td class="center">1시간 2,300원</td>
			<td class="center">1시간 2,500원</td>
		</tr>
	</table>
	<hr>
	<p>정기 이용권(1인실)</p>
	<table style="width: 100%;">
		<tr>
			<th width="25%">1일권</th>
			<td width="75%">30,000원</td>
		</tr>
		<tr>
			<th>정기권 2주</th>
			<td>70,000원 (사물함 선택 시 +2,000원)</td>
		</tr>
		<tr>
			<th>정기권 1개월</th>
			<td>150,000원 (사물함 제공)</td>
		</tr>
		<tr>
			<th>야간권(22:00 ~ 다음날 8:00)</th>
			<td>15,000원</td>
		</tr>
	</table>
</div>
<br>
<script>
	function book(frm) {
		if ('${empty usersVO}' == 'true'){
			loginChk();
			return false;
		}
		var title = "bookingPage";
		window.open("", title, "width=1200, height=700, scrollbars=yes");
		
		frm.target = title;
		frm.action = "/TMS/book/booking";
		frm.submit();
	}

</script>

<div style="box-sizing: border-box;">
	<h3>1호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do1.jpg" style="width: auto; height: auto;">
		</div>
		<br>
		<form method="post">
			<input type="hidden" name="br_idx" value="1">
			<button type="button" class="btn btn-outline-secondary"
				style="float: right;" onclick="book(this.form)">예약하기</button>
		</form>
	</div> <!-- boxoutside 끝 -->
</div> <!-- 1 호점 끝 -->

<br><br><br>
<div style="box-sizing: border-box;">
	<h3>2호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do2.jpg" style="width: auto; height: auto;">
		</div>
		<br>
		<form method="post">
			<input type="hidden" name="br_idx" value="2">
			<button type="button" class="btn btn-outline-secondary"
				style="float: right;" onclick="book(this.form)">예약하기</button>
		</form>
	</div> <!-- boxoutside 끝 -->
</div> <!-- 2 호점 끝 -->

<br><br><br>
<div style="box-sizing: border-box;">
	<h3>3호점</h3>
	<hr>
	<div class="boxoutside">
		<div class="boximg">
			<img alt="힘이없을때는 경수를 보자" src="/resources/images/do3.jpeg" style="width: auto; height: auto;">
		</div>
		<br>
		<form method="post">
			<input type="hidden" name="br_idx" value="3">
			<button type="button" class="btn btn-outline-secondary"
				style="float: right;" onclick="book(this.form)">예약하기</button>
		</form>
	</div> <!-- boxoutside 끝 -->
</div> <!-- 3 호점 끝 -->

<br>
<!-- 풋터 -->

</div> <!-- 바디 콘테이너 끝 -->
</body>
</html>