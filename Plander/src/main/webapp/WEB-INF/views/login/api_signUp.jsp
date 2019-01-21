<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/commons/head.jsp" />
<meta charset="UTF-8">
<title>api로그인 회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function goPopup() {
		var pop = window.open("/juso", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.getElementById("roadAddrPart1").value = roadAddrPart1;
		document.getElementById("addrDetail").value = addrDetail;
		document.getElementById("zipNo").value = zipNo;
	}
</script>
</head>
<body>
	<!-- 헤더 -->
	<c:if test="${empty user }"><jsp:include
			page="/commons/header.jsp" /></c:if>
			
	<form action="/signUp_api" method="post" name="joinform">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<div class="row">
						<div class="col-9">
							<input class="form-control" type="text" name="id" id="id"
								onkeypress="chkFalse()" required>
						</div>
						<div class="col-3">
							<input class="form-control" type="button"
								style="background-color: #FCBB6D; color: white;" id="chkId"
								value="id 중복체크" onClick="idChkBtn()">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input class="form-control" type="text" name="phone"
					id="phone" required></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input class="form-control" type="hidden" id="confmKey"
					name="confmKey" value="">

					<div class="row">
						<div class="col-9">
							<input class="form-control" type="text" id="zipNo" name="zipNo"
								readonly>
						</div>
						<div class="col-3">
							<!-- 우편번호 -->
							<input class="form-control" type="button"
								style="background-color: #FCBB6D; color: white;" value="주소검색"
								onclick="goPopup();">
						</div>
					</div></td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td><input class="form-control" type="text"
					name="roadAddrPart1" id="roadAddrPart1" readonly></td>
				<!-- 도로명 주소 -->
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input class="form-control" type="text" name="addrDetail"
					id="addrDetail" value="" required> <!-- 상세주소 --></td>
			</tr>
			<tr>
				<td colspan="2"><input class="form-control btn"
					style="background-color: #475C7A; color: white;" type="button"
					value="회원가입" id="submitBtn" onclick="join()"></td>
			</tr>
		</table>
	</form>

	<script>
		var idChk = false;

		/* 빈칸 체크 */
		function join() {

			var frm = document.joinform;

			var testPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			var testId = /^[0-9a-zA-Z]+$/;

			var tel = frm.phone.value;
			var id = frm.id.value;

			if (!frm.id.value) {
				alert("아이디를 입력해주세요.");
				frm.id.focus();
				return false;
			}
			if (!testId.test(id)) {
				alert("아이디는 영문, 숫자 조합만 사용 가능합니다.");
				frm.id.focus();
				return false;
			}

			if (!frm.phone.value) {
				alert("핸드폰 번호를 입력해주세요.");
				frm.phone.focus();
				return false;
			}
			if (!testPhone.test(tel)) {
				alert('유효하지 않은 번호입니다.');
				frm.phone.value = "";
				frm.phone.focus();
				return false;
			}

			if (!frm.roadAddrPart1.value) {
				alert("주소를 입력해주세요");
				frm.address.focus();
				return false;
			}

			if (!idChk) {
				alert("id중복체크를 해주세요");
				return false;
			}

			frm.action = "/signUp_api";
			frm.submit();

		}

		function chkFalse() {
			idChk = false;
		}

		/* 아이디 중복체크 */
		function idChkBtn() {
			var frm = document.joinform;

			if (!frm.id.value) {
				alert("아이디를 입력해주세요.");
				frm.id.focus();
				return false;
			}

			$
					.ajax({
						url : "/idChk_api",
						type : 'get',
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						data : {
							'id' : frm.id.value
						},
						dataType : 'text',
						success : function(data) {

							if (data == 'ok') {
								idChk = true;
								alert("사용 가능한 아이디입니다.");
							} else if (data == 'no') {
								idChk = false;
								alert("사용 불가능한 아이디입니다.\n다른 아이디를 입력해 주세요.");
							}

						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("에러 발생~~ \n" + textStatus + " : "
									+ errorThrown);
						}
					});

		}
	</script>
</body>
</html>