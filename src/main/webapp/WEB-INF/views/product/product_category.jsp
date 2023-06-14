<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clever - 중고상품</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_category.css">

<!--js-->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>
<style type="text/css">
.goods_info  {
height: 90px;
}
#textDiv {
	margin-top: 100px;
}

div .category_box {
color: #4f4f4f;
text-decoration: none;
font-size: 12px;
font-weight: 500;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
	
    <!-- main_content 영역 -->
        <div id="background_main">
            <div id="main_content">
                <!-- 카테고리 -->
<!--                 <div id="category"> -->
<!--                     <p id="home"> -->
<!--                         <span> -->
<%--                             <img src="${pageContext.request.contextPath }/resources/images/market/home.png" alt="home"> --%>
<!--                         </span> -->
<!--                         <a href="auction"><span>홈</span></a> -->
<!--                     </p> -->
<!--                     <p id="entire"> -->
<!--                         <span> -->
<!--                             <i class="bi bi-chevron-right"></i> -->
<!--                         </span> -->
<!--                         <span> -->
<!--                             <ul class="entire_bar"> -->
<%--                                 <c:if test="${not empty bigCategory }"> --%>
<%-- 	                                <li><a href="product_category?param=${bigCategory }">${bigCategory }</a></li> --%>
<%--                                 </c:if> --%>
<%--                                 <c:if test="${not empty midCategory }"> --%>
<%-- 	                                <li><a href="product_category?param=${midCategory[0].bigCategory }">${midCategory[0].bigCategory }</a></li> --%>
<%--                                 </c:if> --%>
<%--                                 <c:if test="${not empty smallCategory }"> --%>
<%-- 	                                <li><a href="product_category?param=${smallCategory[0].bigCategory }">${smallCategory[0].bigCategory }</a></li> --%>
<%--                                 </c:if> --%>
<%--                                 <c:forEach items="${bigCategorys }" var="big"> --%>
<%--                                		<li id="big" class="hidden_menu"><a href="product_category?param=${big.bigCategory }">${big.bigCategory }</a></li> --%>
<%--                                 </c:forEach> --%>
                                
<!--                             </ul> -->
<!--                             <i class="bi bi-chevron-down under_direction"></i> -->
<!--                         </span> -->
<!--                     </p> -->
<!-- 	                    <p id="category_clothes"> -->
<!-- 	                        <span> -->
<!-- 	                            <i class="bi bi-chevron-right"></i> -->
<!-- 	                        </span> -->
<!-- 	                        <span> -->
<!-- 	                            <ul class="category_clothes_bar"> -->
<%-- 	                                <c:if test="${not empty midCategory }"> --%>
<%-- 		                                <li><a href="#">${midCategory[0].midCategory }</a></li> --%>
<%-- 	                                </c:if> --%>
<%-- 	                                <c:if test="${not empty smallCategory }"> --%>
<%-- 		                                <li><a href="#">${smallCategory[0].midCategory }</a></li> --%>
<%-- 	                                </c:if> --%>
<%--                                 <c:forEach items="${midCategorys }" var="mid"> --%>
<%--                                		<li id="big" class="hidden_menu"><a href="product_category?param=${mid.midCategory }">${mid.midCategory }</a></li> --%>
<%--                                 </c:forEach> --%>
<!-- 	                            </ul> -->
<!-- 	                            <i class="bi bi-chevron-down under_direction"></i> -->
<!-- 	                        </span> -->
<!-- 	                    </p> -->
<%--                     <c:if test="${not empty midCategory or not empty smallCategory }"> --%>
<!-- 	                    <p id="category_clothes"> -->
<!-- 	                        <span> -->
<!-- 	                            <i class="bi bi-chevron-right"></i> -->
<!-- 	                        </span> -->
<!-- 	                        <span> -->
<!-- 	                            <ul class="category_acc_bar"> -->
<%-- 		                                <li><a href="#">${smallCategory[0].smallCategory }</a></li> --%>
<%-- 	                            <c:forEach items="${smallCategorys }" var="smalls"> --%>
<%--                                		<li id="big" class="hidden_menu"><a href="product_category?param=${smalls.smallCategory }">${smalls.smallCategory }</a></li> --%>
<%--                                 </c:forEach> --%>
<!-- 	                            </ul> -->
<!-- 	                            <i class="bi bi-chevron-down under_direction"></i> -->
<!-- 	                        </span> -->
<!-- 	                    </p> -->
<%--                     </c:if> --%>
                    
<!--                 </div> -->
                
                <!--하위 카테고리 (중분류 선택된 경우만 표시, 하위카테고리 선택시 표시 X)-->
<!--                 <div class="category_under"> -->
<!--                     <div class="category_box"> -->
<!--                         현재 카테고리 -->
<!--                             <span><i class="bi bi-chevron-right"></i></span> -->
<!--                     </div> -->
<%--                     <c:if test="${not empty bigCategory }"> --%>
<%-- 	                    <div class="category_box">${bigCategory }</div> --%>
<!-- 	                    <div class="category_box"></div> -->
<!-- 	                    <div class="category_box"></div> 자리 남아도 5개 유지 -->
<!-- 	                    <div class="category_box"></div> -->
<%--                     </c:if> --%>
<%--                     <c:if test="${not empty midCategory }"> --%>
<%-- 	                    <div class="category_box">${midCategory[0].midCategory } ></div> --%>
<%-- 	                    <div class="category_box">${midCategory[0].bigCategory }</div> --%>
<!-- 	                    <div class="category_box"></div> 자리 남아도 5개 유지 -->
<!-- 	                    <div class="category_box"></div> -->
<%--                     </c:if> --%>
<%--                     <c:if test="${not empty smallCategory }"> --%>
<%-- 	                    <div class="category_box">${smallCategory[0].bigCategory } ></div> --%>
<%-- 	                    <div class="category_box">${smallCategory[0].midCategory} ></div> --%>
<%-- 	                    <div class="category_box">${smallCategory[0].smallCategory }</div> <!--자리 남아도 5개 유지--> --%>
<!-- 	                    <div class="category_box"></div> -->
<%--                     </c:if> --%>
<!--                 </div> -->

                <section class="main_goods">
                <h2 align="center">${categoryParam } 카테고리의 상품들</h2>
                <br>
                <div class="goods_wrap">
                    <c:forEach items="${productList }" var="product" end="4"> 
                    <div class="goods">
                        <a href="product_detail?product_idx=${product.product_idx}">
                        <c:forEach items="${fileList }" var="file">
                        
                        <c:set var="length" value="${fn:length(file.file_name) }" />
						<c:set var="index" value="${fn:indexOf(file.file_name, '_') }" />
						<c:set var="file_name" value="${fn:substring(file.file_name, index + 1, length) }" />
                            <c:if test="${file.file_num eq product.product_idx }">
	                            <div class="goods_image">
	                                <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" width="194" height="194" alt="상품 이미지">
	                            </div>
                            </c:if>
                        </c:forEach>
                            <div class="goods_info">
                                <p class="goods_title">${product.product_subject } </p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">${product.product_price }</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div> 
            </section>
        <!-- // main_content 영역 -->

	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>