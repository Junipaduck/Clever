<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 중고상품 등록</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

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
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js?after"></script>
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
.eHGbgX {
    width: 1.5rem;
    height: 1.5rem;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 12px 12px;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTYuODQ4IDZsMy43NzYtMy43NzZhLjYuNiAwIDEgMC0uODQ4LS44NDhMNiA1LjE1IDIuMjI0IDEuMzc2YS42LjYgMCAwIDAtLjg0OC44NDhMNS4xNTIgNiAxLjM3NiA5Ljc3NWEuNi42IDAgMSAwIC44NDguODQ5TDYgNi44NDhsMy43NzYgMy43NzZhLjU5OC41OTggMCAwIDAgMS4wMjQtLjQyNS42LjYgMCAwIDAtLjE3Ni0uNDI0TDYuODQ4IDZ6IiBvcGFjaXR5PSIuNjQiLz4KPC9zdmc+Cg==);
    background-color: rgba(30, 29, 41, 0.32);
    border-radius: 50%;
    position: absolute;
    top: 0.5rem;
    right: 0.5rem;
}
.iiYIYa {
    width: 202px; 
    height: 202px; 
    border: 1px solid rgb(230, 229, 239); 
    margin-right: 1rem; 
    margin-bottom: 1rem; 
    list-style-type: none; 
    position: relative;
    display: flex;
    cursor: pointer;
}

.preview_wrap {
	display: flex;
	}
.goods_Scategory {
display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    overflow-y: auto;
}

</style>
</head>
<body>
<script type="text/javascript">
// from태그가 실행될 때 이 js코드가 실행되며, 
// 카테고리가 선택되면 selected_category라는 이름의 span태그에 값이 들어가는데,
// 그 값을 input hidden 태그 (name이 product_category인 것)의 value에 넣는다는 의미
$(function() {
	$("#formform").on("submit", function() {
		$("#product_category").val($(".selected_category").text()); 
	});
});
</script>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
			</header>    <!--메인 컨텐츠-->
        <div id="main_content">
            
            
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보 <span class="red">* 필수항목</span></h2>
                <form action="productUploadPro" method="POST" class="frm_selling_goods" id="formform" enctype="multipart/form-data">
                	<input type="hidden" name="member_id" value="${sessionScope.sId }"> 
                    <div class="goods_images_area">
                        <p>상품이미지<span class="red">*</span>
                            <span class="image_limit">(<span class="image_num"></span>/4)</span>
                        </p>
                        <div>
                            <div class="goods_images">
                                <div>
                                    이미지 등록
<!--                                     <input type="file" name="file"  accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);"> -->
                               		<input type="file" id="image1" name="image1" accept="image/jpg, image/jpeg, image/png"  onchange="setImages(event);">
                                    <input type="file" id="image2" name="image2" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image3" name="image3" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image4" name="image4" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image5" name="image5" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image6" name="image6" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image7" name="image7" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image8" name="image8" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image9" name="image9" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image10" name="image10" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image11" name="image11" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
                                    <input type="file" id="image12" name="image12" accept="image/jpg, image/jpeg, image/png" hidden="true"  onchange="setImages(event);">
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
                            <input type="text" name="product_subject" id="product_subject" maxlength="40"
                                placeholder="상품 제목을 입력해주세요." oninput="countTitleLength(event);" style="width: 700px;">
                            <span class="goods_title_length"><span></span>/40</span>
                        </div>
                    </div>
                    <div class="goods_category_area">
                        <p>카테고리<span class="red">*</span></p>
                        <div>
                            <div class="goods_category" style="height: 401.818182px;">
                                <div class="goods_Lcategory">
                                    <div>패션의류</div>
                                    <div>패션잡화</div>
                                    <div>취미/컬렉션</div>
                                    <div>디지털</div>
                                    <div>스포츠/레저</div>
                                    <div>뷰티</div>
                                    <div>생활가전</div>
                                    <div>자동차/공구</div>
                                    <div>도서/기타</div>
                                </div>
                                <div class="goods_Mcategory">
                                    중분류 선택
                                </div>
                                <div class="goods_Mcategory_cloth hidden">
                                    <div>남성의류</div>
                                    <div>여성의류</div>
                                    <div>언더웨어</div>
                                </div>
                                <div class="goods_Mcategory_acc hidden">
                                    <div>신발</div>
                                    <div>가방/잡화</div>
                                    <div>쥬얼리/시계</div>
                                    <div>수입명품</div>
                                </div>
                                <div class="goods_Mcategory_hobby hidden">
                                    <div>반려동물용품</div>
                                    <div>악기/취미</div>
                                    <div>문구/사무용품</div>
                                    <div>꽃/이벤트용품</div>
                                </div>
                                <div class="goods_Mcategory_digital hidden">
                                    <div>노트북/데스크탑</div>
                                    <div>모니터/프린터</div>
                                    <div>PC주변기기</div>
                                    <div>저장장치</div>
                                </div>
                                <div class="goods_Mcategory_sports hidden">
                                    <div>스포츠의류/운동화</div>
                                    <div>등산/아웃도어/캠핑/낚시</div>
                                    <div>스포츠용품</div>
                                    <div>자전거/보드/기타레저</div>
                                </div>
                                <div class="goods_Mcategory_beauty hidden">
                                    <div>화장품/향수</div>
                                    <div>바디/헤어</div>
                                </div>
                                <div class="goods_Mcategory_life hidden">
                                    <div>가구DIY</div>
                                    <div>조명/인테리어</div>
                                    <div>침구/커튼</div>
                                    <div>생활용품</div>
                                </div>
                                <div class="goods_Mcategory_car hidden">
                                    <div>자동차용품</div>
                                    <div>공구/안전/산업용품</div>
                                </div>
                                <div class="goods_Mcategory_book hidden">
                                    <div>도서/교육/음반</div>
                                    <div>백화점/제화상품권</div>
                                    <div>여행/항공권</div>
                                    <div>e쿠폰/모바일상품권</div>
                                </div>
                                <div class="goods_Scategory">
                                    소분류 선택
                                </div>
                                <div class="goods_Scategory_clothA hidden">
                                    <div>반팔티셔츠</div>
                                    <div>바지</div>
                                </div>
                                <div class="goods_Scategory_clothB hidden">
                                    <div>셔츠/블라우스</div>
                                    <div>티셔츠</div>
                                </div>
                                <div class="goods_Scategory_clothC hidden">
                                    <div>여성 언더웨어</div>
                                    <div>남성 언더웨어</div>
                                </div>
                                <div class="goods_Scategory_accA hidden">
                                    <div>남성신발</div>
                                    <div>여성신발</div>
                                </div>
                                <div class="goods_Scategory_accB hidden">
                                    <div>남성가방</div>
                                    <div>여성가방</div>
                                </div>
                                <div class="goods_Scategory_accC hidden">
                                    <div>악세사리</div>
                                    <div>팔찌/발찌/시계</div>
                                </div>
                                <div class="goods_Scategory_accD hidden">
                                    <div>명품의류</div>
                                    <div>명품 지갑/벨트</div>
                                </div>
                                <div class="goods_Scategory_hobbyA hidden">
                                    <div>강아지사료</div>
                                    <div>강아지간식</div>
                                </div>
                                <div class="goods_Scategory_hobbyB hidden">
                                    <div>악기/악기용품</div>
                                    <div>게임/게임용품</div>
                                </div>
                                <div class="goods_Scategory_hobbyC hidden">
                                    <div>보드/게시판</div>
                                    <div>도장/스탬프</div>
                                </div>
                                <div class="goods_Scategory_hobbyD hidden">
                                    <div>원예/식물</div>
                                    <div>이벤트/파티용품</div>
                                </div>
                                <div class="goods_Scategory_digitalA hidden">
                                    <div>노트북</div>
                                    <div>데스크탑</div>
                                </div>
                                <div class="goods_Scategory_digitalB hidden">
                                    <div>모니터</div>
                                    <div>프린터</div>
                                </div>
                                <div class="goods_Scategory_digitalC hidden">
                                    <div>PC용품</div>
                                    <div>PC부품</div>
                                </div>
                                <div class="goods_Scategory_digitalD hidden">
                                    <div>HDD/SSD</div>
                                    <div>저장장치용품</div>
                                </div>
                                <div class="goods_Scategory_sportsA hidden">
                                    <div>스포츠남성의류</div>
                                    <div>스포츠여성의류</div>
                                </div>
                                <div class="goods_Scategory_sportsB hidden">
                                    <div>등산의류</div>
                                    <div>등산장비</div>
                                </div>
                                <div class="goods_Scategory_sportsC hidden">
                                    <div>스포츠아이템</div>
                                    <div>스포츠기구</div>
                                </div>
                                <div class="goods_Scategory_sportsD hidden">
                                    <div>자전거</div>
                                    <div>보드/기타레저</div>
                                </div>
                                <div class="goods_Scategory_beautyA hidden">
                                    <div>스킨케어</div>
                                    <div>향수</div>
                                </div>
                                <div class="goods_Scategory_beautyB hidden">
                                    <div>바디케어</div>
                                    <div>헤어케어</div>
                                </div>
                                <div class="goods_Scategory_lifeA hidden">
                                    <div>침대/매트릭스</div>
                                    <div>옷장/붙박이장</div>
                                </div>
                                <div class="goods_Scategory_lifeB hidden">
                                    <div>전구/형광등</div>
                                    <div>조명기구</div>
                                </div>
                                <div class="goods_Scategory_lifeC hidden">
                                    <div>침구세트</div>
                                    <div>토퍼/패드</div>
                                </div>
                                <div class="goods_Scategory_lifeD hidden">
                                    <div>수납/정리용품</div>
                                    <div>선반/행거/진열대</div>
                                </div>
                                <div class="goods_Scategory_carA hidden">
                                    <div>자동차관리용품</div>
                                    <div>자동차내부용품</div>
                                </div>
                                <div class="goods_Scategory_carB hidden">
                                    <div>공구</div>
                                    <div>안전용품</div>
                                </div>
                                <div class="goods_Scategory_bookA hidden">
                                    <div>중고도서</div>
                                    <div>전자책</div>
                                </div>
                                <div class="goods_Scategory_bookB hidden">
                                    <div>롯데백화점</div>
                                    <div>신세계백화점</div>
                                </div>
                                <div class="goods_Scategory_bookC hidden">
                                    <div>해외항공권</div>
                                    <div>국내항공권</div>
                                </div>
                                <div class="goods_Scategory_bookD hidden">
                                    <div>문화상품권</div>
                                    <div>기타상품권</div>
                                </div>
                            </div>
                            <p class="hidden"><span>⊘</span> 상세 카테고리를 확인해주세요</p>
                            <p>선택한 카테고리 : <span class="selected_category"></span></p>
                            <input type="hidden" id="product_category" name="product_category" value="">
                        </div>
                    </div>
                    <div class="goods_location_area">
                        <p>거래지역<span class="red">*</span></p>
                        <div class="goods_location">
                            <div class="location_button_area">
                                <button onclick="return false;">내위치</button>
                                <button id="btnAddress" onclick="return false;">주소검색</button>
                                <!-- 주소 입력 받는 api -->
						               <!-- 주소 API 스크립트 -->
						                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
										window.onload = function(){
										    document.getElementById("btnAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
										        //카카오 지도 발생
										        new daum.Postcode({
										            oncomplete: function(data) { //선택시 입력값 세팅
										                document.getElementById("sale_location").value = data.sido + " " + data.sigungu + " " + data.query; // 주소 넣기
										            }
										        }).open();
										    });
										}
										</script>
                                <button onclick="return false;">지역설정안함</button>
                            </div>
                            <input type="text" id="sale_location" name="sale_location" readonly>
                        </div>
                    </div>
                    <div class="goods_status_area">
                        <p>상태<span class="red">*</span></p>
                        <div class="goods_status">
                            <input type="radio" name="product_status" value="중고" id="used">
                            <label for="used">중고</label>
                            <input type="radio" name="product_status" value="미개봉" id="new">
                            <label for="new">미개봉</label>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>가격<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="product_price" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)" style="width: 700px;">원</p>
                            <input type="checkbox" name="deliveryPrice" id="deliveryPrice">
                            <label for="deliveryPrice">배송비 포함</label>
                             <input type="checkbox" name="priceOffer" id="priceOffer">
                            <label for="deliveryPrice">가격제안받기</label>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>상품설명<span class="red">*</span></p>
                        <div>
                            <textarea name="product_content" id="product_content" cols="30" rows="10"
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
                                <input type="text" name="product_tag" id="product_tag" 
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
                        <h2>결제수단</h2>
                        <div class="goods_option_area">
                            <p>옵션</p>
                            <div class="goods_option">
                                <div class="goods_status">
		                            <input type="radio" name="sale_pay" value="계좌이체" id="sale_pay1">
		                            <label for="account">계좌이체</label>
		                            <input type="radio" name="sale_pay" value="카드결제" id="sale_pay2">
		                            <label for="point">카드결제</label>
		                            <input type="radio" name="sale_pay" value="만나서결제" id="sale_pay3">
		                            <label for="point">만나서결제</label>
		                        </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-4" style="margin-left: 650px;">
<!--                         <div class="p-3 info_btn3" style="text-align: center;">바로구매</div> -->
                        <div class="p-3 info_btn1"style="text-align: center; margin-left: 30px" onclick="javascript:history.back()">돌아가기</div>
                    </div>
			        <div class="btn_submit_area">
				        <div class="inner_submit" style="margin-left: 650px;">
				            <!--폼으로 등록 테스트 하실 때 type=submit으로 바꿔서 진행해주세요-->
				            <input type="submit" class="p-3 info_btn3" value="등록하기">
				        </div>
			    	</div>
                </form>
            </section>
        </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>