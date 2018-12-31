<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/commons/head.jsp"></jsp:include>
</head>
<body>
	<br>
	<br>
	<h1 class="text-center">문의하기</h1>
	<div style="width: 50%; margin: 40px auto;">
		<ul>
			<li>요금 및 지점 이용과 관련한 문의는 해당 지점으로 유선 문의하시는 것이 빠르고 정확합니다.</li>
			<li>문의하신 내용의 답변은 입력하신 이메일로 발송 드리오니 정확하게 입력 부탁드립니다.</li>
			<li>평일 09:00 ~ 17:00에 문의주신 글은 당일 확인 및 답변이 가능합니다. 다만 문의내용에 따라 답변이
				늦어질 수 있습니다.</li>
		</ul>
	</div>
	<form action="/TMS/ask/sendMail" method="post" enctype="multipart/form-data"
		style="width: 50%; margin: 20px auto;">
		<div class="form-group">
			<label for="name">이름</label> <input type="text" class="form-control"
				id="name" name="name" placeholder="이름" required>
		</div>
		<div class="form-group">
			<label for="phone">연락처</label> <input type="tel" class="form-control"
				id="phone" name="phone" placeholder="연락처" required>
		</div>
		<div class="form-group">
			<label for="email">이메일</label> <input type="email"
				class="form-control" name="email" id="email" placeholder="이메일" required>
		</div>
		<div class="form-group">
			<label for="category">문의유형</label> <select id="category" name="category"
				class="form-control">
				<option value="" selected>문의유형을 선택해주세요</option>
				<option value="1">회원정보</option>
				<option value="2">예약관련</option>
				<option value="3">서비스이용</option>
				<option value="4">이벤트</option>
				<option value="5">기타</option>
			</select>
		</div>
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="title" name="title" placeholder="제목" required>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" rows="20" required></textarea>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">[필수] 개인정보 수집 및 이용안내</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="5">㈜거기스는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다. 문의내용 확인 및 답변에 대한 의사소통 경로 확보
수집항목: 이름, 연락처, 메일주소
보유기간: 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성되면 지체 없이 파기하며 보유 기간은 최대 3년을 넘기지 않는 것을 원칙으로 합니다.</textarea>
			<div style="margin-top: 20px; margin-left: 55%;">
				<input type="checkbox" class="custom-control-input"
					id="chk" required> <label
					class="custom-control-label mr-4" for="customControlInline">개인정보
					수집 및 이용에 동의합니다.</label>
				<button type="reset" class="btn btn-outline-primary my-1 ml-2 mr-2">취소</button>
				<button type="submit" class="btn btn-primary my-1">문의</button>
			</div>
		</div>

	</form>
	<script>$("#chk").prop("checked", true);</script>
</body>
</html>