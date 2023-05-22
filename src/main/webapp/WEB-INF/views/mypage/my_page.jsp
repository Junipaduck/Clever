<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>클레버 - 마이페이지</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_my_store.css">

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/market_intro_modify.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<jsp:include page="../inc/mypage_header.jsp" />
	
	<!-- main_content 영역 -->
        <div id="main_content">
            <!-- 프로필 영역 -->
            <div id="my_store_area">
                <div class="my_store_left">
                    <div>
                        <img src="${pageContext.request.contextPath }/resources/images/market/store.svg" alt="내 상점">
                    </div>
                    <div>
                        <p>${sessionScope.sId } 님</p>
                        <p>
                            <img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점">
                            <img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점">
                            <img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점">
                            <img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점">
                            <img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점">
                        </p>
                    </div>
                    <div>
                        <p>
                            <a href="#">20000 포인트</a>
                        </p>
                    </div>
                </div>

                <div class="my_store_right">
                    <div id="my_store_right_top">
                        <div>
                            <h2>배하나</h2>
                            <button>내 정보 수정</button>
                        </div>
                        
                        <div>
                            <p><span>OK</span> 계좌 인증 완료</p>
                        </div>
                    </div>

                    <div id="my_store_right_mid">
                        <div>
                            <p>
                                <img src="${pageContext.request.contextPath }/resources/images/market/store_open.png" alt="상점 오픈일">
                            </p>
                            <p>
                                여긴뭐해요 <span>0 일 전</span>
                            </p>
                        </div>
                        <div>
                            <p>
                                <img src="${pageContext.request.contextPath }/resources/images/market/people.png" alt="상점 방문수">
                            </p>
                            <p>
                                거래후기 <span>0 명</span>
                            </p>
                        </div>
                        <div>
                            <p>
                                <img src="${pageContext.request.contextPath }/resources/images/market/product_sell.png" alt="상품판매">
                            </p>
                            <p>
                                내물건판매 <span>0 회</span>
                            </p>
                        </div>
                        <div>
                            <p>
                                <img src="${pageContext.request.contextPath }/resources/images/market/parcel_service.png" alt="택배발송">
                            </p>
                            <p>
                                경매참여 <span>0 회</span>
                            </p>
                        </div>
                    </div>

                    <div id="my_store_right_bot">
                        <div id="intro_modify">
                            <button>소개글 수정</button>
                        </div>

                        <div class="text_area">
                            <textarea></textarea>
                            <button>확인</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 프로필 영역 끝 -->

            <!-- 하단 내역 부분 -->
            <div id="my_store_menu">
                <div class="container text-center menu_bar">
                    <div class="row">
                        <div class="col my_store_menus sales_menu">
                            판매내역 <span>0</span>
                        </div>
                        <div class="col my_store_menus purchases_menu">
                            구매내역 <span>0</span>
                        </div>
                        <div class="col my_store_menus secondhandLike_menu">
                            중고거래 찜 <span>0</span>
                        </div>
                        <div class="col my_store_menus auction_menu">
                            경매 참여내역 <span>0</span>
                        </div>
                        <div class="col my_store_menus auctionLike_menu">
                            경매 찜 <span>0</span>
                        </div>
                    </div>
                </div>

                <div id="my_store_menu_content">
                    <div id="sales_menu_area" class="common_menu">
                        <div>
                            <p>
                                판매내역 <span>0</span>
                            </p>
                            <ul class="goods_cate">
                                <li>전체</li>
                                <li class="hidden_menu">전체</li>
                                <li class="hidden_menu">거래중</li>
                                <li class="hidden_menu">거래완료</li>
                                <li class="hidden_menu">숨김내역</li>
                            </ul>
                            <i class="bi bi-chevron-down under_direction under"></i>
                        </div>
                        <div>
                            <p>
                                판매한 상품이 없습니다.
                            </p>
                        </div>
                    </div>

                    <div id="purchases_menu_area" class="common_menu">
                        <div>
                            <p>
                                구매내역 <span>0</span>
                            </p>
                            <ul class="goods_cate">
                                <li>전체</li>
                                <li class="hidden_menu">전체</li>
                                <li class="hidden_menu">거래중</li>
                                <li class="hidden_menu">거래완료</li>
                                <li class="hidden_menu">숨김내역</li>
                            </ul>
                            <i class="bi bi-chevron-down under_direction under"></i>
                        </div>
                        <div>
                            <p>
                                구매한 상품이 없습니다.
                            </p>
                        </div>
                    </div>

                    <div id="secondhandLike_menu_area" class="common_menu">
                        <div>
                            <p>
                                중고거래 찜 <span>0</span>
                            </p>
                        </div>
                        <div>
                            <p>
                                찜한 상품이 없습니다.
                            </p>
                        </div>
                    </div>

                    <div id="auction_menu_area" class="common_menu">
                        <div>
                            <p>
                                경매 참여내역 <span>0</span>
                            </p>
                            <ul class="goods_cate">
                                <li>전체</li>
                                <li class="hidden_menu">전체</li>
                                <li class="hidden_menu">참여중</li>
                                <li class="hidden_menu">경매완료</li>
                                <li class="hidden_menu">숨김내역</li>
                            </ul>
                            <i class="bi bi-chevron-down under_direction under"></i>
                        </div>
                        <div>
                            <p>
                                경매 참여한 상품이 없습니다.
                            </p>
                        </div>
                    </div>

                    <div id="auctionLike_menu_area" class="common_menu">
                        <div>
                            <p>
                                경매 찜 <span>0</span>
                            </p>
                        </div>
                        <div>
                            <p>
                                찜한 상품이 없습니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 하단 내역 부분 끝 -->
        </div>
        <!-- main_content 영역 끝 -->
	
	<!-- 푸터 시작 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>