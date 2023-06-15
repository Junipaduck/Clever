<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- 부트스트랩 코드 3줄 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

		<!-- 결제할 상품의 정보 -->
			<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->    
			<input type="hidden" name="auction_idx" value="${param.auction_idx }">    
	        <c:forEach items="${auctionDetail }" var="auctionDetail">
	          <section class="goods_manage_area">
	            <header class="header" role="banner" >
			        <div class="header_inner">
			            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px; margin-bottom: 50px;"></a>
			        </div>
			    </header>
			    <h4>2. 결제할 상품의 정보를 확인해주세요😊</h4>
	               <table style="margin-bottom: 50px;">
	                   <thead>
	                       <tr>
	                           <th></th>
	                           <th>상품명</th>
	                           <th>가격</th>
	                           <th>결제방식</th>
	                           <th>판매자 ID</th>
	                       </tr>
	                   </thead>
	                   <tbody>
	                       <tr>
	                      	 	<c:forEach items="${auctionfileList }" var="auctionfileList"> <!-- 첫번째사진 select 하는 forEach문 -->
	                             	<c:set var="length" value="${fn:length(auctionfileList.file_name) }" />
								<c:set var="index" value="${fn:indexOf(auctionfileList.file_name, '_') }" />
								<c:set var="file_name" value="${fn:substring(auctionfileList.file_name, index + 1, length) }" />
									<c:if test="${auctionfileList.file_num eq auctionDetail.auction_idx }">
	                            		<td><img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 사진"></td>
	                           		</c:if>
	                           </c:forEach>
	                           <td>${auctionDetail.auction_title }</td>
	                           <td>${auctionDetail.auction_final_price }원</td>
	                           <td>계좌이체</td>
	                           <td>${auctionDetail.member_id }</td>
	                       </tr>
                   	 </tbody>
              	 </table>
           	 </section>
           	</c:forEach>
           <!-- // 결제할 상품의 정보 --> 
		  
<%-- <h1>${user_name } 고객님의 계좌 상세정보</h1> --%>
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<th>은행명</th> -->
<!-- 			<th>계좌번호</th> -->
<!-- 			<th>상품명</th> -->
<!-- 			<th>계좌잔액</th> -->
<!-- <!-- 			<th>출금가능금액</th> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td>${account.bank_name }</td> --%>
<%-- 			<td>${account_num_masked }</td> --%>
<%-- 			<td>${account.product_name }</td> --%>
<%-- 			<td>${selectMemberInfo.member_balance }원</td> --%>
<%-- <%-- 			<td>${account.available_amt }</td> --%> 
<!-- 		</tr> -->
<!-- 	</table> -->
	
	
	<!-- 송금 대상 정보 입력 -->
<!-- 	<h1>송금 대상 정보 입력(임시)</h1> -->
	<form action="auction_bank_withdraw" method="post">
		<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->
		<input type="hidden" name="auction_idx" value="${param.auction_idx }">
		<input type="hidden" name="auction_final_price" value="${param.auction_final_price }">
<!-- 		<table border="1"> -->
<!-- 			<tr> -->
<!-- 				<th>예금주명</th> -->
<!-- 				<th>은행코드</th> -->
<!-- 				<th>계좌번호</th> -->
<!-- 				<th>핀테크이용번호</th> -->
<!-- 				<th>송금할 금액</th> -->
<!-- 				<th></th> -->
<!-- 			</tr> -->
<%-- 				<input type="hidden" name="account_holder_name" value="${account.account_holder_name }"> --%>
				<input type="hidden" name="account_num_masked" value="${account_num_masked }"> 
				<input type="hidden" name="account_num_masked" value="${account_num_masked }">
				<input type="hidden" name="id" value="${member.member_id }">
				<input type="hidden" name="user_name" value="${user_name }">
				<input type="hidden" name="recv_client_name" value="${sessionScope.sId }">
				<input type="hidden" name="recv_client_bank_code" value="${account.bank_code_tran }">
				<input type="hidden" name="recv_client_account_num" value="${account_num_masked }">
				<input type="hidden" name="recv_client_fintech_use_num" value="${account.fintech_use_num }">
				<input type="hidden" name="tran_amt" value="10000">
				
<!-- 						<h5>결제를 진행하시겠습니까?<input type="button" value="이전" onclick="javascript:history.back()"><input type="submit" value="다음"></h5> -->
						<h5>결제를 진행하시겠습니까?</h5>	
							<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:left;">
							  <button class="btn btn-primary me-md-2" type="button" onclick="javascript:history.back()" style="background-color: grey; border-color: grey; width: 80px; height: 37px;">이전</button>
							  <button class="btn btn-primary" type="submit" style="width: 80px; height: 37px;">다음</button>
							</div>
						
				
			
<!-- 		</table> -->
	</form>
	
	<div style="margin-top:100px;"></div>
			    
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>