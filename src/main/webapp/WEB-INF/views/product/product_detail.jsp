<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clever - 중고상품 상세페이지</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- 공통 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
    <!-- 상세페이지 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_product_detail.css">

    <!-- 햄버거 메뉴 호버시 -->
    <script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>
    <!-- 파비콘 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
</head>
<body>
<script src="js/jquery-3.6.4.js"></script>
<script type="text/javascript">

	/* [삭제하기]버튼을 클릭하면 게시글이 삭제됨 */
	function deleteProduct() {
		if(window.confirm("상품을 삭제하시겠습니까?")){
		location.href="deleteProduct?product_idx=${param.product_idx}";
		}
	}
	
	/* [바로구매]버튼을 클릭하면 계좌이체를 할 수 있는 새창이 띄워짐 */
	function payProduct(){
		    window.open("payProduct?product_idx=${param.product_idx}", "바로구매새창", "width=800, height=1200" );
	}
	
	/* 찜하기 AJAX 찜하기 버튼 누르면 상호작용 */
	let product_idx = document.location.href.split("=")[1];
	
	$(document).ready(function() {
		 $(".dibs").on("click", function(){
		 	$.ajax({
		 		url : "dibsCheck",
		 		type: 'GET',
		 		data: {'product_idx':product_idx, 'member_id':'${sessionScope.sId}'},
		 		success:function(data){
				
		 			if(data==1){
		 				alert("상품 찜 하셨습니다.");
		 				$('#dibsImage').attr("src","${pageContext.request.contextPath }/resources/images/goods/hearton.png");
		 				$('#dibsback').attr("style","background-color: #333333");
		 				var result = confirm('찜목록으로 이동하시겠습니까?');
		 				if (result) {
		 					//yes
		 	 				//찜 리스트 페이지 생성 후 -> 찜리스트 페이지 이동으로 변경 
		 					location.href='myPage.me'; 
		 	 			} 
		 			}
		 			else if(data == -1){
		 				alert("로그인이 필요한 서비스입니다. ");
		 				location.href='loginForm.me';
		 			} 		 			
		 			else {
		 				alert("상품 찜 취소하셨습니다. ");
		 				$('#dibsImage').attr("src","${pageContext.request.contextPath }/resources/images/goods/w_heart.svg");
		 				$('#dibsback').attr("style","background-color: #CCCCCC");
		 			}
		 		},
		 		error:function(error){
		 			console.log(error);
		 		}
		 	});
		 });
	}); 
	
	
</script>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
    <!-- main_content 영역 -->
    <c:forEach items="${productDetail }" var="productDetail">
        <div id="main_content">
            <!-- detail_content -->
	            <div id="detail_content">
	                <div class="container text-center">
	                    <div class="row">
	                        <div class="col detail_content_img">
	                            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
	                                <div class="carousel-indicators">
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active change" id="change1" aria-current="true" aria-label="Slide 1"></button>
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" id="change2" aria-label="Slide 2"></button>
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" id="change3" aria-label="Slide 3"></button>
	                                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" id="change3" aria-label="Slide 4"></button>
	                                </div>
	                                
			                              	 	 <div class="carousel-inner">
					                               <c:forEach items="${fileList }" var="fileList"> <!-- 첫번째사진 select 하는 forEach문 -->
					                               		<c:set var="length" value="${fn:length(fileList.file_name) }" />
														<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
														<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
															<c:if test="${fileList.file_num eq productDetail.product_idx }">
							                                    <div class="carousel-item active">
							                                        <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" class="d-block w-100" width="184" height="470" >
							                                    </div>
							                                    
							                                    	<c:forEach items="${filesList}" var="filesItem" varStatus="loop"> <!-- 첫번째사진을 제외한 나머지를 select하는 forEach문 -->
																	    <c:set var="length" value="${fn:length(filesItem.file_name)}" />
																	    <c:set var="index" value="${fn:indexOf(filesItem.file_name, '_')}" />
																	    <c:set var="file_name" value="${fn:substring(filesItem.file_name, index + 1, length)}" />
																	    <c:if test="${filesItem.file_num eq productDetail.product_idx and loop.index ne 0}">
																	        <div class="carousel-item">
																	            <img src="${pageContext.request.contextPath}/resources/fileUpload/${file_name}" class="d-block w-100" width="184" height="470">
																	        </div>
																	    </c:if>
																	</c:forEach>

<!-- 								                                    <div class="carousel-item"> -->
<%-- 								                                        <img src="${pageContext.request.contextPath }/resources/fileUpload/cat.png" class="d-block w-100" width="184" height="470" alt="상품 사진2"> --%>
<!-- 								                                    </div> -->
<!-- 							                                    <div class="carousel-item"> -->
<%-- 							                                        <img src="${pageContext.request.contextPath }/resources/fileUpload/hana_cat3.jpg" class="d-block w-100" width="184" height="470" alt="상품 사진3"> --%>
<!-- 							                                    </div> -->
<!-- 							                                    <div class="carousel-item"> -->
<%-- 							                                        <img src="${pageContext.request.contextPath }/resources/fileUpload/hana_cat4.jpg" class="d-block w-100" width="184" height="470" alt="상품 사진4"> --%>
<!-- 																</div> -->
															</c:if>
                               						</c:forEach>
			                                	</div>
	                                
	                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                                    <span class="visually-hidden">Previous</span>
	                                </button>
	                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                                    <span class="visually-hidden">Next</span>
	                                </button>
	                            </div>
	                        </div>
	                        <div class="col detail_content_info">
	                        <input hidden="">
	                            	<h2>${productDetail.product_subject }</h2>
	                            <p>${productDetail.product_price }<span>원</span></p>
	                            <hr>
	                            <div id="detail_content_info_mid">
	                                <p style="width: 80px;">
	                                    <img src="${pageContext.request.contextPath }/resources/images/goods/heart.png" alt="찜">
	                                    <span>17</span>
	                                </p>
	                                <p style="width: 80px;">
	                                    <img src="${pageContext.request.contextPath }/resources/images/goods/eye.png" alt="조회">
	                                    <span>76</span>
	                                </p>
	                                <p style="width: 150px;">
	                                    <img src="${pageContext.request.contextPath }/resources/images/goods/time.png" alt="업로드날짜">
	                                    <span>${productDetail.product_date }</span>
	                                </p>
	                                <p>
		          						<img src="${pageContext.request.contextPath }/resources/images/report.png" style="width: 30px; margin-bottom: 8px" onclick="location.href='productReport?seller_id=${productDetail.member_id}&reporter_id=${sessionScope.sId }'">
	                                    <span>신고하기</span>
	                                </p>
	                            </div>
	                            <div id="detail_content_info_state">
	                                <p>
	                                    <span>· 상품상태</span>
	                                    <span>${productDetail.product_status }</span>
	                                </p>
	                                 <p>
	                                    <span>· 결제방식</span>
	                                    <span>${productDetail.sale_pay }</span>
	                                </p>
<!-- 	                                <p> -->
<!-- 	                                    <span>· 교환여부</span> -->
<!-- 	                                    <span>교환불가능</span> -->
<!-- 	                                </p> -->
<!-- 	                                <p> -->
<!-- 	                                    <span>· 배송비</span> -->
<!-- 	                                    <span class="shipping">배송비 별도</span> -->
<!-- 	                                </p> -->
	                                <p>
	                                    <span>· 거래지역</span>
	                                    <span><img src="${pageContext.request.contextPath }/resources/images/goods/place.png" alt="주소">${productDetail.sale_location }</span>
	                                </p>
	                                 <p>
	                                    <span>· 상품태그</span>
	                                    <span><img src="${pageContext.request.contextPath }/resources/images/goods/tag.png" alt="상품태그"> ${productDetail.product_tag }</span>
	                                </p>
	                            </div>
	                            <div>
	                             
	                                <!-- 만약 판매자의 member_id와 현재로그인한 sId가 일치한다면(본인이 올린 글 이라면) 수정하기 버튼이 표시되도록. -->
	                                <c:choose>
		                                <c:when test="${productDetail.member_id eq sessionScope.sId }">
		                                	<!-- 버튼영역 -->
			                                <div class="container text-center detail_content_info_btn">
			                                    <div class="row g-2">
			                                        <div class="col-6">
			                                            <div class="p-3 info_btn3" onclick="location.href='productModifyForm?product_idx=${productDetail.product_idx}'" style="background-color: #ff8733;">수정하기</div>
			                                        </div>
			                                         <div class="col-6">
			                                            <div class="p-3 info_btn3" onclick="deleteProduct()")>삭제하기</div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <!-- //버튼영역 -->
		                                </c:when>
	                                	<c:otherwise>
                                			<!-- 버튼영역 -->
			                                <div class="container text-center detail_content_info_btn">
			                                    <div class="row g-2">
			                                        <div class="col-4">
			                                        	<c:if test="${result.dibs_check != null }">
			                                        		<a class="dibs">
			                                        			<c:if test="${result.dibs_check == 0}">
				                                            		<div class="p-3 info_btn1" style="background-color: #CCCCCC" id="dibsback" >
				                                                	<img id="dibsImage" src="${pageContext.request.contextPath }/resources/images/goods/w_heart.svg" alt="찜"> 찜 
				                                            		</div>
			                                        			</c:if>	
			                                        			<c:if test="${result.dibs_check == 1}">
			                                        				<div class="p-3 info_btn1" style="background-color: #333333;" id="dibsback">
				                                                	<img id="dibsImage" src="${pageContext.request.contextPath }/resources/images/goods/hearton.png" alt="찜"> 찜
				                                            		</div>
			                                        			</c:if>
			                                        		</a>
			                                        	</c:if>
			                                        </div>
			                                        <div class="col-4">
			                                    	    <a href="chatting?product_idx=${param.product_idx}" >
				                                            <div class="p-3 info_btn2"  style="background-color: #0085f5;">
				                                                <img src="${pageContext.request.contextPath }/resources/images/goods/talk.png" alt="채팅하기"> 채팅하기
				                                            </div>
			                                            </a>
			                                        </div>
			                                        <c:if test="${productDetail.sale_status eq '판매중' }"> <!-- '판매중'인 상품만 바로구매 버튼이 보여짐 -->
				                                        <div class="col-4">
				                                            <div class="p-3 info_btn3" onclick="payProduct()">바로구매</div>
				                                        </div>
			                                        </c:if>
			                                    </div>
			                                </div>
			                                <!-- //버튼영역 -->
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
            <!-- // detail_content -->

<hr>
            <!-- related_goods -->
            <!-- 카테고리가 같은 상품들을 5개까지 보여줌 -->
	            <div id="related_goods">
	                <div>
	                    <h3>연관상품</h3>
	                    <p>AD<span><img src="${pageContext.request.contextPath }/resources/images/goods/i.svg" alt="AD"></span></p>
	                </div>
	                <input type="hidden" name="product_Mcategory" value="${productDetail.product_Mcategory }">
	                <div class="container text-center" id="related_goods_imgs">
	                    <div class="row g-2">
			            <c:forEach var="productSameCategory" items="${productSameCategory }" begin="0" end="4"> 
	                        <div class="col-2 goods_list">
	                            <div class="related_goods_img">
	                                <a href="#">
<%-- 	                                	<c:forEach items="${fileList }" var="fileList"> --%>
					                        <c:set var="length" value="${fn:length(productSameCategory.file_name) }" />
											<c:set var="index" value="${fn:indexOf(productSameCategory.file_name, '_') }" />
											<c:set var="file_name" value="${fn:substring(productSameCategory.file_name, index + 1, length) }" />
<%-- 												<c:if test="${fileList.file_num eq productDetail.product_idx }"> --%>
<%-- 				                                    <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" onclick="location.href='product_detail?product_idx=${productSameCategory.product_idx}'" style="width: 170px; height: 180px;" alt="연관상품"> --%>
				                                    <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" onclick="location.href='product_detail?product_idx=${productSameCategory.product_idx}'" style="width: 170px; height: 180px;" alt="연관상품">
				                                    <p>${productSameCategory.product_subject }</p>
				                                    <p>${productSameCategory.product_price }원</p>
<%-- 		                                  		</c:if> --%>
<%-- 		                                 </c:forEach> --%>
	                                </a>
	                            </div>
	                        </div>
			            </c:forEach>
	                    </div>
	                </div>
	            </div>
            <!-- // related_goods -->

            <!-- url_images -->
            <div id="url_images">
                <p>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/naver.png" alt="Naver blog">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/facebook.png" alt="Facebook">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/twitter.png" alt="Twitter">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/url.png" alt="URL">
                    </span>
                </p>
            </div>
            <!-- // url_images -->

            <!-- goods_info -->
            <div id="goods_info">
                <div class="container text-center info_area">
                    <div class="row g-2">
                        <div class="col-8 info_area_left">
                            <div class="info_content">
                                <div>
                                    <p>
                                        상품설명
                                    </p>
                                </div>
                                <div style="font-size: large;">
                                    ${productDetail.product_content }
                                </div>
                            </div>
                            <div class="p-3 detailed_information" style="margin-top: 300px;">
                                <div class="container text-center ">
                                    <div class="row g-2">
                                        <div class="col-4">
                                            <div class="p-3 detailed_information_place">
                                                <img src="${pageContext.request.contextPath }/resources/images/goods/bottom_place.png" alt="거래지역"> <span>거래지역</span>
                                                <p>${productDetail.sale_location }</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="p-3 detailed_information_category">
                                                <img src="${pageContext.request.contextPath }/resources/images/goods/category.png" alt="카테고리"> <span>카테고리</span>
                                                <p>${productDetail.product_Lcategory } > ${productDetail.product_Mcategory } > ${productDetail.product_Scategory }</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="p-3 detailed_information_tag">
                                                <img src="${pageContext.request.contextPath }/resources/images/goods/tag.png" alt="상품태그"> <span>상품태그</span>
                                                <p>${productDetail.product_tag }</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-4">
                            <div class="store_info_area">
                                <div>
                                    <p>
                                        판매자정보
                                    </p>
                                </div>
                                <div>
                                    <div>
                                        <div>
                                            <img src="${pageContext.request.contextPath }/resources/images/goods/store.svg" alt="판매자아이디">
                                        </div>
                                        <div>
                                            <p style="font-weight: bold;">
                                                ${productDetail.member_id }
                                            </p>
                                                <p>
                                                    판매중인 상품 <span>${sellerInfoCount}개</span>
                                                </p>
                                        </div>
                                        <div id="store_follow">
                                            	<button onclick="location.href='chatting'" style="background-color: #0085f5; color: white;"> 채팅하기</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                    	<!-- 2개만 보여주도록 foreach할때 begin=0 end=1로 설정하기! -->
                                        <img src="${pageContext.request.contextPath }/resources/fileUpload/hana_cat2.jpg" style="width: 130px; height: 150px;" alt="판매중인상품">
                                        <img src="${pageContext.request.contextPath }/resources/fileUpload/hana_cat3.jpg" style="width: 130px; height: 150px;" alt="판매중인상품">
                                    </div>
                                    <div>
                                        <p style="margin-top: 41px;">판매중인 <span>${sellerInfoCount}개</span> 상품</p>
                                    </div>
                                </div>
                                <div>
                                    <p>판매자후기 <span>0</span></p>
                                    <div>
                                        <p>
                                            등록된 후기가 없습니다.<br>
                                            첫 후기를 등록해보세요!
                                        </p>
                                        <button>
                                            후기작성
                                        </button>
                                    </div>
                                </div>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // goods_info -->
        </c:forEach>     
        <!-- // main_content 영역 -->
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>