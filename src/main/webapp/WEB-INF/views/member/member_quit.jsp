<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 커뮤니티 상세페이지</title>
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
	/* -- 댓글 달기 --  */
	#replyArea {
		width: 770px;
		height: 150px;
		margin-left: 165px;
		margin-top: 20px;
	}
	#replyArea textarea {
		width: 567px;
		height: 50px;
 		vertical-align: middle;
		resize: none;
	}
	
	#replyArea input {
		width: 83px;
		height: 49px;
		margin-left: 15px;
		
	}
	
	#replyContentArea {
		width: 500px;
		height: 100px;
		font-size: 12px;
/* 		white-space: nowrap; */
 		overflow: auto; 
/* 		text-overflow: ellipsis; */
	}
	
	#replyContentArea table, tr, td {
		border: none;
	}
	
	.replyContent {
		width: 350px;
		text-align: left;
	}
	.replyWriter {
		width: 60px;
	}
	.replyDate {
		width: 90px;
	}
	
	.replyContent img {
	width:10px; height:10px;
	}
	
	/* 대댓글 */
	#reReplyTextarea {
		width: 350px;
		height: 40px;
		vertical-align: middle;
		resize: none;
	}
	
	#reReplySubmit {
		width: 80px;
		height: 45px;
		vertical-align: middle;
		
	}

	.but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
     .but4:hover {
    background-color: #2445f0;
    color: white;
    border: 2px solid #2445f0;
    }

</style>
<script type="text/javascript">
</script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../auction/auction_header.jsp" />
	</header>    
<!--메인 컨텐츠 -->

        <div id="main_content">
            <!--판매 폼-->
            <section class="goods_form" style="text-align: center;">
                <h2>회원탈퇴</h2>
            </section>
            <section id="replyArea">
		<form action="DeleteMemberPro" method="post">
				<textarea id="member_passwd" name="member_passwd" placeholder="탈퇴하려면 비밀번호를 입력 해주세요" ></textarea><input class="but4" type="submit" value="탈퇴">
		
		</form>
	</section>
    </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	</body>
</html>