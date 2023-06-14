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
		  
<!-- fintech 수업의 bank_account_detail.jsp 파일의 내용을 가져옴 -->		    
	<h4>${user_name } 고객님이 선택하신 출금할 계좌의 정보를 확인해주세요😊</h4>
	<table border="1" style="border-collapse: collapse; text-align:center; margin-bottom: 50px;">
			<tr style="background-color: pink;">
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
			<td>${member.member_balance }</td>
			<td>${member.member_balance }</td>
		</tr>
	</table>
	
	<hr>
	
	<!-- 송금 대상 정보 입력 -->
	<h1>포인트 충전</h1>
	<table border="1" style="border-collapse: collapse; text-align:center; margin-bottom: 50px;">
			<tr style="background-color: pink;">
			<th>현재 보유 포인트</th>
		</tr>
		<tr>
			<td>${member.charge_point }</td>
		</tr>
	</table>
	<form action="point_withdraw" method="post">
		<input type="hidden" name="id" value="${member.member_id }">
		<input type="hidden" name="user_name" value="${user_name }">
		<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->
		<input type="hidden" name="recv_client_name" value="${sessionScope.sId }">
		<input type="hidden" name="recv_client_bank_code" value="${account.bank_code_tran }">
		<input type="hidden" name="recv_client_account_num" value="${account_num_masked }">
		<input type="hidden" name="recv_client_fintech_use_num" value="${account.fintech_use_num }">
		<input type="hidden" name="tran_amt" value="10000">
		<input type="hidden" name="member_id" value="${member.member_id }">
		<input type="hidden" name="point_status" value="충전(출금)">
		<input type="hidden" name="account_amt" value="${member.member_balance }">
		
		<table border="1">
			<tr>
<!-- 				<th>예금주명</th> -->
<!-- 				<th>은행코드</th> -->
<!-- 				<th>계좌번호</th> -->
<!-- 				<th>핀테크이용번호</th> -->
				<th>충전할 포인트</th>
				<th></th>
			</tr>
			<tr>
				<td>
					<select name="charge_point" id="charge_point">
						<option value="선택" selected="selected">충전금액을 선택하세요</option>
						<option value="1000">1000원</option>
						<option value="5000">5000원</option>
						<option value="10000">10000원</option>
						<option value="20000">20000원</option>
						<option value="30000">30000원</option>
						<option value="40000">40000원</option>
						<option value="50000">50000원</option>
					</select>
<!-- 				<input type="text" name="charge_point"> -->
				</td>
				<td><input type="submit" value="충전하기"></td>
			</tr>
		</table>
	</form>
<!-- // fintech 수업의 bank_account_detail.jsp 파일의 내용을 가져옴 -->	   
			    
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>