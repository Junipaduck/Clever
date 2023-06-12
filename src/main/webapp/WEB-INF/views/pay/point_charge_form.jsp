<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 포인트 충전</title>
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
</head>
<body>

    <header class="header" role="banner" >
        <div class="header_inner">
            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px; margin-bottom: 50px;"></a>
        </div>
    </header>
	
     	  <!-- 결제할 상품의 정보 -->
			<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->    
			<input type="hidden" name="product_idx" value="${param.product_idx }">    
	        <c:forEach items="${productDetail }" var="productDetail">
	          <section class="goods_manage_area">
	            <header class="header" role="banner" >
			        <div class="header_inner">
			            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px; margin-bottom: 50px;"></a>
			        </div>
			    </header>
			    <h4>1. 결제할 상품의 정보를 확인해주세요😊</h4>
	               <table style="margin-bottom: 50px;">
	                   <thead>
	                       <tr>
	                           <th></th>
	                           <th></th>
	                           <th>가격</th>
	                           <th>결제방식</th>
	                           <th>판매자 ID</th>
	                       </tr>
	                   </thead>
	                   <tbody>
	                       <tr>
	                      	 	<c:forEach items="${fileList }" var="fileList"> <!-- 첫번째사진 select 하는 forEach문 -->
	                             	<c:set var="length" value="${fn:length(fileList.file_name) }" />
								<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
								<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
									<c:if test="${fileList.file_num eq productDetail.product_idx }">
	                            		<td><img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 사진"></td>
	                           		</c:if>
	                           </c:forEach>
	                           <td>${productDetail.product_subject }</td>
	                           <td>${productDetail.product_price }원</td>
	                           <td>계좌이체</td>
	                           <td>${productDetail.member_id }</td>
	                       </tr>
                   	 </tbody>
              	 </table>
           	 </section>
           	</c:forEach>
           <!-- // 결제할 상품의 정보 --> 
	            	 
	            	 
	            	 
	   <!-- fintech 수업의 bank_user_info.jsp 에서 가져옴 -->
		<h4>2. 출금할 계좌를 선택해주세요🤑</h4>
		* ${userInfo.user_name } 고객님의 계좌 목록(사용자 일련번호 : ${sessionScope.user_seq_no })
		<table border="1" style="border-collapse: collapse; text-align:center; margin-bottom: 50px;">
			<tr style="background-color: pink;">
				<th>계좌별칭</th>
				<th>계좌번호</th>
				<th>은행명</th>
				<th>예금주명</th>
				<th>핀테크이용번호</th>
				<th></th>
			</tr>
			<%-- userInfo 객체의 res_list 객체 반복(account 변수에 저장) --%>
			<%-- account 객체(AccountVO)로부터 각 데이터를 꺼내서 테이블에 출력 --%>
			<c:forEach var="account" items="${userInfo.res_list }">
				<tr>
					<td>${account.account_alias }</td>
					<td>${account.account_num_masked }</td>
					<td>${account.bank_name }(${account.bank_code_std })</td>
					<td>${account.account_holder_name }</td>
					<td>${account.fintech_use_num }</td>
					<td>
						<!-- 수업때는 form의 매핑명이 bank_accountDetail 이었는데 지금 관리자에서 사용하고 있으므로 이름을 바꿨습니다. -->
						<form action="point_bank_accountDetail" method="post"> 
	<%-- 						<input type="hidden" name="access_token" value="${sessionScope.access_token }"> --%>
							<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
							<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
							<input type="hidden" name="user_name" value="${userInfo.user_name }">
							<input type="submit" value="계좌선택 &#127875;">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	   <!-- //fintech수업 -->
	
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>