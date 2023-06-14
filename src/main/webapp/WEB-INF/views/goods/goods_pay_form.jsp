<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클레버 - 굿즈구매</title>
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
	<input type="hidden" value="${param.goods_idx }">    
	<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 --> 
	<c:forEach items="${goodsDetail }" var="goodsDetail">
	<header class="header" role="banner" >
        <div class="header_inner">
            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px; margin-bottom: 50px;"></a>
        </div>
	</header>
	<h4 style="text-align: center;">결제정보를 확인해주세요😊</h4>
	<table border="1"  style="margin: auto;">
<%-- 		<c:forEach var="account" items="${userInfo.res_list }"> --%>
			<tr style="background-color: #002fb9; color: white;">
				<th></th>
				<th>상품명</th>
				<th>가격</th>
				<th>결제방식</th>
				<th></th>
			</tr>
            <tr>
	            <c:forEach items="${fileList }" var="fileList"> <!-- 첫번째사진 select 하는 forEach문 -->
		            <c:set var="length" value="${fn:length(fileList.file_name) }" />
					<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
					<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
					<c:if test="${fileList.file_num eq goodsDetail.goods_idx }">
		            	<td><img src="${pageContext.request.contextPath }/resources/upload/${file_name}" alt="상품 사진" style="width: 200px;height: 200px;"></td>
		            </c:if>
	            </c:forEach>
                  <td>${goodsDetail.goods_name }</td>
                  <td>${goodsDetail.goods_price }원</td>
                  <td>적립금 결제</td>
                  <td></td>
             </tr>
	</table>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <div style="margin-bottom: 50px; margin-left: 100px;">
		     <h5>${member.member_id }님이 보유하신 적립금은 총 ${member.member_point }점 입니다.</h5>
		     <h5>💸적립금으로 ${goodsDetail.goods_name }을 구매하시겠습니까?💸 <button class="btn btn-primary" type="button" style="width: 80px; height: 37px;" onclick="location.href='buyGoods.ad?goods_idx=${goodsDetail.goods_idx}'">결제</button></h5>
	    </div>
	</c:forEach>
	
	
	
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>