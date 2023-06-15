<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 커뮤니티 수정</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

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
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js?after"></script>
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
		<jsp:include page="../auction/auction_header.jsp" />
	</header>    
<!--메인 컨텐츠 -->
        <div id="main_content">
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보 <span class="red">* 필수항목</span></h2>
                <form action="community_modifyPro" class="frm_selling_goods" id="formform" enctype="multipart/form-data" method="post">
                <input type="hidden" value="${communityList[0].community_idx }" name="community_idx">
                    <div class="goods_title_area">
                        <p>제목<span class="red">*</span></p>
                        <div class="goods_title">
                            <input type="text" value="${communityList[0].community_title }" name="community_title" id="community_title" maxlength="50"
                                placeholder="제목을 입력해주세요." oninput="countTitleLength(event);">
                            <span class="goods_title_length"><span></span>/50</span>
                        </div>
                    </div>
                    <div class="goods_info_area">
                        <p>내용<span class="red">*</span></p>
                        <div>
                            <textarea name="community_content" id="community_content" cols="30" rows="10"
                            maxlength="2000" oninput="countInfoLength(event)">${communityList[0].community_content }</textarea>
                        </div>
                    </div>
		        <div class="btn_submit_area">
			        <div class="inner_submit">
			            <!--폼으로 등록 테스트 하실 때 type=submit으로 바꿔서 진행해주세요-->
			            <input type="submit" class="btn_goods_submit" value="수정하기">
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