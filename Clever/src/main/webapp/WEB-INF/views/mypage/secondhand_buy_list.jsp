<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 - 구매내역</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_comon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_history.css">

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_history_common.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_buy_history.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<jsp:include page="../inc/mypage_header.jsp" />
	
	<!-- 모달창 시작 -->
	<!--반품 모달-->
	<div class="modal_return_area hidden">
	    <div class="return_bg bg"></div>
	    <div class="return_modal">
	        <h2>알림</h2>
	        <p>반품신청 하시겠습니까?</p>
	        <div class="btn_area">
	            <button type="button" class="btn_no">아니요</button>
	            <button type="button" class="btn_yes">네</button>
	        </div>
	    </div>
	</div>
	<!--상품수령 모달-->
	<div class="modal_decide_area hidden">
	    <div class="decide_bg bg"></div>
	    <div class="decide_modal">
	        <div class="decide_content">
	            <h2>상품을 수령하셨나요?</h2>
	            <p>
	                구매확정 후에는 취소할 수 없습니다.<br>
	                만약 상품 수령 전에 미리 구매확정을 할 경우 사기 위험에 노출될 수 있습니다.<br>
	                (불법적 금융대출 목적으로 이용 시 금융거래에 불이익을 받을 수 있습니다.)
	            </p>
	        </div>
	        <div class="btn_area">
	            <button type="button" class="btn_no">아니요</button>
	            <button type="button" class="btn_yes">네</button>
	        </div>
	    </div>
	</div>
	<!--리뷰 모달-->
	<div class="modal_review_area hidden">
	    <div class="review_bg bg"></div>
	    <div class="review_modal">
	        <h2>알림</h2>
	        <p>
	            후기는 앱에서만 작성할 수 있습니다 <br>
	            작성하시겠습니까?
	        </p>
	        <div class="btn_area">
	            <button type="button" class="btn_no">아니요</button>
	            <button type="button" class="btn_yes">네</button>
	        </div>
	    </div>
	</div>
	<!-- 모달창 끝 -->
	
	
	<!-- main_content 영역 -->
	<div id="wrapper">
        <div id="main_content">
	        <div id="header">
	            <h1>나의 구매내역</h1>
	            <!--메뉴-->
	            <nav class="content_nav" style="font-weight: bold;">
	                <a href="#" class="active">거래중 2</a>
	                <a href="#">거래완료 1</a>
	                <a href="#">숨김 3</a>
	            </nav>
	        </div>
	        
	        
	        
            <!-- 상품 목록 시작 -->
            <div class="goods">
                <div class="goods_one">
                    <a href="goods_buyer_ordersheet.html">
                        <div class="goods_image">
                            <img src="${pageContext.request.contextPath }/resources/images/goods_ex.jpg" alt="상품사진">
                            <!--사진 앞 상태(구매확정 시 표시, 맨 처음은 표시 X)-->
                            <span class="goods_front">
                                <i class="fas fa-box"></i><br>
                                배송완료
                            </span>
                        </div>
                        <div class="goods_info">
                            <h2 class="goods_title">상품 글 제목</h2>
                            <p class="goods_price"><span class="bold">1,111</span>원</p>
                            <p class="goods_shop">상점명 / 번개페이 안전결제</p>
                            <p class="goods_date">2022.12.16 (오후 04:37)</p>
                        </div>
                    </a>
                    <div class="btn_area">
                        <button type="button" class="btn_buy_decide">구매확정</button>
                        <button type="button" class="btn_return">반품신청</button>
                    </div>
                </div>
                <div class="goods_one">
                    <a href="goods_buyer_ordersheet.html">
                        <div class="goods_image">
                            <div class="image_area">
                                <img src="${pageContext.request.contextPath }/resources/images/goods_ex.jpg" alt="상품사진">
                            </div>
                            <span class="goods_front">
                                <i class="far fa-check-circle"></i><br>
                                거래완료
                            </span>
                        </div>
                        <div class="goods_info">
                            <h2 class="goods_title">상품 글 제목</h2>
                            <p class="goods_price"><span class="bold">1,111</span>원</p>
                            <p class="goods_shop">상점명 / 번개페이 안전결제</p>
                            <p class="goods_date">2022.12.16 (오후 04:37)</p>
                        </div>
                    </a>
                    <button type="button" class="btn_review_modal">후기작성</button>
                </div>
            </div>
            <!-- 상품 목록 끝 -->
        </div>
    </div>
    <!-- main_content 영역 끝 -->
	
	<!-- 푸터 시작 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>