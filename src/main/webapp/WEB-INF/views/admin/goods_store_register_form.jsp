<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>상품 등록</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

	<!--아이콘-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!-- Summernote -->
    <link href="${pageContext.request.contextPath }/resources/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <!--부트스트랩-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
	<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 공통 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">
	
	<!--CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css?after">
	<!-- store.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/store.css">
	
<style type="text/css">

</style>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

		<!-- 네비게이션 헤더 시작 -->
		<header>
			<jsp:include page="../inc/admin_nav_header.jsp"></jsp:include>
		</header>
		<!-- 네비게이션 헤더 끝 -->

		<!-- 상단 헤더 시작 -->
        <header>
			<jsp:include page="../inc/admin_header.jsp"></jsp:include>
        </header>
		<!-- 상단 헤더 끝 -->


		<!-- 사이드바 시작 -->
		<header>
			<jsp:include page="../inc/admin_sidebar.jsp"></jsp:include>
		</header>
		<!-- 사이드바 끝 -->

        <!--**********************************
            Content body start
        ***********************************-->
         <div id="main_content">
            
            
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보 <span class="red">* 필수항목</span></h2>
                <form action="goodsRegisterPro.ad" method="POST" class="frm_selling_goods" enctype="multipart/form-data">
<%--                 	<input type="hidden" name="member_id" value="${sessionScope.sId }">  --%>
                    <div class="goods_images_area">
                        <p>상품이미지<span class="red">*</span>
                        </p>
                        <div>
                            <div class="goods_images">
                                <div>
                                    이미지 등록
                                    <c:choose>
                                    	<c:when test="${empty goods.goods_file }">
		                                    <input type="file" name="file" accept="image/jpg, image/jpeg, image/png" onchange="setImages(event);">
                                    	</c:when>
                                    </c:choose>
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
                        <p>상품명<span class="red">*</span></p>
                        <div class="goods_title">
                            <input type="text" name="goods_name" id="goods_name" maxlength="40"
                                placeholder="상품 이름을 입력해주세요." oninput="countTitleLength(event);" style="width: 700px;">
                            <span class="goods_title_length"><span></span>/40</span>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>가격<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="goods_price" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)" style="width: 700px;"> 원</p>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>설명<span class="red">*</span></p>
                        <div>
                            <textarea name="goods_content" id="goods_content" cols="30" rows="10"
                            maxlength="2000" oninput="countInfoLength(event)"></textarea>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>재고<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="goods_stock" placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)" style="width: 700px;"> 개</p>
                        </div>
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
		
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- footer 시작 -->
		<footer>
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
		</footer>
		<!-- footer 끝 -->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="${pageContext.request.contextPath }/resources/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/custom.min.js"></script>
    

    <!-- Summernote -->
    <script src="${pageContext.request.contextPath }/resources/vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="${pageContext.request.contextPath }/resources/js/plugins-init/summernote-init.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js?after"></script>

</body>

</html>







































