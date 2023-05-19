<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 고객센터 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_service_common.css">
<!-- 자주 묻는 질문 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_frequently_asked_questions.css">
<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!-- 화면 스크롤시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/customer_service/top_show_name.js"></script>

<!-- 타이틀 클릭시 하단 공지 변경 -->
<script src="${pageContext.request.contextPath }/resources/js/customer_service/customer_frequently_asked_questions.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	
    <!-- main_content 영역 -->
        <header>
        <div>
            <a href="customer_service.html">
                <i class="bi bi-chevron-left"></i>
            </a>
            <div id="top_menu_name">
                자주 묻는 질문
            </div>
        </div>
    </header>

    <!-- wrapper 영역 -->
    <div id="wrapper">
        <h1 id="title">자주 묻는 질문</h1>

        <!-- 검색창 -->
        <div id="search_area">
            <img src="${pageContext.request.contextPath }/resources/images/customer_service/search_img.svg" alt="돋보기">
            <input type="text" placeholder="무엇을 찾고 계신가요?">
        </div>

        <!-- 상단 메뉴바 -->
        <div class="container text-center" id="top_menu_bar">
            <div class="row row-cols-3">
                <div class="col select_menu" id="member">회원/계정</div>
                <div class="col select_menu" id="conflict">거래분쟁/운영정책</div>
                <div class="col select_menu" id="payment">번개페이 안전결제</div>
                <div class="col select_menu" id="care">번개케어</div>
                <div class="col select_menu" id="sales_advertisement">프로상점/판매광고</div>
                <div class="col select_menu" id="etc">기타 이용안내</div>
            </div>
        </div>

        <!-- 하단 제목 -->
        <div id="list_contents">
            <!-- 회원/계정 영역 -->
            <div id="member_lists_area">
                <div class="member_content">
                    <p>
                        회원탈퇴 후 재가입을 할 수 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="member_content">
                    <p>
                        회원정보 변경은 어디에서 하나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="member_content">
                    <p>
                        수신한 개인정보 이용내역 메시지가 궁금해요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="member_content">
                    <p>
                        상점정보 변경은 어디에서 하나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="member_content">
                    <p>
                        본인인증을 받는데 인증번호가 오지 않아요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="member_content">
                    <p>
                        회원탈퇴를 하고 싶어요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="member_content">
                    <p>
                        내 상점의 제재 내역은 어디서 확인할 수 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
            </div>

            <!-- 거래분쟁/운영정책 영역 -->
            <div id="conflict_lists_area">
                <div class="conflict_content">
                    <p>
                        [분쟁해결절차] 사기꾼의 주요 사기패턴 유형이 궁금해요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="conflict_content">
                    <p>
                        거래를 하면 안 되는 것들은 어떤 것이 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="conflict_content">
                    <p>
                        [분쟁해결절차] 사기를 당하면 어떻게 처리해야 되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="conflict_content">
                    <p>
                        통신판매업자일 경우 상품 판매에 필요한 절차가 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="conflict_content">
                    <p>
                        [분쟁해결절차] 상품금액 입금 후, 판매자가 상품을 발송하지 않아요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="conflict_content">
                    <p>
                        상품판매 시 신고증(허가증) 제출이 필요한 상품이 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="conflict_content">
                    <p>
                        [분쟁해결절차] 정품 상품을 구매했는데 위조품(가품)이에요. 환불 받을 수 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
            </div>

            <!-- 번개페이 안전결제 영역 -->
            <div id="payment_lists_area">
                <div class="payment_content">
                    <p>
                        번개페이로 판매한 상품은 언제 정산 되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="payment_content">
                    <p>
                        번개페이(안전결제)란 무엇인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="payment_content">
                    <p>
                        [분쟁해결절차] 배송완료 되었는데, 구매자가 구매확정을 누르지 않아요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="payment_content">
                    <p>
                        네이버페이로 결제를 하고 싶어요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="payment_content">
                    <p>
                        번개페이 안전결제 수수료는 어떻게 되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="payment_content">
                    <p>
                        실수로  배송완료 전에 구매확정을 먼저 눌렀어요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="payment_content">
                    <p>
                        [분쟁해결절차] 구매한 상품을 반품하고 싶어요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
            </div>

            <!-- 번개케어 영역 -->
            <div id="care_lists_area">
                <div class="care_content">
                    <p>
                        번개케어란 무엇인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="care_content">
                    <p>
                        구매한 상품의 반품이 가능한가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="care_content">
                    <p>
                        검수 결과는 어떻게 구분되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="care_content">
                    <p>
                        거래를 취소하려면 어떻게 하나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="care_content">
                    <p>
                        번개케어 수수료는 어떻게 되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="care_content">
                    <p>
                        서비스의 진행 일정은 얼마나 걸리나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="care_content">
                    <p>
                        다른 택배사를 이용하여 상품을 발송 해도 되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
            </div>

            <!-- 프로상점/판매광고 영역 -->
            <div id="sales_advertisement_lists_area">
                <div class="sales_advertisement_content">
                    <p>
                        [UP하기] 예약 설정은 어떻게 하나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="sales_advertisement_content">
                    <p>
                        [UP하기] UP하기란 무엇인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="sales_advertisement_content">
                    <p>
                        [UP하기] 환불은 어떻게 받을 수 있나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="sales_advertisement_content">
                    <p>
                        [키워드 검색 광고] 상점이 제재/차단된 경우 광고는 어떻게 되나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="sales_advertisement_content">
                    <p>
                        [프로상점] 프로상점만 등록이 가능한 상품은 무엇인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="sales_advertisement_content">
                    <p>
                        [프로상점] 프로상점 서비스는 무엇이고, 어떤 헤택을 제공하나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="sales_advertisement_content">
                    <p>
                        [프로상점] 판매 수수료는 무엇인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
            </div>

            <!-- 기타 이용안내 영역 -->
            <div id="etc_lists_area">
                <div class="etc_content">
                    <p>
                        [내폰시세] 내폰시세 서비스란 무엇인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="etc_content">
                    <p>
                        [택배서비스] 택배서비스 이용 시 운송장번호는 자동 입력되나요?  <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="etc_content">
                    <p>
                        [기타] 단순변심 교환이나 환불은 어떻게 하나요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="etc_content">
                    <p>
                        [기타] 상품 하자가 발견됐는데, 판매자 연락이 안돼요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="etc_content">
                    <p>
                        [택배서비스] 택배사별 비용은 얼마 인가요? <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="etc_content">
                    <p>
                        [택배서비스] 번개장터 택배서비스에 대해 궁금해요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
                <div class="etc_content">
                    <p>
                        [기타] 내 상점에 작성된 후기,댓글을  지우고 싶어요. <i class="bi bi-chevron-right"></i>
                    </p>
                </div>
            </div>
        </div>
        
    </div>
    <!-- // wrapper 영역 -->

	<!-- 풋터 시작 -->
	<jsp:include page="footer.jsp" />
</body>
</html>