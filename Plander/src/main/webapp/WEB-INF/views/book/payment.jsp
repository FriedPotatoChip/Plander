<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/commons/head.jsp" />

<style>
	body {
		font-family: 'NanumSquare', sans-serif;
		font-weight: 400;
		color: #666;
	}
	
	h5 {
		font-weight: 700;
		font-size: 17px;
	}
	
	.center { text-align: center; }
	
	/* 여기 밑으로 예약 헤더 CSS */
	#chk a { text-decoration: none; }
	#chk {
		width: 100%;
		margin-left: auto;
		margin-right: auto;
	}
	
	ul>li {
		float: left;
		list-style-type: none;
		padding: 0 5% 0 5.5%;
		text-align: center;
		margin-bottom: 20px;
	}
	
	ul>li>a { font-size: 1.1em; }
	
	#chk::after {
		content: "";
		clear: both;
		display: table;
	}
	/* 선택 안할 시 */
	.select { color: gray; }
	.back {
		background-color: gray;
		color: white;
		padding: 0 8px 0 8px;
		border-radius: 25px;
		font-size: 15px;
	}
	
	/* 현재 페이지 */
	.click {
		color: #475C7A;
		font-size: 17px;
	}
	
	.noback {
		background-color: #D8737F;
		color: white;
		padding: 0 8px 0 8px;
		border-radius: 25px;
		font-size: 17px;
	}
	/* 예약 헤더 CSS 끝 */
	
	/* 버튼 */
	button {
		display: inline-block;
		padding: 6px 12px;
		border-radius: 4px;
		font-size: 14px;
		text-align: center;
		background-color: white;
		border: 1px solid #D8737F;
		cursor: pointer;
	}
	
	button:hover {
		border: 1px solid #D8737F;
		background-color: #D8737F;
		color: white;
	}
	/* 버튼 끝 */
	
	.opt {
		display: inline-block;
		padding: .375rem 1.75rem .375rem .75rem;
		font-weight: 400;
		line-height: 1.5;
		color: #4d4d4d;
		vertical-align: middle;
		border-radius: .25rem;
	}
	
	#totalTable { background-color: #f8f9fa; }

</style>
<!-- 아임포트 결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 네이버 페이 -->
<!-- <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script> -->
<script>
	$(function() {
		$("#normalpay").click(
			function() {
				$("#confirm").removeAttr("disabled").css(
						'background-color', 'white').css('color', 'black').css('border', '1px solid #D8737F')
						.attr('type','submit');
				IMP.init('imp52124840');
				IMP.request_pay({
				    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
				    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
				    merchant_uid : bookval, //상점에서 관리하시는 고유 주문번호를 전달
				    name : '주문명:결제테스트',
				    amount : 100,
				    buyer_email : '${usersVO.email}',
				    buyer_name : '${usersVO.name}',
				    buyer_tel : '${usersVO.phone}', //누락되면 이니시스 결제창에서 오류
				    buyer_addr : '${usersVO.roadAddrPart1}',
				    buyer_postcode : '${usersVO.zipNo}'
				}, function(rsp) {
					console.log("서버 연동 시작");
				    if ( rsp.success ) {
				    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				    	console.log("ajax 진입 직전");
				    	jQuery.ajax({
				    		url: "/paymentAjax", //cross-domain error가 발생하지 않도록 주의해주세요
				    		type: 'POST',
				    		dataType: 'json',
				    		data: {
				    			'u_idx' : '${usersVO.u_idx}',
				    			'receipt' : rsp.receipt_url
				    			}
				    	})
				    	alert("결제가 완료되었습니다.");
				    	$("form[name='form1']").submit();
				    } else {
				        var msg = '결제에 실패하였습니다.\n';
				        msg += '에러내용 : ' + rsp.error_msg;
				        
				        alert(msg);
				    }
				});		
	});
		
		var bookval = '${bvo.getStart_time() }'.substring(2, 4)
				+ '${bvo.getStart_time() }'.substring(5, 7)
				+ '${bvo.getStart_time() }'.substring(8, 10) + '-'
				+ '${bvo.getStart_time() }'.substring(11, 13)
				+ '${bvo.getStart_time() }'.substring(14, 16) + '${bvo.s_col}';
		$('#booknum').html('<span>' + bookval + '</span>');
		$("input[name='booknum']").attr('value', bookval);

		//시간에 따른 가격계산
		var startdate = new Date('${bvo.start_time }');
		var enddate = new Date('${bvo.end_time }');
		var startday = startdate.getDay();
		var endday = enddate.getDay();

		var start = startdate.toLocaleString('en-GB').substring(12, 14);
		var end = enddate.toLocaleString('en-GB').substring(12, 14);

		window.sum = 0;
		window.sct_idx = '${bvo.sct_idx }'; //방번호 확인
		var time_idx = '${bvo.time_idx }'; //정기권 확인
		var cabinet = '${bvo.cabinet }'; //사물함 사용여부 y/n

		// 가격표 가져오는 ajax
		$.ajax({
			url : "/getPrice",
			type : "get",
			dataType : 'json',
			success : function(result) {
				var ticket2w = 0;
				var ticketMon = 0;
				var ticketNight = 0;
				var ticketDay = 0;

				var privateAm = 0;
				var privatePm = 0;
				var privateHoliday = 0;
				var privateNight = 1200;

				var labAm = 0;
				var labPm = 0;
				var labHoliday = 0;
				var labNight = 0;

				$.each(result, function(index, value) {

					// 정기권 가격
					if (value.time_idx == 100) {
						ticket2w = value.price;
					} else if (value.time_idx == 101) {
						ticketMon = value.price;
					} else if (value.time_idx == 102) {
						ticketNight = value.price;
					} else if (value.time_idx == 103) {
						ticketDay = value.price;
					}

					// 개인실 가격
					if (value.sct_idx == 1) {
						if (value.time_idx == 1) {
							privateAm = value.price;
						} else if (value.time_idx == 2) {
							privatePm = value.price;
						} else if (value.time_idx == 3) {
							privateHoliday = value.price;
						}
					}
					// 랩실 가격
					if (sct_idx == 2) {
						labNight = 4500;
					} else if (sct_idx == 3) {
						labNight = 7000;
					} else if (sct_idx == '4') {
						labNight = 9000;
					}
					if (sct_idx >= 2 && sct_idx <= 4) {
						if (sct_idx == value.sct_idx) {
							if (value.time_idx == 1) {
								labAm = value.price;
							} else if (value.time_idx == 2) {
								labPm = value.price;
							} else if (value.time_idx == 3) {
								labHoliday = value.price;
							}
						}
					}

				})

				//1. 1인실 sct_idx=1일 때
				if (sct_idx == 1) {
					console.log('sct_idx : ' + sct_idx);
					console.log('time_idx : ' + time_idx);
					//정기권을 구입한 사람들
					//정기권 2주 time_idx ==100
					//사물함 선택 유무확인, 사물함 선택시 +2000
					if (time_idx == 100) {
						sum = ticket2w;
						if (cabinet == 'y') {
							sum += 5000;
						}
					} else if (time_idx > 100) {
						//정기권 1개월
						//야간권 10:00 ~ 8:00
						//1일권
						var tic = 0;
						if (time_idx == 101) {
							tic = ticketMon;
						} else if (time_idx == 102) {
							tic = ticketNight;
						} else if (time_idx == 103) {
							tic = ticketDay;
						}
						sum = tic;
					} else {
						//정기권 X 평일일때
						if (startday != 0 && startday != 6 && endday != 0
								&& endday != 6) {
							if (end > start) {
								for (var i = start; i < end; i++) {
									console.log('i : ' + i);
									if (8 <= i && i < 18) {
										sum += privateAm;
										console.log('i : ' + i + ', sum : '
												+ sum);
									} else if (i >= 18 && i < 22) {
										sum += privatePm;
										console.log('i : ' + i + ', sum : '
												+ sum);
									} else {
										sum += privateNight;
										console.log('여기까지 확인');
									}
								} //for문 끝
							} else {
								for (var i = start; i < 24; i++) {
									console.log('i : ' + i);
									if (8 <= i && i < 18) {
										sum += privateAm;
										console.log('i : ' + i + ', sum : '
												+ sum);
									} else if (i >= 18 && i < 22) {
										sum += privatePm;
										console.log('i : ' + i + ', sum : '
												+ sum);
									} else {
										sum += privateNight;
										console.log('여기까지 확인');
									}
								} //for문 끝
								for (var i = 0; i < end; i++) {
									console.log('i : ' + i);
									if (8 <= i && i < 18) {
										sum += privateAm;
										console.log('i : ' + i + ', sum : '
												+ sum);
									} else if (i >= 18 && i < 22) {
										sum += privatePm;
										console.log('i : ' + i + ', sum : '
												+ sum);
									} else {
										sum += privateNight;
										console.log('여기까지 확인');
									}
								} //for문 끝
							} // 평일 계산 끝
						} else if ((startday == 6 && endday == 0)
								|| (startday == 6 && endday == 6)
								|| (startday == 0 && endday == 0)) { // (토, 일), 토, 일 일때
							if (end > start) {
								for (var i = start; i < end; i++) {
									sum += privateHoliday;
								} //for문 끝
							} else {
								for (var i = start; i < 24; i++) {
									sum += privateHoliday;
								}
								for (var i = 0; i < end; i++) {
									sum += privateHoliday;
								}
							}
						} else if (endday == 6 && startday == 5) { // 금, 토 일때
							for (var i = start; i < 24; i++) {
								console.log('i : ' + i);
								console.log("금, 토 들어옴");
								if (8 <= i && i < 18) {
									sum += privateAm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else if (i >= 18 && i < 22) {
									sum += privatePm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else {
									sum += privateNight;
									console.log('여기까지 확인');
								}
							} //for문 끝
							for (var i = 0; i < end; i++) {
								sum += privateHoliday;
							}
						} else if (startday == 0 && endday == 1) { // 일, 월 일때
							for (var i = 0; i < end; i++) {
								console.log('i : ' + i);
								if (8 <= i && i < 18) {
									sum += privateAm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else if (i >= 18 && i < 22) {
									sum += privatePm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else {
									sum += privateNight;
									console.log('여기까지 확인');
								}
							} //for문 끝
							for (var i = start; i < 24; i++) {
								sum += privateHoliday;
							}
						}
					}

				} else if (sct_idx >= 2 && sct_idx <= 4) {
					//랩실 일 때
					console.log('랩실 sct_idx : ' + sct_idx);
					if (startday != 0 && startday != 6 && endday != 0
							&& endday != 6) { // 평일일때
						if (end > start) {
							for (var i = start; i < end; i++) {
								console.log('i : ' + i);
								if (8 <= i && i < 22) {
									sum += labAm;
									console.log('i : ' + i + ', sum : ' + sum);
								} else {
									sum += labNight;
									console.log('4인실 여기까지 확인');
								}
							}
						} else {
							for (var i = start; i < 24; i++) {
								sum += labAm;
							}
							for (var i = 0; i < end; i++) {
								sum += labAm;
							}
						}
					} else if ((startday == 6 && endday == 0)
							|| (startday == 6 && endday == 6)
							|| (startday == 0 && endday == 0)) { // (토, 일), 토, 일 일때
						if (end > start) {
							for (var i = start; i < end; i++) {
								sum += labHoliday;
							}
						} else {
							for (var i = start; i < 24; i++) {
								sum += labHoliday;
							}
							for (var i = 0; i < end; i++) {
								sum += labHoliday;
							}
						}
					} else if (endday == 6 && startday == 5) { // 금, 토 일때
						for (var i = start; i < 24; i++) {
							if (8 <= i && i < 22) {
								sum += labAm;
								console.log('i : ' + i + ', sum : ' + sum);
							} else {
								sum += labNight;
								console.log('4인실 여기까지 확인');
							}
						}
						for (var i = 0; i < end; i++) {
							sum += labHoliday;
						}
					} else if (startday == 0 && endday == 1) { // 일, 월 일때
						for (var i = 0; i < end; i++) {
							if (8 <= i && i < 22) {
								sum += labAm;
								console.log('평일 8시~22 시 : ' + price);
								console.log('i : ' + i + ', sum : ' + sum);
							} else {
								sum += labNight;
								console.log('4인실 여기까지 확인');
							}
						}
						for (var i = start; i < 24; i++) {
							sum += labNight;
						}
					}

				} else {
					alert("담당자에게 연락주세여..");
				}

				console.log('최종 가격 확인 sum : ' + sum);
				finalPrice = sum;
				var chkLen = "${chkLen}";
				document.form1.chkLen.value = chkLen;

				if (chkLen == 2) {
					$('#bookprice').html('<span>' + (sum * 2) + ' 원<br><span style="font-size: 0.8em;">('+sum+' x 2)</span></span>');
					sum *= 2;
				} else {
					$('#bookprice').html('<span>' + sum + '원</span>');
				}

				$("input[name='price']").attr('value', sum);
				console.log("확인 price : " + sum + ", booknum : " + bookval);

			},
			error : function(error) {

			}
		})

/* 		//네이버 페이 결제화면 호출
		//여기 확인 
		var oPay = Naver.Pay.create({ //SDK Parameters를 참고 바랍니다.
			"clientId" : "u86j4ripEt8LRfPGzQ8"
		//"chainId" : "{그룹형일 경우 chainId를 넣어주세요}"
		});

		//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
		var elNaverPayBtn = document.getElementById("naverpay");

		elNaverPayBtn.addEventListener("click", function() {
			oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
				"merchantPayKey" : "partnder-orderkey",
				"productName" : "[거북이의 기적]",
				"productCount" : 1,
				"totalPayAmount" : finalPrice,
				"taxScopeAmount" : finalPrice,
				"taxExScopeAmount" : 0,
				"returnUrl" : "/payment/payok",
				"productItems" : [ {
					"categoryType" : "ETC",
					"categoryId" : "ETC",
					"uid" : "1234",
					"name" : "test",
					"count" : 1
				} ]
			});

		});

		oPay.close(); //결제화면 호출 끝 */

		//사물함 사용여부
		var bookCab1 = '${cb.cb_idx }';
		var bookCab2 = '${cb.cb_idx_2 }';
		var bookCab = bookCab1 + "," + bookCab2;

		console.log("cb_idx 확인 : " + bookCab1 + ", cb_idx_2 : " + bookCab2);
		console.log("bookCab : " + bookCab);

		var arr = new Array;
		arr = bookCab.split(',');
		console.log("arr : " + arr);
		var fv = arr[0];
		var sv = arr[1];
		console.log("fv : " + fv + ", sv : " + sv);

		var chkLen = "${chkLen}";
		if (bookCab != ",") {
			if (chkLen == 2) {
				//2명 예약
				$('#cb_idx').html('<span>' + fv + '번, ' + sv + '번</span>');
				$("input[name='cb_idx']").attr('value', fv); //첫번째 값
				$("input[name='cb_idx_2']").attr('value', sv); //두번째 값
				$("input[name='cab']").attr('value', bookCab);
			} else {
				$('#cb_idx').html('<span>' + bookCab1 + '번</span>');
				$("input[name='cb_idx']").attr('value', bookCab1);
				$("input[name='cb_idx_2']").attr('value', 0);
				$("input[name='cab']").attr('value', bookCab1);
			}

		} else {
			$('#cb_idx').html('<span>사용안함</span>');
			$("input[name='cb_idx']").attr('value', 0);
			$("input[name='cb_idx_2']").attr('value', 0);
			$("input[name='cab']").attr('value', 0);
		}

	});

	//네이버페이
</script>
<script>
	function payment(frm) {

		if (finalPrice == 0) {
			finalPrice = sum;
		}
		$("#hiddenPrice").val(finalPrice);
		var couponVal = $("#coupon").val();
		if (couponVal != 0) {
			$.ajax({
				url : '/minusCoupon',
				type : 'get',
				data : {
					'cp_idx' : cp_idx
				},
				dataType : 'text',
				success : function(result) {
					if (result == 'success') {
						console.log("성공");
						frm.submit();
					} else if (result == 'fail') {
						alert("예매 진행에 실패하였습니다.\n관리자에게 문의 해주세요.");
						return false;
					}
				},
				error : function(error) {
					alert("예매 진행에 실패하였습니다.\n관리자에게 문의 해주세요.");
					return false;
				}
			})
		} else {
			frm.submit();
		}
		form1.action = "/book/payok";
		form1.submit();
	}
</script>

</head>
<body>
	<div id="container">
		<br>
		<!-- 예약 헤더 -->
		<div id="chk">
			<ul>
				<li><a class="menu" href="/book/booking?br_idx=${bvo.br_idx }">
					<b><span id="num" class="back">STEP1</span>
					<span id="select" class="select">날짜선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu" onclick="backSub()" style="cursor: pointer;">
					<b><span id="num" class="back">STEP2</span>
					<span id="select" class="select">좌석선택</span></b>
				</a></li>
				<li>&gt;</li>
				<li><a class="menu"> <b><span id="num" class="noback">STEP3</span>
					<span id="select" class="click">결제하기</span></b>
				</a></li>
			</ul>
		</div>
		<hr>
		<!-- 예약 헤더끝 -->

		<div class="boxoutside">
			<form method="post" name="form1" action="/book/payok">
				<br>
				<div style="padding: 10px;">
					<h5 style="color: #475C7A;">예매자 확인</h5>
					<p>☑ 일정 및 인원에 변동사항이 있는 경우는 가능한 빨리 전화로 알려주세요.</p>
					<p>☑ 취소의 경우 하루 전 6시까지만 가능하며 당일 취소의 경우 최소 기본비용(최소인원*2시간)을 지불하셔야
						합니다.</p>
					<p>☑ 시간 추가를 원하시는 경우 반드시 카운터에 문의 바랍니다.</p>
				</div>
				<!-- 예매자 확인 끝 -->

				<div id="totalTable">
					<div id="mybookinfo" style="padding: 10px;">
						<h5 style="color: #475C7A;">나의 예약 정보</h5>
						<table border="1px solid;" class="table table-bordered"
							style="width: 100%; text-align: center;">
							<tbody>
								<tr>
									<td width="13%">예매번호</td>
									<td width="10%">예약자 이름</td>
									<td width="12%">연락처</td>
									<td width="30%">예약 날짜 및 시간</td>
									<td width="15%">선택 좌석정보</td>
									<td width="10%">사물함</td>
									<td width="10%">금액</td>
								</tr>
								<tr>
									<td id="booknum"></td>
									<td>${uservo.name }</td>
									<td>${uservo.phone }</td>
									<td>${bvo.start_time }~${bvo.end_time }</td>
									<c:choose>
										<c:when test="${bvo.sct_idx == 1 }">
											<td>${bvo.sct_name }-${test }</td>
										</c:when>
										<c:otherwise>
											<td>${bvo.sct_name }-${bvo.s_col }</td>
										</c:otherwise>
									</c:choose>
									<td id="cb_idx"></td>
									<td id="bookprice"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 나의 예약 정보 끝 -->

					<!-- 결제방식 선택 -->
					<div id="pay" class="radio" style="padding: 10px;">
						<h5 style="color: #475C7A;">사용 가능한 쿠폰</h5>
						<select id="coupon" class="opt">
							<option value="0">------</option>
						</select>
						<span id="finPrice"></span>
						<br><br><br>
						
						<h5 style="color: #475C7A;">결제방식 선택</h5>
						<div>
							<!-- <button type="button" id="naverpay">네이버 페이</button> -->
							<button type="button" id="normalpay">일반결제</button>
						</div>
						<br>
					</div>
					<!-- <label class="radio-inline">
						<input type="radio" name="pay" id="kakaopay" value="1">카카오페이</label> -->
					<!-- <label class="radio-inline">
						<input type="radio" name="pay" id="naverpay" value="2">네이버페이</label><br> -->
					<!-- <label class="radio-inline">
						<input type="radio" name="pay" id="payTest" value="3">결제</label><br> -->

				</div>
				<div class="center" style="padding: 10px;">
					<br>
					<button type="button" onclick="backSub()">이전단계</button>&nbsp;
					<button type="button" id="confirm" disabled="disabled"
						style="background-color: white; border: 1px solid lightgray; color: lightgray;">확인</button>
				</div>

				<input type="hidden" name="booknum" value="">
				<input type="hidden" name="price" value="">
				<input type="hidden" name="br_idx" value="${bvo.br_idx }">
				<input type="hidden" name="sct_idx" value="${bvo.sct_idx }">
				<input type="hidden" name="sct_name" value="${bvo.sct_name }">
				<input type="hidden" name="s_col" value="${bvo.s_col }">
				<input type="hidden" name="s_col_2" value="${bvo.s_col_2 }">
				<input type="hidden" name="cb_idx" value="">
				<input type="hidden" name="cb_idx_2" value="">
				<input type="hidden" name="cabinet" value="${bvo.cabinet }">
				<input type="hidden" name="start_time" value="${bvo.start_time }">
				<input type="hidden" name="end_time" value="${bvo.end_time }">
				<input type="hidden" name="s_idx" value="${svo.s_idx }">
				<input type="hidden" name="s_idx_2" value="${svo.s_idx_2 }">
				<input type="hidden" name="test" value="${test }">
				<input type="hidden" name="chkLen" value="">
				<input type="hidden" name="cab" value="">
				<input type="hidden" name="roomnum" value="${bvo.roomnum }">
				<input type="hidden" name="time_idx" value="${bvo.time_idx }">
				<!-- 결제방식 선택 끝  -->

			</form>
		</div>
		<!-- 박스 아웃사이드 끝 -->
		<br> <br> <br>
		<%-- 		지금예약 : ${bvo }<br>${uservo }<br>${svo }<br>${idx }<br>${cb } --%>

	</div>
	<!-- 바디 콘테이너 끝 -->

<script>
function backSub(){
	var frm = document.form1;
	frm.action = "/book/selectSeat";
	frm.submit();
}
</script>
	<script>
		$(document).ready(function() {
			window.finalPrice = 0;
			$.ajax({
				url : "/couponList",
				type : "get",
				data : {
					"id" : "${usersVO.id}"
				},
				dataType : "json",
				success : function(result) {

					var html = "";
					if (result == "") {
						html += "<option value='0' type='0' price='0'>없음</option>";
					} else {
						$.each(result, function(index, value) {
							if ((value.cb_roomtype == 'LAB' && sct_idx != 1)
									|| (value.cb_roomtype == 'PRIVATE' && sct_idx == 1)
									|| (value.cb_roomtype == 'ALL')) {
								html += "<option value='"+value.cp_idx+"' type='"+value.cb_distype+ "' price='"+value.cb_discount+"'>"
										+ value.cb_name
										+ " "
										+ value.cb_discount;
								if (value.cb_distype == 'PERCENT') {
									html += "%";
								} else if (value.cb_distype == 'PRICE') {
									html += "원";
								}
								html += "("
										+ value.cp_quantity
										+ " 개)";
								html += "</option>";
							}
						});
					}
					$("#coupon").append(html);

				},
				error : function(error) {

				}
			});
		});

		$("#coupon").on("change", function() {
			finalPrice = sum;
			var option = $('option:selected', this);
			window.cp_idx = option.attr("value");
			var type = option.attr("type");
			var price = option.attr("price");
			console.log("cp_idx: " + cp_idx);
			var couponPrice = "";
			// 퍼센트 쿠폰
			if (type == 'PERCENT') {
				finalPrice = (finalPrice * (100 - price)) / 100;
				couponPrice += "쿠폰 적용 가격: " + sum + " * "
						+ ((100 - price) / 100)
						+ " = <span style='color: red;'>" + finalPrice
						+ "</span> 원";
			}

			// 금액 쿠폰
			if (type == 'PRICE') {
				finalPrice -= price;
				couponPrice += "쿠폰 적용 가격: " + sum + " - " + price
						+ " = <span style='color: red;'>" + finalPrice
						+ "</span> 원";
			}
			finalPrice = Math.floor(finalPrice);
			$("#finPrice").html(couponPrice);
			 
			$("input[name='price']").attr('value', finalPrice);
		})
	</script>
</body>
</html>