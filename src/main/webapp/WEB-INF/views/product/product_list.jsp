<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clever - 중고상품 전체목록</title>
<!-- 파비콘 -->
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_category.css">

<!--js-->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/auction/used.css?after">
<style type="text/css">
/* 클래스 이름에 77붙은것은 무한스크롤 관련 CSS임 */
.element77, .outer-container77 {
   width: 1500px;
	height: 800px;
	margin: 0 auto;
 }

 .outer-container77 {
   position: relative;
   overflow: hidden;
/*   border: 5px solid purple; */
 }

 .inner-container77 {
   position: absolute;
   left: 0;
   overflow-x: hidden;
   overflow-y: scroll;
 }

 .inner-container77::-webkit-scrollbar77 {
   display: none;
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
<!--                         <span>홈</span> -->
<!--                     </p> -->
                    
<!--                     <p id="entire"> -->
<!--                         <span> -->
<!--                             <i class="bi bi-chevron-right"></i> -->
<!--                         </span> -->
<!--                         <span> -->
<!--                             <ul class="entire_bar"> -->
<!--                                 <li><a href="#">카테고리 선택</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">의류/잡화</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">디지털/가전</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">도서/티켓/문구</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">뷰티/미용</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">식품</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">반려동물용품</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">기타</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">도서/티켓/문구</a></li> -->
<!--                             </ul> -->
<!--                             <i class="bi bi-chevron-down under_direction"></i> -->
<!--                         </span> -->
<!--                     </p> -->
<!--                     <p id="category_clothes"> -->
<!--                         <span> -->
<!--                             <i class="bi bi-chevron-right"></i> -->
<!--                         </span> -->
<!--                         <span> -->
<!--                             <ul class="category_clothes_bar"> -->
<!--                                 <li><a href="#">남성의류</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">여성의류</a></li> -->
<!--                             </ul> -->
<!--                             <i class="bi bi-chevron-down under_direction"></i> -->
<!--                         </span> -->
<!--                     </p> -->
<!--                 </div> -->
                
<!--                 하위 카테고리 (중분류 선택된 경우만 표시, 하위카테고리 선택시 표시 X) -->
<!--                 <div class="category_under"> -->
<!--                     <div class="category_box"> -->
<!--                         <a href="전체보기">전체보기 -->
<!--                             <span><i class="bi bi-chevron-right"></i></span></a> -->
<!--                     </div> -->
<!--                     <div class="category_box"><a href="#">하위 카테고리</a></div> -->
<!--                     <div class="category_box"><a href="#">하위 카테고리</a></div> -->
<!--                     <div class="category_box"></div> 자리 남아도 5개 유지 -->
<!--                     <div class="category_box"></div> -->
<!--                 </div> -->

	         
		<!-- 스크롤 코드 시작 (아래 div태그 3줄) -->	
		 <div class="outer-container77">
	       <div class="inner-container77">
	         <div class="element77">
	         
                <!--상품 영역-->
                <section class="main_goods">
                    <div class="goods_wrap col-lg-9 col-md-9"> <!-- 무한스크롤때문에 col-lg-9 col-md-9 이 코드 추가함 -->
                   		<!-- 상품 1개 카드 -->
                        <c:forEach items="${productList }" var="productList">
	                        <div class="goods">
	                            <a href="product_detail?product_idx=${productList.product_idx }&product_Mcategory=${productList.product_Mcategory}&product_price=${productList.product_price}">
<!--                                		<div class="goods_image"> -->
<%-- 	                                    <img src="${pageContext.request.contextPath }/resources/fileUpload/hana_cat1.jpg" width="194" height="194" alt="상품 이미지"> --%>
<!-- 	                                </div> -->

										<c:forEach items="${fileList }" var="fileList">
					                        <c:set var="length" value="${fn:length(fileList.file_name) }" />
											<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
											<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
											<c:choose>
					                            <c:when test="${fileList.file_num eq productList.product_idx && productList.sale_status eq '판매중' }">
						                            <div class="goods_image">
						                                <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" width="194" height="194" alt="상품 이미지">
						                            </div>
					                            </c:when>
					                            <c:when test="${fileList.file_num eq productList.product_idx && productList.sale_status eq '판매완료' }">
					                            	<div class="goods_image">
						                                <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" width="194" height="194" alt="상품 이미지">
						                               	<img src="${pageContext.request.contextPath }/resources/images/soldOut.png" alt="판매완료" style="width: 170px; height: 120px; margin-bottom: 77px;">
						                            </div>
					                            </c:when>
					                        </c:choose>
				                        </c:forEach>
				                        
	                                <div class="goods_info">
	                                    <p class="goods_title">${productList.product_subject }</p>
	                                    <div class="goods_price_date">
	                                        <span class="goods_price">${productList.product_price }원</span>
	                                        <span class="goods_date_before">${productList.sale_status }</span>
	                                    </div>
	                                </div>
	                            </a>
	                        </div>
                        </c:forEach>
                        <!-- //상품 1개 카드 -->
                    </div>
                </section>
                
                </div>
		      </div>
		    </div>
		   <!-- 스크롤 코드 끝(윗 div태그 3줄) -->
            </div>
        </div>
        <!-- // main_content 영역 -->

	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>