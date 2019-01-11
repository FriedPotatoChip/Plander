<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Noto+Sans+KR" rel="stylesheet">
<script>
	function payTest() {
		frm.action="/TMS/book";
		frm.submit();
	}
</script>
   
</head>
<body>
<%-- 카카오페이 
	cid					가맹점 코드. 10자					O	String
	partner_order_id	가맹점 주문번호. 최대 100자				O	String
	partner_user_id		가맹점 회원 id. 최대 100자				O	String
	item_name			상품명. 최대 100자					O	String
	quantity			상품 수량							O	Integer
	total_amount		상품 총액							O	Integer
	tax_free_amount		상품 비과세 금액						O	Integer
	approval_url		결제 성공시 redirect url. 최대 255자	O	String
	cancel_url			결제 취소시 redirect url. 최대 255자	O	String
	fail_url			결제 실패시 redirect url. 최대 255자	O	String

 --%>
 
 
 <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"
    data-client-id="u86j4ripEt8LRfPGzQ8"
    data-merchant-pay-key="partnder-orderkey"
    data-product-name="네이버페이 테스트"
    data-total-pay-amount="100"
    data-tax-scope-amount="100"
    data-tax-ex-scope-amount="0"
    
    data-return-url="/TMS/payment/naverPay">
</script>
<hr>


<form method="post" name="frm" onsubmit="payTest()" >
<!-- 	<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼" > -->
<!-- 	<input type="radio" name="pay" id="naverPayBtn" value="2">네이버페이 -->
	<input type="radio" name="pay" id="testpay" value="3">결제
	<button type="button">결제테스트</button>
	<button type="button" id="naverPayBtn">네이버페이</button>
	<button type="submit" id="pay">결제</button>
</form>


<!-- <a id="naverPayBtn"><img width="5%" src="/resources/images/turtle.png" alt="네이버페이"></a> -->

<!-- 

네이버 페이
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
	var oPay = Naver.Pay.create({ //SDK Parameters를 참고 바랍니다.
		"clientId": "u86j4ripEt8LRfPGzQ8"
		//"chainId" : "{그룹형일 경우 chainId를 넣어주세요}"
	});
	
	//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
	var elNaverPayBtn = document.getElementById("naverPayBtn");

    /*
    merchantPayKey: 가맹점 주문내역 확인 가능한 가맹점 결제번호 또는 주문번호를 전달해야 합니다.
    productName: 대표 상품명
    productCount: 상품 수량 예: A 상품 2개 + B 상품 1개의 경우 productCount 3으로 전달
    totalPayAmount: 총 결제 금액
    taxScopeAmount: 과세 대상 금액. 과세 대상 금액 + 면세 대상 금액 = 총 결제 금액
    taxExScopeAmount: 면세 대상 금액. 과세 대상 금액 + 면세 대상 금액 = 총 결제 금액
    returnUrl: 결제 인증 결과 전달 URL, 결제 완료 후 이동할 URL(returnUrl + 가맹점 파라미터 전달이 가능합니다)
    			네이버페이는 결제 작업 완료 후, 가맹점이 등록한 returnUrl로 리디렉션을 수행합니다 가맹점은 이를 활용하여 내부 처리를 수행하거나
    			구매자에게 결제 결과 화면을 노출할 수 있습니다
    productItems(Array): productItem 배열. 자세한 내용은 아래 "표 2 productItem"을 참고 바랍니다
    
    --productItem 배열
    categoryType: 결제 상품 유형
    categoryId: 결제 상품 유형
    uid: 결제 상품 유형
    name: 상품명
    count: 결제 상품 개수. 기본값은 1
    */
    

	//네이버 페이 결제화면 호출
    elNaverPayBtn.addEventListener("click", function() {
    	oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
			"merchantPayKey" : "partnder-orderkey",
			"productName" : "커스텀 결제",
			"productCount" : 1,
			"totalPayAmount" : 100,
			"taxScopeAmount" : 100,
			"taxExScopeAmount" : 0,
			"returnUrl" : "/TMS/payment/naverPay",
			"productItems" : [ {
				"categoryType" : "ETC",
				"categoryId" : "ETC",
				"uid" : "1234",
				"name" : "test",
				"count" : 1
			} ]
		});
		oPay.close();
	}); //결제화면 호출 끝
</script>

 -->
</body>


</html>