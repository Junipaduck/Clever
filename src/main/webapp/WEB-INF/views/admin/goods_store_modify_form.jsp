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
    <title>상품 등록 수정</title>
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
                <form action="storeModifyPro.ad" method="post" class="frm_selling_goods" enctype="multipart/form-data">
                	<input type="hidden" name="goods_idx" value="${param.goods_idx }"> 
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
				                               	        alert("파일 삭제!");
				                               	    },
				                               	    error: function() {
				                               	        // 요청이 실패했을 때 실행할 동작
				                               	        alert("파일 삭제 실패!");
				                               	    }
				                               	});
			                               	 
			                               	 
		                               	  }// onclick function 끝!
							</script>
							    <c:forEach items="${filesList }" var="filesItem" varStatus="loop">
                               		<c:set var="length" value="${fn:length(filesItem.file_name) }" />
								    <c:set var="index" value="${fn:indexOf(filesItem.file_name, '_') }" />
								    <c:set var="file_name" value="${fn:substring(filesItem.file_name, index + 1, length) }" />
								    <c:if test="${filesItem.file_num eq goods.goods_idx}">
								        <li draggable="false" class="sc-gkFcWv iiYIYa">
								            <img src="${pageContext.request.contextPath }/resources/upload/${file_name}" class="preview">
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
                        <p>상품명<span class="red">*</span></p>
                        <div class="goods_title">
                            <input type="text" name="goods_name" id="goods_name" maxlength="40"
                                value="${goods.goods_name }" oninput="countTitleLength(event);" style="width: 700px;">
                            <span class="goods_title_length"><span></span>/40</span>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>가격<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="goods_price" value="${goods.goods_price }" oninput="valueIsNumber(event)" style="width: 700px;"> 원</p>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>설명<span class="red">*</span></p>
                        <div>
                            <textarea name="goods_content" id="goods_content" cols="30" rows="10" maxlength="2000" oninput="countInfoLength(event)" placeholder ="${goods.goods_content }"></textarea>
                        </div>
                    </div>
                    <div class="goods_price_area">
                        <p>재고<span class="red">*</span></p>
                        <div class="goods_price">
                            <p><input type="text" name="goods_stock" value="${goods.goods_stock }" oninput="valueIsNumber(event)" style="width: 700px;"> 개</p>
                        </div>
                    </div>
			        <div class="btn_submit_area">
				        <div class="inner_submit" style="margin-left: 650px;">
				            <input type="submit" class="p-3 info_btn3" value="수정하기">
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







































