<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 바로구매</title>
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
		<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->    
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
			<th>출금가능금액</th>
		</tr>
		<tr>
			<td>${account.bank_name }</td>
			<td>${account_num_masked }</td>
			<td>${account.product_name }</td>
			<td>${account.balance_amt }</td>
			<td>${account.available_amt }</td>
		</tr>
	</table>
	
	<hr>
	
	<!-- 송금 대상 정보 입력 -->
	<h1>송금 대상 정보 입력(임시)</h1>
	<form action="product_bank_withdraw" method="post">
		<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->
		<input type="hidden" name="product_idx" value="${param.product_idx }">
		<input type="hidden" name="product_price" value="${param.product_price }">
		<table border="1">
			<tr>
				<th>예금주명</th>
				<th>은행코드</th>
				<th>계좌번호</th>
				<th>핀테크이용번호</th>
				<th>송금할 금액</th>
				<th></th>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value="${member.member_id }"></td>
				<td><input type="hidden" name="user_name" value="${user_name }"></td>
				<td><input type="hidden" name="recv_client_name" value="${sessionScope.sId }"></td>
				<td><input type="hidden" name="recv_client_bank_code" value="${account.bank_code_tran }"></td>
				<td><input type="hidden" name="recv_client_account_num" value="${account_num_masked }"></td>
				<td><input type="hidden" name="recv_client_fintech_use_num" value="${account.fintech_use_num }"></td>
				<td><input type="hidden" name="tran_amt" value="10000"></td>
				<td>
						<input type="submit" value="송금(출금이체)">
				</td>
			</tr>
		</table>
	</form>
			    
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>