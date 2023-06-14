<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
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
	<h4>3. 본인계좌 최종확인 후 결제를 진행해주세요💸</h4>
	<table border="1" >
<%-- 		<c:forEach var="account" items="${userInfo.res_list }"> --%>
			<tr style="background-color: #002fb9; color: white;">
				<th>은행명</th>
				<th>계좌번호</th>
				<th>계좌별칭</th>
<!-- 				<th>예금주명</th> -->
				<th>현재잔액</th>
	<!-- 			<th>출금가능금액</th> -->
			</tr>
			<tr>
				<td>${account.bank_name }</td>
				<td>${account_num_masked }</td>
				<td>${account.product_name }</td>
<%-- 				<td>${account.account_holder_name }</td> --%>
				<td>${selectMemberInfo.member_balance }원</td>
	<%-- 			<td>${account.available_amt }</td> --%>
			</tr>
<%-- 		</c:forEach> --%>
	</table>
	
	<div style="margin-top:50px;"></div>
		
	<!-- 송금 대상 정보 입력 -->
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
<!-- 				<h5>결제하시겠습니까?<input type="button" value="이전" onclick="javascript:history.back()"><input type="submit" value="결제하기"></h5> -->
						<h5>결제하시겠습니까?</h5>	
							<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:left;">
							  <button class="btn btn-primary me-md-2" type="button" onclick="javascript:history.back()" style="background-color: grey; border-color: grey; width: 80px; height: 37px;">이전</button>
							  <button class="btn btn-primary" type="submit" style="width: 80px; height: 37px;">결제</button>
							</div>



<!-- 			</tr> -->
<!-- 		</table> -->
	</form>
	<!-- 풋터 시작 -->
	
	<div style="margin-top:100px;"></div>
	
	
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>