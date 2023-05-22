<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터 | 상품관리</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!--부트스트랩-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">

<!--CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_manage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!-- 햄버거 메뉴 호버시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/market_manage.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>    <!-- main_content 영역 -->
        <div id="main_content">
            <!--하위 메뉴-->
            <nav class="content_nav">
                <a href="product_upload">상품등록</a>
                <a href="product_management" class="active">상품관리</a>
                <a href="goods_buy_history.html">구매/판매 내역</a>
            </nav>
            
            <!--본문 내용-->
            <section class="goods_filter_area">
                <form class="my_goods_search">
                    <input type="text" name="goodsTitle" placeholder="상품명을 입력해주세요">
                    <button type="button"><i class="fas fa-search"></i></button>
                </form>
                <ul class="all_goods_show_num">
                    <li class="show all_goods_num"><span>10개씩</span><span class="gray_arrow"></span></li>
                    <div>
                        <li class="option">10개씩</li>
                        <li class="option">20개씩</li>
                        <li class="option">50개씩</li>
                        <li class="option">100개씩</li>
                    </div>    
                </ul>
                <ul class="all_goods_show_status">
                    <li class="show all_goods_status"><span>전체</span><span class="gray_arrow"></span></li>
                    <div>
                        <li class="option">전체</li>
                        <li class="option">판매 중</li>
                        <li class="option">예약 중</li>
                        <li class="option">판매완료</li>
                    </div>    
                </ul>
            </section>
            <section class="goods_manage_area">
                <!--상품 정보 출력-->
                <table>
                    <thead>
                        <tr>
                            <th>사진</th>
                            <th>판매상태</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>안전결제 환영</th>
                            <th>찜</th>
                            <th>최근수정일</th>
                            <th>기능</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${pageContext.request.contextPath }/resources/images/goods_ex.jpg" alt="상품 사진"></td>
                            <td>
                                <ul class="goods_status_show">
                                    <li class="show"><span>판매중</span><span class="gray_arrow"></span></li>
                                    <div>
                                        <li class="option">판매 중</li>
                                        <li class="option">예약 중</li>
                                        <li class="option">삭제</li>
                                        <li class="option">판매완료</li>
                                    </div>
                                </ul>
                            </td>
                            <td><a href="goods_product_detail.html">상품명</a></td>
                            <td>1,111원</td>
                            <td>O</td>
                            <td>1</td>
                            <td>2022-12-16<br>16:14</td>
                            <td>
                                <button type="button">UP</button><br>
                                <a href="goods_selling_form.html">수정</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
            <section class="paging">
                <a href="#" class="active_page" style="color: #f4f4f4;">1</a>
            </section>
        </div>
        <!-- // main_content 영역 -->
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>