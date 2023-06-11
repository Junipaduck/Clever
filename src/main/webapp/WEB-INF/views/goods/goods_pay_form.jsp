<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 굿즈구매</title>
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
          <!-- 결제정보 -->
<!--       <form action="buyGoods.ad" method="post"> -->
     	<input type="hidden" value="${param.goods_idx }">    
		<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> <!-- 핀테크 이용번호 전달 -->    
          <c:forEach items="${goodsDetail }" var="goodsDetail">
	          <section class="goods_manage_area">
	            <header class="header" role="banner" >
			        <div class="header_inner">
			            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px; margin-bottom: 50px;"></a>
			        </div>
			    </header>
			    <h4>결제정보를 확인해주세요😊</h4>
	                <table style="margin-bottom: 50px;">
	                    <thead>
	                        <tr>
	                            <th></th>
	                            <th></th>
	                            <th>가격</th>
	                            <th>결제방식</th>
	                            <th></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
                        	 	<c:forEach items="${fileList }" var="fileList"> <!-- 첫번째사진 select 하는 forEach문 -->
	                              	<c:set var="length" value="${fn:length(fileList.file_name) }" />
									<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
									<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
										<c:if test="${fileList.file_num eq goodsDetail.goods_idx }">
		                            		<td><img src="${pageContext.request.contextPath }/resources/upload/${file_name}" alt="상품 사진"></td>
	                            		</c:if>
	                            </c:forEach>
	                            <td>${goodsDetail.goods_name }</td>
	                            <td>${goodsDetail.goods_price }원</td>
	                            <td>포인트 결제</td>
	                            <td></td>
	                        </tr>
	                    </tbody>
	                </table>
<%-- 	            <input type="text" name="buy_id" id="buy_id" value="${member.member_id }" readonly="readonly"> --%>
<%-- 	            <input type="text" name="buy_title" id="buy_title" value="${goodsDetail.goods_name }" readonly="readonly"> --%>
<%-- 	            <input type="text" name="buy_price" id="buy_price" value="${goodsDetail.goods_price }" readonly="readonly"> --%>
<%-- 	            <input type="text" name="goods_idx" id="goods_idx" value="${goodsDetail.goods_idx }" readonly="readonly"> --%>
	                <div style="margin-bottom: 50px; margin-left: 100px;">
		                <h5>${member.member_id }님이 보유하신 포인트는 총 ${member.member_point }점 입니다.</h5>
		                <h5>💸포인트로 ${goodsDetail.goods_name }을 구매하시겠습니까?💸 <input type="submit" value="구매하기" onclick="location.href='buyGoods.ad?goods_idx=${goodsDetail.goods_idx}'"></h5>
<%-- 		                <h5>💸포인트로 ${goodsDetail.goods_name }을 구매하시겠습니까?💸 <input type="submit" value="구매하기"></h5> --%>
	                </div>
	            </section>
            </c:forEach>
<!--           </form>   -->
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>