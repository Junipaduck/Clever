<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 중고상품 수정</title>
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
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>   
	
	
	
	 <!--메인 컨텐츠-->
     <div id="main_content">
            
            <!--판매 폼-->
          <c:forEach items="${productDetail }" var="productDetail">
            <section class="goods_form">
                <h2>기본정보 수정하기 <span class="red">* 필수항목</span></h2>
                <form action="productModifyPro" method="POST" class="frm_selling_goods" enctype="multipart/form-data">
                	<input type="hidden" name="member_id" value="${sessionScope.sId }"> 
                	<input type="hidden" name="product_idx" value="${param.product_idx }"> 
                    <div class="goods_images_area">
                        <p>상품이미지<span class="red">*</span>
                            <span class="image_limit">(<span class="image_num"></span>/4)</span>
                        </p>
                        <div>
                            <div class="goods_images">
                                <div>
                                    이미지 등록
                                    <input type="file" name="file"  accept="image/jpg, image/jpeg, image/png" multiple onchange="setImages(event);">
                                </div>
                                <div class="preview_wrap">
                               	  <!-- 이미지삭제버튼을 클릭하면 삭제 -->
                                  <script src="js/jquery-3.6.4.js"></script>
                               	  <script type="text/javascript">
		                               	function deleteListItem(button) { // => 이미지를 삭제하는 x아이콘을 눌렀을때 실행되는 것들
	                               	  		/* 1. 뷰 삭제작업 - <li>태그를 listItem에 저장하고 removeChild를 호출하여 <li>태그를 삭제시킴 */
		                               	    var listItem = button.parentNode;
		                               	    listItem.parentNode.removeChild(listItem);
		                               	    
		                               	    /* 2. DB삭제작업 - (file테이블의 이미지 삭제) */
				                               	$.ajax({
				                               	    url: 'productModifyPro', // 이동할 컨트롤러의 서블릿 url
				                               	    type: 'POST',
					                               	data: {
					                               		fileVO: {
					                                        file_name: $("#fileName-${loop.index}").val()
					                                    }
					         						},
				                               	    success: function(response) { 
				                               	        alert("파일 삭제 요청 성공!");
	
				                               	        // 성공한 후에 delete 구문을 실행
				                               	        $.ajax({
				                               	            url: 'deleteFile', // delete 구문을 처리하는 컨트롤러의 URL
				                               	            type: 'POST',
				                               	            success: function(deleteResponse) {
				                               	                alert("delete 구문 실행 성공!");
				                               	            },
				                               	            error: function() {
				                               	                alert("delete 구문 실행 실패!");
				                               	            }
				                               	        });
				                               	    },
				                               	    error: function() {
				                               	        // 요청이 실패했을 때 실행할 동작
				                               	        alert("파일 삭제 요청 실패!");
				                               	    }
				                               	});
			                               	 
			                               	 
		                               	  }// onclick function 끝!
                                  </script>
<%--                                		 <c:forEach items="${filesList }" var="filesItem"> <!-- 사진 select 하는 forEach문 --> --%>
<%-- 	                               		<c:set var="length" value="${fn:length(filesItem.file_name) }" /> --%>
<%-- 										<c:set var="index" value="${fn:indexOf(filesItem.file_name, '_') }" /> --%>
<%-- 										<c:set var="file_name" value="${fn:substring(filesItem.file_name, index + 1, length) }" /> --%>
<%-- 											<c:if test="${filesItem.file_num eq productDetail.product_idx }"> --%>
<!-- 			                                	<li draggable="false" class="sc-gkFcWv iiYIYa"> -->
<%-- 			                                		<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" class="preview"> --%>
<%-- 			                                		<input type="hidden" id="fileName" value="${filesItem.file_name }"> ${filesItem.file_name } --%>
<!-- 			                                		<button class="eHGbgX" type="button" onclick="deleteListItem(this)"></button> -->
<!-- 			                                	</li> -->
<%-- 			                                </c:if> --%>
<%-- 			                         </c:forEach> --%>
			                         
			                         <c:forEach items="${filesList}" var="filesItem" varStatus="loop">
									    <c:set var="length" value="${fn:length(filesItem.file_name) }" />
									    <c:set var="index" value="${fn:indexOf(filesItem.file_name, '_') }" />
									    <c:set var="file_name" value="${fn:substring(filesItem.file_name, index + 1, length) }" />
									    <c:if test="${filesItem.file_num eq productDetail.product_idx}">
									        <li draggable="false" class="sc-gkFcWv iiYIYa">
									            <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" class="preview">
									            <input type="hidden" id="fileName-${loop.index}" value="${filesItem.file_name}">
									            ${filesItem.file_name}
									            <button class="eHGbgX" type="button" onclick="deleteListItem(this)"></button>
									        </li>
									    </c:if>
									</c:forEach>
									
                                </div>
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
                            <input type="text" name="product_subject" id="product_subject" value="${productDetail.product_subject }" maxlength="40"
                                placeholder="상품 제목을 입력해주세요." oninput="countTitleLength(event);" style="width: 700px;">
                            <span class="goods_title_length"><span></span>/40</span>
                        </div>
                    </div>
                    <div class="goods_category_area">
                        <p>카테고리<span class="red">*</span></p>
                        	<select class="form-select" name="product_category" aria-label="Default select example" style="width: 244px; height: 48px;">
							  <option selected value="${productDetail.product_category }">${productDetail.product_category }</option>
							  <option value="의류/잡화">의류/잡화</option>
							  <option value="디지털/가전">디지털/가전</option>
							  <option value="도서/티켓/문구">도서/티켓/문구</option>
							  <option value="뷰티/미용">뷰티/미용</option>
							  <option value="식품">식품</option>
							  <option value="반려동물용품">반려동물용품</option>
							  <option value="기타">기타</option>
							</select>
                        
<!--                           <p id="category_clothes"> -->
<!--                         <span> -->
<!--                             <i class="bi bi-chevron-right"></i> -->
<!--                         </span> -->
<!--                         <span> -->
<!--                             <ul class="category_clothes_bar"> -->
<!--                                 <li><a href="#">남성의류</a></li> -->
<!--                                 <li class="hidden_menu"><a href="#">여성의류</a></li> -->
<!--                             </ul> -->
<!--                             <i class="bi bi-chevron-down under_direction"></i> -->
<!--                         </span> -->
<!--                     	</p> -->
                    	
<!--                         <div> -->
<!--                             <div class="goods_category"> -->
<!--                                 <div class="goods_Lcategory"> -->
<!--                                     <div>의류/잡화</div> -->
<!--                                     <div>디지털/가전</div> -->
<!--                                     <div>도서/티켓/문구</div> -->
<!--                                     <div>뷰티/미용</div> -->
<!--                                     <div>식품</div> -->
<!--                                     <div>반려동물용품</div> -->
<!--                                     <div>기타</div> -->
<!--                                 </div> -->
<!--                                 <div class="goods_Scategory_cloth hidden"> -->
<!--                                     <div>디지털</div> -->
<!--                                     <div>가전</div> -->
<!--                                 </div> -->
<!--                                 <div class="goods_Scategory_acc hidden"> -->
<!--                                     <div>시계/쥬얼리</div> -->
<!--                                     <div>패션악세서리</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <p class="hidden"><span>⊘</span> 상세 카테고리를 확인해주세요</p> -->
<!--                             <p>선택한 카테고리 : <span class="selected_category"></span></p> -->
<!--                             <input type="hidden" name="Lcategory"> -->
<!--                             <input type="hidden" name="Scategory"> -->
<!--                         </div> -->
                    </div>
                    <div class="goods_location_area">
                        <p>거래지역<span class="red">*</span></p>
                        <div class="goods_location">
                            <div class="location_button_area">
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
                            </div>
                            <input type="text" id="sale_location" name="sale_location" value="${productDetail.sale_location }" readonly>
                        </div>
                    </div>
                    <div class="goods_status_area">
                        <p>상태<span class="red">*</span></p>
                        <div class="goods_status">
                        	<!-- 만약 상품상태가 '중고'면 중고라디오에 checked -->
                        	<c:choose>
                        		<c:when test="${productDetail.product_status eq '중고' }">
		                            <input type="radio" name="product_status" value="중고" id="used" checked="checked">
		                            <label for="used">중고</label>
		                            <input type="radio" name="product_status" value="미개봉" id="new">
		                            <label for="new">미개봉</label>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="radio" name="product_status" value="중고" id="used">
		                            <label for="used">중고</label>
		                            <input type="radio" name="product_status" value="미개봉" id="new" checked="checked">
		                            <label for="new">미개봉</label>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>가격<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="product_price" value="${productDetail.product_price }" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)" style="width: 700px;">원</p>
                            <input type="checkbox" name="deliveryPrice" id="deliveryPrice">
                            <label for="deliveryPrice">배송비 포함</label>
                             <input type="checkbox" name="priceOffer" id="priceOffer">
                            <label for="deliveryPrice">가격제안받기</label>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>상품설명<span class="red">*</span></p>
                        <div>
                            <textarea name="product_content" id="product_content"cols="30" rows="10"
                            maxlength="2000" oninput="countInfoLength(event)">${productDetail.product_content }</textarea>
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
                                <input type="text" name="product_tag" id="product_tag" value="${productDetail.product_tag }"
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
				            <input type="submit" class="p-3 info_btn3" value="수정하기">
				        </div>
			    	</div>
                </form>
            </section>
           </c:forEach>
        </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>