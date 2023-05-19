<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래내역</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

    <!--아이콘-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!--공통 CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_comon.css">

    <!--CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_history.css">

    <!--JS-->
    <script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/goods/goods_history_common.js"></script>
</head>
<body>
   <a id="skipNav" href="#main_content">본문 바로가기</a>
	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	<!-- main_content 영역 -->

    <div id="wrapper">
        <header>
            <h1>거래내역</h1>
            <!--메뉴-->
            <nav class="content_nav">
                <a href="goods_buy_history.html">구매</a>
                <a href="goods_sell_history.html" class="active">판매</a>
                <a href="goods_account.html">정산</a>
            </nav>
        </header>

        <!--메인 컨텐츠-->
        <div id="main_content">
            <!--필터-->
            <nav class="filter_nav">
                <div class="status_filter">
                    <button type="button" class="all_buy_status active">전체 상태</button>
                    <button type="button" class="buying_status">진행중</button>
                    <button type="button" class="bought_status">완료</button>
                    <button type="button" class="cancle_status">취소/환불</button>
                </div>
                <div class="pay_filter">
                    <button type="button" class="pay_filter">
                        <svg width="20" height="20" fill="#000" viewBox="0 0 20 20">
                            <path d="M0 3a1 1 0 011-1h3.185A2.995 2.995 0 017 0a2.995 2.995 0 012.815 2H19a1 1 0 010 2H9.815A2.995 2.995 0 017 6a2.995 2.995 0 01-2.815-2H1a1 1 0 01-1-1zm20 14a1 1 0 01-1 1H9.815A2.995 2.995 0 017 20a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h3.185A2.995 2.995 0 017 14a2.995 2.995 0 012.815 2H19a1 1 0 011 1zm0-7a1 1 0 01-1 1h-3.185A2.995 2.995 0 0113 13a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h9.185A2.995 2.995 0 0113 7a2.995 2.995 0 012.815 2H19a1 1 0 011 1zM6 3a1 1 0 102 0 1 1 0 00-2 0zm2 14a1 1 0 10-2 0 1 1 0 002 0zm6-7a1 1 0 10-2 0 1 1 0 002 0z" fill-rule="evenodd" fill="#000">
                            </path>
                        </svg>
                    </button>
                </div>
            </nav>
            <!--상품 내용-->
            <div class="goods">
                <div class="goods_one">
                    <a href="goods_seller_ordersheet.html">
                        <div class="goods_image">
                            <img src="${pageContext.request.contextPath }/resources/images/goods_ex.jpg" alt="상품사진">
                            <!--사진 앞 상태(구매확정 시 표시, 맨 처음은 표시 X)-->
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
                </div>
            </div>
        </div>
    </div>
	<!-- 풋터 시작 -->
	<jsp:include page="footer.jsp" />
</body>
</html>