<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 고객센터 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_service_common.css">
<!-- 공지사항 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_notice.css">
<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!-- 화면 스크롤시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/customer_service/top_show_name.js"></script>

<!-- 타이틀 클릭시 하단 공지 변경 -->
<script src="${pageContext.request.contextPath }/resources/js/customer_service/customer_notice.js"></script>
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
                공지사항
            </div>
        </div>
    </header>

    <!-- wrapper 영역 -->
    <div id="wrapper">
        <h1 id="title">공지사항</h1>

        <div class="container text-center" id="list_title">
            <div class="row">
                <div class="col" id="general">
                    일반
                </div>
                <div class="col" id="change_policy">
                    정책변경
                </div>
                <div class="col" id="fraud_prevention">
                    사기예방
                </div>
            </div>
        </div>

        <div id="list_contents">
            <!-- 일반 영역 -->
            <div id="general_lists_area">
                <div class="general_content">
                    <p>
                        2023년 설 연휴 택배 서비스 이용 안내
                    </p>
                    <p>
                        2022.12.30
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 멜로망스 콘서트 티켓 거래 금지 안내
                    </p>
                    <p>
                        2022.11.19
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] god 콘서트 티켓 거래 금지 안내
                    </p>
                    <p>
                        2022.10.21
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 포장택배 서비스 종료 안내
                    </p>
                    <p>
                        2022.10.21
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 위조상품 유통 근절 및 퍼블시티권 보호에 관한 유의사항
                    </p>
                    <p>
                        2022.10.04
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 포장택배 서비스 종료 안내
                    </p>
                    <p>
                        2022.10.21
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 위조상품 유통 근절 및 퍼블시티권 보호에 관한 유의사항
                    </p>
                    <p>
                        2022.10.04
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 포장택배 서비스 종료 안내
                    </p>
                    <p>
                        2022.09.30
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        택배 서비스 추석연휴 집하 마감일 안내
                    </p>
                    <p>
                        2022.08.29
                    </p>
                </div>
                <div class="general_content">
                    <p>
                        [공지] 프로상점 베타 서비스가 런칭되었습니다.
                    </p>
                    <p>
                        2022.08.23
                    </p>
                </div>
            </div>

            <!-- 정책변경 영역 -->
            <div id="change_policy_lists_area">
                <div class="change_policy_content">
                    <p>
                        [공지] 번개장터 서비스 이용 약관 개정안내
                    </p>
                    <p>
                        2022.12.26
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 택배서비스 운임 인상 안내
                    </p>
                    <p>
                        2022.12.08
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        번개장터 개인정보처리방침 개정 안내
                    </p>
                    <p>
                        2022.11.26
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 주식/코인/해외선물 등 리딩방 관련 거래 금지 안내
                    </p>
                    <p>
                        2022.11.17
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 허위 거래 관리 강화 안내
                    </p>
                    <p>
                        2022.11.16
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 번개장터 서비스 이용 약관 개정안내
                    </p>
                    <p>
                        2022.11.12
                    </p>
                </div>
                
                <div class="change_policy_content">
                    <p>
                        번개장터 개인정보처리방침 개정 안내
                    </p>
                    <p>
                        2022.10.20
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 일부 거래금지 품목, 거래허용 안내
                    </p>
                    <p>
                        2022.10.20
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 프로상점 베타 서비스 월 이용료/UP하기 체험권 정책 변경 안내
                    </p>
                    <p>
                        2022.10.19
                    </p>
                </div>
                <div class="change_policy_content">
                    <p>
                        [공지] 번개장터 서비스 이용 약관, 프로상점 서비스 이용 약관 및 운영 정책 개정 안내
                    </p>
                    <p>
                        2022.10.07
                    </p>
                </div>
            </div>

            <!-- 사기예방 영역 -->
            <div id="fraud_prevention_lists_area">
                <div class="fraud_prevention_content">
                    <p>
                        [공지] 요소수 품귀 현상에 따른 매점매석행위 및 사기피해 주의!
                    </p>
                    <p>
                        2021.11.09
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        요소수 중고거래 사기 피해사례 공유 및 예방법!
                    </p>
                    <p>
                        2021.11.08
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        [공지] 상품권 대리구매, 사기주의!!
                    </p>
                    <p>
                        2021.08.31
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        군복 및 군용장구의 거래는 법률로 금지되어 있습니다. 사지도 팔지도 맙시다.
                    </p>
                    <p>
                        2021.04.06
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        [공지] 미인증 전자제품 중고거래 시 유의사항
                    </p>
                    <p>
                        2021.03.10
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        [공지] 식품의약품/의료기기 중고거래 시 유의사항
                    </p>
                    <p>
                        2021.02.16
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        [공지] 경찰청 사이버범죄 신고 시스템
                    </p>
                    <p>
                        2021.02.15
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        [공지] 추석 연휴 사기 거래 주의! 꼭 읽어주세요!
                    </p>
                    <p>
                        2020.09.21
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        안전결제(네이버페이/unicror) 피싱사이트 사기피해 주의
                    </p>
                    <p>
                        2017.09.12
                    </p>
                </div>
                <div class="fraud_prevention_content">
                    <p>
                        안전결제 피싱사이트 사기피해 주의
                    </p>
                    <p>
                        2017.01.03
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- // wrapper 영역 -->
        <!-- // main_content 영역 -->
	<!-- 풋터 시작 -->
	<jsp:include page="footer.jsp" />
</body>
</html>