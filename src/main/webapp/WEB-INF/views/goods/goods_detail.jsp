<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clever - 굿즈스토어 상세페이지</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    
    <!-- 공통 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
    <!-- 상세페이지 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_product_detail.css">

    <!-- 파비콘 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
</head>

<body>



	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
    <!-- main_content 영역 -->
    <c:forEach items="${goodsDetail }" var="goodsDetail">
        <div id="main_content">
            <!-- detail_content -->
	            <div id="detail_content">
	                <div class="container text-center">
	                    <div class="row">
	                        <div class="col detail_content_img">
	                            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
	                                <div class="carousel-indicators">
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active change" id="change1" aria-current="true" aria-label="Slide 1"></button>
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" id="change2" aria-label="Slide 2"></button>
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" id="change3" aria-label="Slide 3"></button>
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" id="change3" aria-label="Slide 4"></button>
	                                </div>
	                                
			                              	 	 <div class="carousel-inner">
					                               <c:forEach items="${fileList }" var="fileList"> <!-- 첫번째사진 select 하는 forEach문 -->
					                               		<c:set var="length" value="${fn:length(fileList.file_name) }" />
														<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
														<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
															<c:if test="${fileList.file_num eq goodsDetail.goods_idx }">
							                                    <div class="carousel-item active">
							                                        <img src="${pageContext.request.contextPath }/resources/upload/${file_name}" class="d-block w-100" width="184" height="470" >
							                                    </div>
							                                    
							                                    	<c:forEach items="${filesList}" var="filesItem" varStatus="loop"> <!-- 첫번째사진을 제외한 나머지를 select하는 forEach문 -->
																	    <c:set var="length" value="${fn:length(filesItem.file_name)}" />
																	    <c:set var="index" value="${fn:indexOf(filesItem.file_name, '_')}" />
																	    <c:set var="file_name" value="${fn:substring(filesItem.file_name, index + 1, length)}" />
																	    <c:if test="${filesItem.file_num eq goodsDetail.goods_idx and loop.index ne 0}">
																	        <div class="carousel-item">
																	            <img src="${pageContext.request.contextPath}/resources/upload/${file_name}" class="d-block w-100" width="184" height="470">
																	        </div>
																	    </c:if>
																	</c:forEach>
															</c:if>
                               						</c:forEach>
			                                	</div>
	                                
	                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                                    <span class="visually-hidden">Previous</span>
	                                </button>
	                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                                    <span class="visually-hidden">Next</span>
	                                </button>
	                            </div>
	                        </div>
	                        <div class="col detail_content_info">
	                        <input hidden="">
	                            	<h2>${goodsDetail.goods_name }</h2>
	                            <p>${goodsDetail.goods_price }<span>원</span></p>
	                            <hr>
	                            <div id="detail_content_info_mid">
<!-- 	                                <p style="width: 80px;"> -->
<%-- 	                                    <img src="${pageContext.request.contextPath }/resources/images/goods/heart.png" alt="찜"> --%>
<!-- 	                                    <span>17</span> -->
<!-- 	                                </p> -->
<!-- 	                                <p style="width: 80px;"> -->
<%-- 	                                    <img src="${pageContext.request.contextPath }/resources/images/goods/eye.png" alt="조회"> --%>
<!-- 	                                    <span>76</span> -->
<!-- 	                                </p> -->
	                                <p style="width: 150px;">
	                                    <img src="${pageContext.request.contextPath }/resources/images/goods/time.png" alt="업로드날짜">
	                                    <span>${goodsDetail.goods_date }</span>
	                                </p>

	                            </div>
	                            <div id="detail_content_info_state">
									<p>
	                                    <span>· 상품설명</span>
	                                    <span>${goodsDetail.goods_content }</span>
	                                </p>
									<p>
	                                    <span>· 현재 재고</span>
	                                    <span>${goodsDetail.goods_stock }</span>
	                                </p>
									<p>
	                                    <span>· 등록일</span>
	                                    <span>${goodsDetail.goods_date }</span>
	                                </p>
	                            <div>
	                             	<!-- 버튼영역 -->
	                             			<input type="hidden" value="${goodsDetail.goods_idx }">
			                                <div class="container text-center detail_content_info_btn">
			                                        <div class="col-4">
			                                            <div class="p-3 info_btn3" onclick="payGoods()">바로구매</div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <!-- //버튼영역 -->

	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
            <!-- // detail_content -->

<hr>

            <!-- 상품상세설명 -->
	            <div id="related_goods">
	                <div>
	                    <h3>상세설명</h3>
	                </div>
	                <div class="container text-center" id="related_goods_imgs">
						${goodsDetail.goods_detail }
	                </div>
	            </div>
            <!-- 상품상세설명 -->

            <!-- url_images -->
            <div id="url_images">
                <p>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/naver.png" alt="Naver blog">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/facebook.png" alt="Facebook">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/twitter.png" alt="Twitter">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/url.png" alt="URL">
                    </span>
                </p>
            </div>
            <!-- // url_images -->

            <!-- goods_info -->
        </c:forEach>     
        <!-- // main_content 영역 -->
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
		<!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!-- 햄버거 메뉴 호버시 -->
    <script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>
    <script src="js/jquery-3.6.4.js"></script>
    <script type="text/javascript">
    	function payGoods() {
		    window.open("payGoods?goods_idx=${param.goods_idx}", "바로구매새창", "width=800, height=1200" );
    	}
    </script>	
</body>
</html>