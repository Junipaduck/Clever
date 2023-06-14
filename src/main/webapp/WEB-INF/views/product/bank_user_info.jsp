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
<!--       	 <h1>핀테크 사용자 정보</h1> -->
<%-- 	<h3>${userInfo.user_name } 고객님의 계좌 목록(사용자 일련번호 : ${sessionScope.user_seq_no })</h3> --%>
	<table border="1" style="border-collapse: collapse;">
		<tr style="background-color: pink;">
			<th>계좌별칭</th>
			<th>계좌번호</th>
			<th>은행명</th>
			<th>예금주명</th>
<!-- 			<th>계좌상태</th> -->
<!-- 			<th>핀테크이용번호</th> -->
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
<!-- 				<td></td> -->
<%-- 				<td>${account.fintech_use_num }</td> --%>
				<td>
					<form action="product_bank_accountDetail" method="post">
						<input type="hidden" name="access_token" value="${sessionScope.access_token }">
						<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
						<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
						<input type="hidden" name="user_name" value="${userInfo.user_name }">
						<input type="hidden" name="product_idx" value="${param.product_idx}">
						<input type="hidden" name="product_price" value="${param.product_price}">
						<input type="submit" value="상세조회 &#127875;">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
            
            
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>