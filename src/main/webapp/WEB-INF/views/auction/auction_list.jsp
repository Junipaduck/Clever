<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클레버 - 경매리스트</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_history.css">

<!--js-->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/goods/goods_history_common.js"></script>
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
<script type="text/javascript">
window.onload = function() {
let status = '${param.status}';
	switch (status) {
	case "경매등록대기중": $('.status_filter').find('.buying_status').addClass('active');  break;
	case "경매중": $('.status_filter').find('.all_buy_status').addClass('active'); break;
	case "경매마감": $('.status_filter').find('.bought_status').addClass('active'); break;
	}
}
// $(document).load()function() {
	
// });
</script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="auction_header.jsp" />
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
                        <a href="auction"><span>홈</span></a>
                    </p>
                    <p id="entire">
                        <span>
                            <i class="bi bi-chevron-right"></i>
                        </span>
                        <span>
                            <ul class="entire_bar">
                                <c:if test="${not empty bigCategory }">
	                                <li><a href="auction_list?param=${bigCategory }&status=경매중">${bigCategory }</a></li>
                                </c:if>
                                <c:if test="${not empty midCategory }">
	                                <li><a href="auction_list?param=${midCategory[0].bigCategory }&status=경매중">${midCategory[0].bigCategory }</a></li>
                                </c:if>
                                <c:if test="${not empty smallCategory }">
	                                <li><a href="auction_list?param=${smallCategory[0].bigCategory }&status=경매중">${smallCategory[0].bigCategory }</a></li>
                                </c:if>
                                <c:forEach items="${bigCategorys }" var="big">
                               		<li id="big" class="hidden_menu"><a href="auction_list?param=${big.bigCategory }&status=경매중">${big.bigCategory }</a></li>
                                </c:forEach>
                                
                            </ul>
                            <i class="bi bi-chevron-down under_direction"></i>
                        </span>
                    </p>
	                    <p id="category_clothes">
	                        <span>
	                            <i class="bi bi-chevron-right"></i>
	                        </span>
	                        <span>
	                            <ul class="category_clothes_bar">
	                                <c:if test="${not empty midCategory }">
		                                <li><a href="#">${midCategory[0].midCategory }</a></li>
	                                </c:if>
	                                <c:if test="${not empty smallCategory }">
		                                <li><a href="#">${smallCategory[0].midCategory }</a></li>
	                                </c:if>
                                <c:forEach items="${midCategorys }" var="mid">
                               		<li id="big" class="hidden_menu"><a href="auction_list?param=${mid.midCategory }&status=경매중">${mid.midCategory }</a></li>
                                </c:forEach>
	                            </ul>
	                            <i class="bi bi-chevron-down under_direction"></i>
	                        </span>
	                    </p>
                    <c:if test="${not empty midCategory or not empty smallCategory }">
	                    <p id="category_clothes">
	                        <span>
	                            <i class="bi bi-chevron-right"></i>
	                        </span>
	                        <span>
	                            <ul class="category_acc_bar">
		                                <li><a href="#">${smallCategory[0].smallCategory }</a></li>
	                            <c:forEach items="${smallCategorys }" var="smalls">
                               		<li id="big" class="hidden_menu"><a href="auction_list?param=${smalls.smallCategory }&status=경매중">${smalls.smallCategory }</a></li>
                                </c:forEach>
	                            </ul>
	                            <i class="bi bi-chevron-down under_direction"></i>
	                        </span>
	                    </p>
                    </c:if>
                    
                </div>
                
                <!--하위 카테고리 (중분류 선택된 경우만 표시, 하위카테고리 선택시 표시 X)-->
                <div class="category_under">
                    <div class="category_box">
                        현재 카테고리
                            <span><i class="bi bi-chevron-right"></i></span>
                    </div>
                    <c:if test="${not empty bigCategory }">
	                    <div class="category_box">${bigCategory }</div>
	                    <div class="category_box"></div>
	                    <div class="category_box"></div> <!--자리 남아도 5개 유지-->
	                    <div class="category_box"></div>
                    </c:if>
                    <c:if test="${not empty midCategory }">
	                    <div class="category_box">${midCategory[0].bigCategory }</div>
	                    <div class="category_box">${midCategory[0].midCategory } ></div>
	                    <div class="category_box"></div> <!--자리 남아도 5개 유지-->
	                    <div class="category_box"></div>
                    </c:if>
                    <c:if test="${not empty smallCategory }">
	                    <div class="category_box">${smallCategory[0].bigCategory } ></div>
	                    <div class="category_box">${smallCategory[0].midCategory} ></div>
	                    <div class="category_box">${smallCategory[0].smallCategory }</div> <!--자리 남아도 5개 유지-->
	                    <div class="category_box"></div>
                    </c:if>
                </div>

                <section class="main_goods">
                <h2 align="center">${categoryParam } 카테고리의 상품들</h2>
                <br>
                <br>
                <br>
                <br>
                <!--필터-->
				<nav class="filter_nav" style="justify-content: flex-end;">
					<div class="status_filter">
						<button type="button" class="all_buy_status" onclick="location.href='auction_list?param=${categoryParam}&status=경매중'">경매중</button>
						<button type="button" class="buying_status" onclick="location.href='auction_list?param=${categoryParam}&status=경매등록대기중'">경매전</button>
						<button type="button" class="bought_status" onclick="location.href='auction_list?param=${categoryParam}&status=경매마감'">경매 완료</button>
					</div>
				</nav>
                <div class="goods_wrap">
                    <c:forEach items="${productList }" var="product"> 
                    <div class="goods">
                        <a href="auction_detail?auction_idx=${product.auction_idx}&param=${product.auction_Scategory}">
                        <c:forEach items="${fileList }" var="file">
                        
                            <c:if test="${file.file_num eq product.auction_idx }">
	                            <div class="goods_image">
	                                <img src="${pageContext.request.contextPath }/resources/fileUpload${file.file_path}/${file.file_name}" width="194" height="194" alt="상품 이미지">
	                            </div>
                            </c:if>
                        </c:forEach>
                            <div class="goods_info">
                                <p class="goods_title">${product.auction_title } </p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.auction_final_price }" /></span>
                                </div>
	                                <script type="text/javascript">
	                                function getTime${product.auction_idx}() {
	                                	  var element;
	                                	  const endDay = new Date('${product.auction_start}');
	                                	  const currDay = new Date();
	                                	  let diff = endDay - currDay;
	                                	  const diffDays = Math.floor((endDay.getTime() - currDay.getTime()) / (1000 * 60 * 60 * 24));
	                                	  diff -= diffDays * (1000 * 60 * 60 * 24);
	                                	  const diffHours = Math.floor(diff / (1000 * 60 * 60));
	                                	  diff -= diffHours * (1000 * 60 * 60);
	                                	  const diffMin = Math.floor(diff / (1000 * 60));
	                                	  diff -= diffMin * (1000 * 60);
	                                	  const diffSec = Math.floor(diff / 1000);
	                                	  element = document.getElementById("timeOut${product.auction_idx}");
	                                	  if(diffDays < 0){
	                                		  element.innerHTML = "경매시작";
	                                		  $.ajax({
                      		  			 		url : "auction_statusUpdate",
                      		  			 		type: 'GET',
                      		  			 		data: {'auction_idx':${product.auction_idx}},
                      		  			 	});
	                                	  } else {
		                                	  element.innerHTML = diffDays+"일 "+diffHours+"시 "+diffMin+"분 "+diffSec+"초";
	                                	  }
	                                	}
	                                	function getTime2${product.auction_idx}() {
	                                	  var element;
	                                	  const endDay = new Date('${product.auction_end}');
	                                	  const currDay = new Date();
	                                	  let diff = endDay - currDay;
	                                	  const diffDays = Math.floor((endDay.getTime() - currDay.getTime()) / (1000 * 60 * 60 * 24));
	                                	  diff -= diffDays * (1000 * 60 * 60 * 24);
	                                	  const diffHours = Math.floor(diff / (1000 * 60 * 60));
	                                	  diff -= diffHours * (1000 * 60 * 60);
	                                	  const diffMin = Math.floor(diff / (1000 * 60));
	                                	  diff -= diffMin * (1000 * 60);
	                                	  const diffSec = Math.floor(diff / 1000);
	                                	  element = document.getElementById("timeOut2${product.auction_idx}");
	                                	  if(diffDays < 0){
	                                		  element.innerHTML = "경매 종료";                    		  
	                                	  } else {
		                                	  element.innerHTML = diffDays+"일 "+diffHours+"시 "+diffMin+"분 "+diffSec+"초";
	                                	  }
	                                	}
	                                	(function() {
	                                		var auction_start = new Date('${product.auction_start}');
	                                		var auction_end = new Date('${product.auction_end}');
	                                		var nowDate = new Date();
	                                		if(auction_start > nowDate){
	                                			return setInterval(() => getTime${product.auction_idx}(), 1000);
	                                		} else {
	                                			return setInterval(() => getTime2${product.auction_idx}(), 1000);
	                                		}
										}());
	                               </script>
                               <div id="timeOut2${product.auction_idx}" style="color: red; text-align: right;"></div>
                               <div id="timeOut${product.auction_idx}" style="color: blue; text-align: right;"></div>
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