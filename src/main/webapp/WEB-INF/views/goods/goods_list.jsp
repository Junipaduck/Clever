<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 페이지</title>
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
                <div id="category">
                    <p id="home">
                        <span>
                            <img src="${pageContext.request.contextPath }/resources/images/market/home.png" alt="home">
                        </span>
                        <span>홈</span>
                    </p>
                    <p id="entire">
                        <span>
                            <i class="bi bi-chevron-right"></i>
                        </span>
                        <span>
                            <ul class="entire_bar">
                                <li><a href="#">굿즈</a></li>
                                <li class="hidden_menu">
                                	<a href="#">주방용품</a>
                                </li>
                                <li class="hidden_menu">
                                	<a href="#">잡화</a>
                                </li>
                            </ul>
                            <i class="bi bi-chevron-down under_direction"></i>
                        </span>
                    </p>
                </div>
                
                <!--하위 카테고리 (중분류 선택된 경우만 표시, 하위카테고리 선택시 표시 X)-->
                <!-- 관리자로 로그인 시 등록하기 버튼 보임 -->
                <div class="category_under">
                    	<c:choose>
                    		<c:when test="${sessionScope.sId eq 'admin' }">
			                    <div class="category_box">
			                        <a href="storeRegister.ad">등록하기</a>
	                    		</div>
                    		</c:when>
                    		<c:otherwise>
								<!-- 일반 회원 아이디로 로그인 시 아무것도 안 보임 -->
                    		</c:otherwise>
                    	</c:choose>
                </div>

                <!--상품 영역-->
                <section class="main_goods">
                    <div class="goods_wrap">
                       	<c:forEach items="${goodsList }" var="goodsList">
	                        <div class="goods">
	                            <a href="goods_product_detail.html">
 	 									<c:forEach items="${fileList }" var="fileList">
				                        <c:set var="length" value="${fn:length(fileList.file_name) }" />
										<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
										<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
				                            <c:if test="${fileList.file_num eq goodsList.goods_idx }">
					                            <div class="goods_image">
					                                <img src="${pageContext.request.contextPath }/resources/upload/${file_name}" width="194" height="194" alt="상품 이미지">
					                            </div>
				                            </c:if>
				                        </c:forEach>
				                        
	                                <div class="goods_info">
	                                    <p class="goods_title">${goodsList.goods_name }</p>
	                                    <div class="goods_price_date">
	                                        <span class="goods_price">${goodsList.goods_price }원</span>
	                                        <span class="goods_date_before">${goodsList.goods_date }</span>
	                                    </div>
	                                </div>
	                            </a>
                        	</div>
                       	</c:forEach>
                    </div>
                </section>
            </div>
        </div>
        <!-- // main_content 영역 -->

	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	
<!--js-->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>
</body>
</html>