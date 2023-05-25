<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 경매상품등록</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css?after">
<!-- 햄버거 메뉴 호버시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js"></script>
<!-- 데이트피커 cdn -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/datepicker.css">
 
<!-- 타임피커 cdn -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/timepicker.css">
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
$(function() {
    $( "#testDatepicker" ).datepicker({
    });
});
$(function() {
	$("#formform").on("submit", function() {
		$("#auction_category").val($(".selected_category").text()); 
			startEndDate();
		if(!startEndDateStats){
			return false;
		}
	});
});
function startEndDate() {
	startEndDateStats = false;
	var start = $("#auction_start_date").val() + " " + $("#auction_start_time").val();
	var end = $("#auction_end_date").val() + " " + $("#auction_end_time").val();
	if(start > end){
		alert("경매 시작일 보다 경매 마감일이 더 빠릅니다.");
		return;
	} else {
		startEndDateStats = true;
	}
}
</script>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="auction_header.jsp" />
	</header>    
<!--메인 컨텐츠 -->
        <div id="main_content">
            <!--하위 메뉴-->
            <nav class="content_nav">
                <a href="auction_upload" class="active">경매등록</a>
                <a href="auction_management">경매관리</a>
                <a href="auction_buy">낙찰 내역</a>
                <a href="auction_sell">판매 내역</a>
            </nav>
            
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보 <span class="red">* 필수항목</span></h2>
                <form action="auction_upload_pro" class="frm_selling_goods" id="formform" enctype="multipart/form-data" method="post">
                    <div class="goods_images_area">
                        <p>상품이미지<span class="red">*</span>
                            <span class="image_limit">(<span class="image_num"></span>/4)</span>
                        </p>
                        <div>
                            <div class="goods_images">
                                <div>
                                    이미지 등록
                                    <input type="file" name="auction_images" accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);">
                                    <input type="file" name="auction_images" accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);">
                                    <input type="file" name="auction_images" accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);">
                                    <input type="file" name="auction_images" accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);">
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
                            <input type="text" name="auction_title" id="goods_title" maxlength="40"
                                placeholder="상품 제목을 입력해주세요." oninput="countTitleLength(event);">
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
                                <div class="goods_Mcategory">
                                    중분류 선택
                                </div>
                                <div class="goods_Mcategory_cloth hidden">
                                    <div>남성의류</div>
                                    <div>여성의류</div>
                                </div>
                                <div class="goods_Mcategory_acc hidden">
                                    <div>시계/쥬얼리</div>
                                    <div>패션악세서리</div>
                                </div>
                                <div class="goods_Scategory">
                                    소분류 선택
                                </div>
                                <div class="goods_Scategory_cloth hidden">
                                    <div>티셔츠</div>
                                    <div>바지</div>
                                </div>
                                <div class="goods_Scategory_acc hidden">
                                    <div>시계</div>
                                    <div>악세사리</div>
                                </div>
                            </div>
                            <p class="hidden"><span>⊘</span> 상세 카테고리를 확인해주세요</p>
                            <p>선택한 카테고리 : <span class="selected_category"></span></p>
                            <input type="hidden" id="auction_category" name="auction_category" value="">
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
										                document.getElementById("auction_address").value = data.sido + " " + data.sigungu + " " + data.query; // 주소 넣기
										            }
										        }).open();
										    });
										}
										</script>
                                <button onclick="return false;">지역설정안함</button>
                            </div>
                            <input type="text" id="auction_address" name="auction_address" readonly>
                        </div>
                    </div>
                    <div class="goods_status_area">
                        <p>상태<span class="red">*</span></p>
                        <div class="goods_status">
                            <input type="radio" name="auction_status" value="used" id="used" >
                            <label for="used">미개봉</label>
                            <input type="radio" name="auction_status" value="new" id="new">
                            <label for="new">거의 새 것</label>
                            <input type="radio" name="auction_status" value="new" id="new">
                            <label for="new">사용감 있음</label>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>즉시 구매 액<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="auction_price" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)">&nbsp;&nbsp;&nbsp;원</p>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>입찰 시작 액<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="auction_min_bid" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)">&nbsp;&nbsp;&nbsp;원</p>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>입찰 최소 증가 액<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="auction_min_increase" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)">&nbsp;&nbsp;&nbsp;원</p>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>경매 시작/마감일<span class="red">*</span></p>
                        <div class="goods_price">
                       <p>
						<input type="text" name="auction_start_date" id="auction_start_date" class="datepicker inp" placeholder="날짜를 선택 해주세요" readonly="true" required="required" style="text-align: center; width: 24%" /> 
						<!-- 캘린더 옵션 { -->
						<script>
					    $.datepicker.setDefaults({
					      closeText: "닫기",
					      prevText: "이전달",
					      nextText: "다음달",
					      currentText: "오늘",
					      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
					        "7월", "8월", "9월", "10월", "11월", "12월"
					      ],
					      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
					        "7월", "8월", "9월", "10월", "11월", "12월"
					      ],
					      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
					      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
					      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
					      weekHeader: "주",
					      dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
					      firstDay: 0,
					      isRTL: false,
					      showMonthAfterYear: true,
					      yearSuffix: "년"
					    })
					    $(".datepicker").datepicker({
					      minDate: 2
					    })
					    
						</script>
						<input type="text" name="auction_start_time" id="auction_start_time" class="timepicker inp" readonly="true" required="required" style="width: 24%;" placeholder="시간을 선택해 주세요."/> 
						 <!-- 시간 옵션 { -->
						  <script>
						  $('.timepicker').timepicker({
						    timeFormat: 'HH:mm',
						    interval: 60,
						    minTime: "10:00",
						    maxTime: "12:00",
						    dynamic: false,
						    dropdown: true,
						    scrollbar: true
						   });
						  </script>
					  <!-- } -->
						<!-- } -->
						<input type="text" name="auction_end_date" id="auction_end_date" class="datepicker inp" placeholder="날짜를 선택 해주세요" readonly="true" required="required" style="text-align: center; width: 24%;" /> 
						<!-- 캘린더 옵션 { -->
						<script>
					    $.datepicker.setDefaults({
					      closeText: "닫기",
					      prevText: "이전달",
					      nextText: "다음달",
					      currentText: "오늘",
					      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
					        "7월", "8월", "9월", "10월", "11월", "12월"
					      ],
					      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
					        "7월", "8월", "9월", "10월", "11월", "12월"
					      ],
					      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
					      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
					      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
					      weekHeader: "주",
					      dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
					      firstDay: 0,
					      isRTL: false,
					      showMonthAfterYear: true,
					      yearSuffix: "년"
					    })
					    $(".datepicker").datepicker({
					      minDate: 3
					    })
					    
						</script>
						<input type="text" name="auction_end_time" id="auction_end_time" class="timepicker inp" readonly="true" required="required" style="width: 24%;" placeholder="시간을 선택해 주세요." /> 
						 <!-- 시간 옵션 { -->
						  <script>
						  $('.timepicker').timepicker({
						    timeFormat: 'HH:mm',
						    interval: 60,
						    minTime: "10:00",
						    maxTime: "12:00",
						    dynamic: false,
						    dropdown: true,
						    scrollbar: true
						   });
						  </script>
					  <!-- } -->
						<!-- } -->
					   </p>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>설명<span class="red">*</span></p>
                        <div>
                            <textarea name="auction_content" id="goodsInfo" cols="30" rows="10"
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
                    <!--번개페이 뻐른 판매-->
                    <div class="fast_selling_area">
                        <h2>빠른 판매</h2>
                        <div class="goods_option_area">
                            <p>옵션</p>
                            <div class="goods_option">
                                <div class="goods_status">
		                            <input type="radio" name="status" value="account" id="account">
		                            <label for="account">계좌 이체</label>
		                            <input type="radio" name="status" value="point" id="point">
		                            <label for="point">포인트 결제</label>
		                        </div>
                            </div>
                        </div>
                    </div>
		        <div class="btn_submit_area">
			        <div class="inner_submit">
			            <!--폼으로 등록 테스트 하실 때 type=submit으로 바꿔서 진행해주세요-->
			            <input type="submit" class="btn_goods_submit" value="등록하기">
			        </div>
		    	</div>
                </form>
            </section>
        </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	</body>
</html>