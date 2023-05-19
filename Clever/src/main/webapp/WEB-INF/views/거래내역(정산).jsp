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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_account.css">
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
                <a href="goods_sell_history.html">판매</a>
                <a href="goods_account.html" class="active">정산</a>
            </nav>
        </header>

        <!--메인 컨텐츠-->
        <div id="main_content">
            <!--계좌 영역-->
            <div class="account_show_area">
                <span>정산계좌</span>
                <!--등록된 계좌 있을 때-->
                <span class="account_show">
                    <span>은행이름</span>
                    <span>계좌번호</span>
                </span>
            </div>
            <!--정산 상품 내역-->
            <section class="calculate_area">
                <div class="goods">
                    <a href="goods_seller_ordersheet.html" class="goods_one">
                        <div class="goods_images_area">
                            <img src="${pageContext.request.contextPath }/resources/images/goods_ex.jpg" alt="거래 상품 이미지">
                        </div>
                        <div class="goods_info">
                            <p class="goods_title">상품 글 제목</p>
                            <p class="goods_shop">상점명 / 번개페이 안전결제</p>
                            <p class="goods_date">-</p>
                        </div>
                        <div class="goods_calculate">
                            <p class="goods_price">1,111원</p>
                            <!--등록된 계좌 없을 때-->
                            <p class="goods_account_warn">정산계좌 미입력</p>
                        </div>
                    </a>
                </div>
            </section>
        </div>
        <footer>
            <p>
                판매대금은 등록한 계좌번호로 정산일에 지급됩니다.<br>
                정산일 이후 미지급 상태인 경우 계좌번호를 다시 한 번 확인해주세요. 
            </p>
        </footer>
    </div>
	<!-- 풋터 시작 -->
	<jsp:include page="footer.jsp" />
</body>
</html>