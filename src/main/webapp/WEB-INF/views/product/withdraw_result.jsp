<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클레버 - 계좌이체</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">


<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!--부트스트랩-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">

<!--CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_manage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!-- 햄버거 메뉴 호버시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/market_manage.js"></script>

<style type="text/css">
td, tr, th{ 
    padding: 5px;
}
</style>
</head>
<body>
<!-- 	<h1>출금결과페이지 으아악</h1> -->
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<th>요청일시</th> -->
<!-- 			<th>출금계좌번호</th> -->
<!-- 			<th>예금주명</th> -->
<!-- 			<th>출금금액</th> -->
<!-- 			<th>출금가능금액</th> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td>${result.api_tran_dtm }</td> --%>
<%-- 			<td>${result.account_num_masked }</td> --%>
<%-- 			<td>${result.account_holder_name }</td> --%>
<%-- 			<td>${result.tran_amt } 원</td> --%>
<%-- 			<td>${result.wd_limit_remain_amt } 원</td> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
	<header class="header" role="banner" >
			        <div class="header_inner">
			            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px; margin-bottom: 50px;"></a>
			        </div>
			    </header>
	<h1>${user_name } 고객님의 계좌 상세정보</h1>
	<table border="1">
		<tr>
			<th>은행명</th>
			<th>계좌번호</th>
			<th>상품명</th>
			<th>계좌잔액</th>
<!-- 			<th>출금가능금액</th> -->
		</tr>
		<tr>
			<td>${account.bank_name }</td>
			<td>${account_num_masked }</td>
			<td>${account.product_name }</td>
			<td>${selectMemberInfo.member_balance }원</td>
<%-- 			<td>${account.available_amt }</td> --%>
		</tr>
	</table>
	
	<!-- 송금 대상 정보 입력 -->
	<h5>결제하시겠습니까?</h5>
	<form action="product_bank_deposit" method="post">
		<!-- 실제 송금 과정은 나(출금계좌예금주) -> 기관 -> 상대방(받는계좌예금주) 형태로 이루어지므로
		나의 핀테크 이용번호를 입금 과정에서 함께 사용하므로 포함해서 전달함 -->
<%-- 		<input type="hidden" name="fintech_use_num" value="${fintech_use_num }"> --%>
		<input type="hidden" name="fintech_use_num" value="${result.fintech_use_num }">
		<input type="hidden" name="product_idx" value="${param.product_idx }">
		<input type="hidden" name="product_price" value="${param.product_price }">
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<th>예금주명</th> -->
<!-- 				<th>은행코드</th> -->
<!-- 				<th>계좌번호</th> -->
<!-- 				<th>핀테크이용번호</th> -->
<!-- 				<th>송금할 금액</th> -->
<!-- 				<th></th> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
				<input type="hidden" name="recv_client_name" value="최보아">
				<input type="hidden" name="recv_client_bank_code" value="004">
				<input type="hidden" name="recv_client_account_num"value="13421432">
				<input type="hidden" name="recv_client_fintech_use_num" value="120211385488932372340264">
				<input type="hidden" name="tran_amt" value="10000">
				<input type="submit" value="결제하기">
<!-- 			</tr> -->
<!-- 		</table> -->
	</form>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>