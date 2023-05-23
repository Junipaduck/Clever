<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 상품등록</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css?after">

<!-- 상세페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_product_detail.css">

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
		<jsp:include page="../inc/header.jsp" />
	</header>    <!--메인 컨텐츠-->
        <div id="main_content">
            
            
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보 <span class="red">* 필수항목</span></h2>
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
                            <span class="goods_title_length"><span></span>/40</span>
                        </div>
                    </div>
                    <div class="goods_category_area">
                        <p>카테고리<span class="red">*</span></p>
                        <div>
                            <div class="goods_category">
                                <div class="goods_Lcategory">
                                    <div>의류/잡화</div>
                                    <div>디지털/가전</div>
                                    <div>도서/티켓/문구</div>
                                    <div>뷰티/미용</div>
                                    <div>식품</div>
                                    <div>반려동물용품</div>
                                    <div>기타</div>
                                </div>
                                <div class="goods_Scategory_cloth hidden">
                                    <div>의류</div>
                                    <div>잡화</div>
                                </div>
<!--                                 <div class="goods_Scategory_cloth hidden"> -->
<!--                                     <div>디지털</div> -->
<!--                                     <div>가전</div> -->
<!--                                 </div> -->
<!--                                 <div class="goods_Scategory_acc hidden"> -->
<!--                                     <div>시계/쥬얼리</div> -->
<!--                                     <div>패션악세서리</div> -->
<!--                                 </div> -->
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
                                <button id="btnAddress" onclick="return false;">주소검색</button>
                                <!-- 주소 입력 받는 api -->
				              	<small id="small6" class="form-text text-muted">거래 지역을 입력해주세요</small>
						               <!-- 주소 API 스크립트 -->
						                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
										window.onload = function(){
										    document.getElementById("btnAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
										        //카카오 지도 발생
										        new daum.Postcode({
										            oncomplete: function(data) { //선택시 입력값 세팅
										                document.getElementById("product_address").value = data.sido + " " + data.sigungu + " " + data.query; // 주소 넣기
										            }
										        }).open();
										    });
										}
										</script>
                                <button onclick="return false;">지역설정안함</button>
                            </div>
                            <input type="text" id="product_address" name="product_address" readonly>
                        </div>
                    </div>
                    <div class="goods_status_area">
                        <p>상태<span class="red">*</span></p>
                        <div class="goods_status">
                            <input type="radio" name="status" value="used" id="used">
                            <label for="used">중고</label>
                            <input type="radio" name="status" value="new" id="new">
                            <label for="new">미개봉</label>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>가격<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="goodsPrice" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)">원</p>
                            <input type="checkbox" name="deliveryPrice" id="deliveryPrice">
                            <label for="deliveryPrice">배송비 포함</label>
                             <input type="checkbox" name="priceOffer" id="priceOffer">
                            <label for="deliveryPrice">가격제안받기</label>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>설명<span class="red">*</span></p>
                        <div>
                            <textarea name="goodsInfo" id="goodsInfo" cols="30" rows="10"
                            maxlength="2000" oninput="countInfoLength(event)"></textarea>
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
<!--                     <div class="goods_count_area"> -->
<!--                         <p>수량</p> -->
<!--                         <div><input type="text" name="goodsCount" value="1" oninput="valueIsNumber(event)">개</div>  -->
<!--                     </div> -->
                    <!--번개페이 뻐른 판매-->
                    <div class="fast_selling_area">
                        <h2>클레버 페이</h2>
                        <div class="goods_option_area">
                            <p>옵션</p>
                            <div class="goods_option">
                                <div class="goods_status">
		                            <input type="radio" name="status" value="account" id="account">
		                            <label for="account">계좌 이체</label>
		                            <input type="radio" name="status" value="" id="">
		                            <label for="point">?</label>
		                        </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-4" style="margin-left: 650px;">
                        <div class="p-3 info_btn3" style="text-align: center;">바로구매</div>
                        <div class="p-3 info_btn1"style="text-align: center; margin-left: 30px">돌아가기</div>
                    </div>
                </form>
            </section>
        </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>