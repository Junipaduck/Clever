<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 경매상품등록</title>
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

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
</style>

</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>

<!--메인 컨텐츠 -->
        <div id="main_content">
            <!--판매 폼-->
            <input type="hidden" name="notice_idx" value="${param.notice_idx }">
            <section class="goods_form">
                <h2>기본정보</h2>
                <form action="community_formPro" class="frm_selling_goods" id="formform" enctype="multipart/form-data" method="post">
                    <div class="goods_title_area">
                        등록일 | ${noticeDetail[0].notice_date }
                        <br>
                        조회수 | ${noticeDetail[0].notice_readcount }
                    </div>
                    <c:forEach items="${noticeDetail }" var="noticeDetail">
                    <div class="goods_title_area">
                        <p>제목</p>
                        <div class="goods_title">
                            <input type="text" value="${noticeDetail.notice_title }" maxlength="50" readonly="readonly">
                        </div>
                    </div>
                    
                    <div class="goods_info_area">
                        <p>설명</p>
                        <div>
                            <textarea cols="30" rows="10" readonly="readonly">${noticeDetail.notice_content }</textarea>
                        </div>
                    </div>
                    </c:forEach>
                </form>
                <br>
                <c:if test="${sessionScope.sId eq 'admin' }">
	            	<button type="submit" class="btn btn-primary" onclick="location.href='noticeModifyForm.ad?notice_idx=${noticeDetail[0].notice_idx}'">수정하기</button>
                </c:if>
            </section>
    </div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- 푸터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>


































