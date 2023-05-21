<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터 | 상품등록</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!--부트스트랩-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!--CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css">
<!-- 햄버거 메뉴 호버시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js"></script>
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2");
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
body {
font-family: 'SUITE-Regular';
}

</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="./inc/header.jsp" />
	</header>    <!--메인 컨텐츠-->
        <div id="main_content">
            <!--하위 메뉴-->
            <nav class="content_nav">
                <a href="goods_selling_form.html" class="active">상품등록</a>
                <a href="market_manage.html">상품관리</a>
                <a href="goods_buyer_ordersheet.html">구매/판매 내역</a>
            </nav>
            
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보 <span class="red">*필수항목</span></h2>
                <form action="" class="frm_selling_goods">
                    <div class="goods_images_area">
                        <p>상품이미지<span class="red">*</span>
                            <span class="image_limit">(<span class="image_num"></span>/4)</span>
                        </p>
                        <div>
                            <div class="goods_images">
                                <div>
                                    이미지 등록
                                    <input type="file" name="goodsImage" accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);">
                                </div>
                                <div class="preview_wrap"></div>
                            </div>
                            <div class="goods_images_notice">
                                <b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b><br>
                                - 상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여집니다.<br>
                                - 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다.<br>
                                - 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다.<br>
                                - 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br>
                                - 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br>
                                최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
                            </div>
                        </div>
                    </div>
                    <div class="goods_title_area">
                        <p>제목<span class="red">*</span></p>
                        <div class="goods_title">
                            <input type="text" name="goodsTitle" id="goods_title" maxlength="40"
                                placeholder="상품 제목을 입력해주세요." oninput="countTitleLength(event);">
                            <a href="#">거래금지 품목</a>
                            <span class="goods_title_length"><span></span>/40</span>
                        </div>
                    </div>
                    <div class="goods_category_area">
                        <p>카테고리<span class="red">*</span></p>
                        <div>
                            <div class="goods_category">
                                <div class="goods_Lcategory">
                                    <div>의류</div>
                                    <div>악세서리</div>
                                </div>
                                <div class="goods_Scategory">
                                    중분류 선택
                                </div>
                                <div class="goods_Scategory_cloth hidden">
                                    <div>남성의류</div>
                                    <div>여성의류</div>
                                </div>
                                <div class="goods_Scategory_acc hidden">
                                    <div>시계/쥬얼리</div>
                                    <div>패션악세서리</div>
                                </div>
                            </div>
                            <p class="hidden"><span>⊘</span> 상세 카테고리를 확인해주세요</p>
                            <p>선택한 카테고리 : <span class="selected_category"></span></p>
                            <input type="hidden" name="Lcategory">
                            <input type="hidden" name="Scategory">
                        </div>
                    </div>
                    <div class="goods_location_area">
                        <p>거래지역<span class="red">*</span></p>
                        <div class="goods_location">
                            <div class="location_button_area">
                                <button onclick="return false;">내위치</button>
                                <button onclick="return false;">주소검색</button>
                                <button onclick="return false;">지역설정안함</button>
                            </div>
                            <input type="text" name="goodsLocation" readonly>
                        </div>
                    </div>
                    <div class="goods_status_area">
                        <p>상태<span class="red">*</span></p>
                        <div class="goods_status">
                            <input type="radio" name="status" value="used" id="used">
                            <label for="used">중고상품</label>
                            <input type="radio" name="status" value="new" id="new">
                            <label for="new">새상품</label>
                        </div>
                    </div>
                    <div class="goods_change_area">
                        <p>교환<span class="red">*</span></p>
                        <div class="goods_change">
                            <input type="radio" name="change" value="unable" id="unable">
                            <label for="unable">교환불가</label>
                            <input type="radio" name="change" value="able" id="able">
                            <label for="able">교환가능</label>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>가격<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="goodsPrice" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)">원</p>
                            <input type="checkbox" name="deliveryPrice" id="deliveryPrice">
                            <label for="deliveryPrice">배송비 포함</label>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>설명<span class="red">*</span></p>
                        <div>
                            <textarea name="goodsInfo" id="goodsInfo" cols="30" rows="10"
                            maxlength="2000" oninput="countInfoLength(event)"></textarea>
                            <div class="goods_info_warn">
                                <span>혹시 <a href="#" onclick="return false;">카카오톡ID</a>를 적으셨나요?</span>
                                <span class="info_length"><span></span>/2000</span>
                            </div>
                        </div>
                    </div>
                    <div class="goods_tag_area">
                        <p>연관태그</p>
                        <div>
                            <div class="goods_tag">
                                <div class="tag_button hidden" onclick="tagDelete(event);">
                                    <button onclick="return false;">#태그1</button>
                                    <button onclick="return false;" ><i class="fas fa-times"></i></button>
                                </div>
                                <input type="text" name="tag" id="tag" 
                                    placeholder="연관태그를 입력해주세요. (최대5개)"
                                >
                            </div>
                            <p>
                                - 태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있습니다.<br>
                                - 태그는 검색의 부가정보로 사용 되지만, 검색 결과 노출을 보장하지는 않습니다.<br>
                                - 상품과 직접 관련이 없는 다른 상품명, 브랜드, 스팸성 키워드 등을 입력하면 노출이 중단되거나 상품이 삭제될 수 있습니다.<br>
                            </p>
                        </div>
                    </div>
                    <div class="goods_count_area">
                        <p>수량</p>
                        <p><input type="text" name="goodsCount" value="1" oninput="valueIsNumber(event)">개</p> 
                    </div>
                    <!--번개페이 뻐른 판매-->
                    <div class="fast_selling_area">
                        <h2>빠른 판매 <span>내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a></span></h2>
                        <div class="goods_option_area">
                            <p>옵션</p>
                            <div class="goods_option">
                                <div class="checkbox_safePay">
                                    <input type="checkbox" name="safePay" id="safePay">
                                    <label for="safePay">
                                        안전결제 환영 
                                        <svg width="60" height="24" viewBox="0 0 35 16" role="img">
                                            <rect width="35" height="16" rx="2" fill="#D80C18"/>
                                            <path d="m9.226 3.003-.56 4.563h2.325a.05.05 0 0 1 .036.083l-5.024 5.388c-.033.035-.091.008-.085-.04l.56-4.563H4.153a.05.05 0 0 1-.036-.083L9.14 2.963a.05.05 0 0 1 .085.04zm11.803.706v8.59h-1.306V3.71h1.306zm8.447 0v8.59h-1.345V3.71h1.345zm-10.265.048v8.38h-1.288V8.138h-.776V6.875h.776V3.757h1.288zm5.398-.02c.353 0 .677.05.97.149.294.099.548.25.763.455.214.203.385.458.511.765.126.306.199.663.218 1.071a30.552 30.552 0 0 1 0 3.052 3.16 3.16 0 0 1-.218 1.076 2.2 2.2 0 0 1-.511.76 2.037 2.037 0 0 1-.762.455 3.031 3.031 0 0 1-.971.148c-.714 0-1.291-.2-1.733-.602-.442-.402-.685-1.015-.73-1.837a95.334 95.334 0 0 1-.033-.785 19.155 19.155 0 0 1 0-1.483c.01-.248.021-.51.034-.784.044-.823.287-1.435.729-1.836.442-.403 1.02-.604 1.733-.604zm-7.084.182v1.187h-.531l-.016 5.075.614-.024v1.167l-4.47.192v-1.187l.624-.024-.017-5.2h-.531V3.92h4.327zm7.084 1.005c-.165 0-.312.027-.44.081a.814.814 0 0 0-.337.268c-.095.124-.17.288-.227.492-.057.205-.095.46-.114.766-.025.376-.038.767-.038 1.172 0 .405.013.796.038 1.172.02.306.057.561.114.765.057.204.132.368.227.493a.82.82 0 0 0 .336.268c.13.054.276.08.44.08.165 0 .312-.026.44-.08a.82.82 0 0 0 .337-.268c.095-.125.17-.289.228-.493.056-.204.094-.46.113-.765a17.748 17.748 0 0 0 0-2.343 3.805 3.805 0 0 0-.113-.767 1.454 1.454 0 0 0-.228-.492.814.814 0 0 0-.336-.268 1.127 1.127 0 0 0-.44-.081zm-8.894.182h-.707l.016 5.15.675-.026.016-5.124z" fill="#fff"></path>
                                        </svg>
                                    </label>
                                </div>
                                <div class="safe_pay_notice">
                                    <div>
                                        <span class="check"></span>
                                        <p>
                                            안전결제(번개페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.
                                            <br><small>거절 시,이용 제재가 있을 수 있으니 주의해 주세요.</small>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="check"></span>
                                        <p>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</p>
                                    </div>
                                    <div>
                                        <span class="check"></span>
                                        <p>번개페이 배지로 더 많은 관심을 받을 수 있어요.</p>
                                    </div>
                                </div>
                                <p>* 번개페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.</p>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="./inc/footer.jsp" />
	</footer></body>
</html>