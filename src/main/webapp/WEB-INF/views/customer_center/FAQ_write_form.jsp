<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>클레버 - 자주묻는질문</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!--css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/market/index.css">
<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/market/market_my_store.css">

<!-- customer_center 외부 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/board_list.jo112.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/footer.1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/header.1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/unit_csboard_top2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/customer_center/faq.css">

<!-- 부트스트랩 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

 <style type="text/css">
 
#file444 {
 	height: 38px;
 }
 
.hanadiv{
	margin-top: 40px;
}

/* 버튼 기본 css */

.btn44{
	background: #ff9507;
  	border-color: #ff9507;
  	border-color: #ff9507;
	background: #ff9507;
	padding-top: 12px; 
	padding-bottom: 12px;
	padding-left: 30px;
	padding-right: 30px;
	border-radius: 30px;
	border: 2px solid #ffffff;
	color: #fff;
	font-size: 14px;
	
	margin-left: 495px;
    margin-top: 10px;
	
}
 </style>

</head>
<body>
<script type="text/javascript">
</script>
<!-- 부트스트랩 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>

	<!-- main_content 영역 -->

	<script type="text/javascript"
		src="/shopimages/jo112/template/work/2934/header.1.js?t=202305221010"></script>
	<div id="contentWrapper">
		<div id="contentWrap">


			<link type="text/css" rel="stylesheet"
				href="/shopimages/jo112/template/unit/48/unit_csboard_top2.css" />
			<div
				style="display: flex; justify-content: space-between; margin: 183px 0 0 0; align-items: center">
				<div class="log-tit animated con-tit">
					<p>고객센터</p>
				</div>
			</div>
			<div class="bbs-cate">
				<ul>
					<li><a href="noticeMain.ad">공지사항</a></li>
					<li><a href="FAQ?param=회원/계정">자주묻는질문</a></li>
					<li><a href="1:1문의매핑주소" data-link="jo112">고객문의</a></li>
				</ul>
			</div>

				<!-- 자주묻는 질문 시작 -->
				<script type="text/javascript"
					src="/shopimages/jo112/template/unit/48/unit_csboard_top2.js"></script>

				<div id="faqWrap">
					<div class="page-body">
						<div class="faqtopwrap">
							<div id="faq-category">
								<ul class="faq-menu">
<!-- 									<li><a href="FAQ?param=전체보기">전체보기</a></li> -->
									<li><a href="FAQ?param=회원/계정">회원/계정</a></li>
									<li><a href="FAQ?param=거래분쟁/운영정책">거래분쟁/운영정책</a></li>
									<li><a href="FAQ?param=스토어">스토어</a></li>
									<li><a href="FAQ?param=포인트">포인트</a></li>
									<li><a href="FAQ?param=중고거래">중고거래</a></li>
									<li><a href="FAQ?param=경매">경매</a></li>
									<c:if test="${sessionScope.sId eq 'admin'}">
										<li><a href="FAQwriteForm">[관리자용 글쓰기✏️]</a></li>
									</c:if>
								</ul>
								<!-- .faq-menu-->
							</div>
						</div>
					</div>

						<div id="faqTable">
							<div class="hanadiv">
							 <div class="row justify-content-center">
						 		<div class="col-lg-4">
						      	  	<div class="custom-block" data-aos="fade-up" data-aos-delay="100">
						            	<h3 class="section-title">관리자용 FAQ 글쓰기✏️</h3>
						            <form action="FAQwritePro" name="FAQwritePro" method="POST">
						              <div class="form-group">
						              	 <label class="text-black" for="title">제목</label>
						               	<input class="form-control" type="text" name="FAQ_subject" placeholder="제목을 입력하세요." aria-label="default input example">
						              </div>
						              <div class="form-group">
						              	 <label class="text-black" for="title">분류</label>
							              	 <select name="FAQ_category">
											    <option value="회원/계정">회원/계정</option>
											    <option value="거래분쟁/운영정책">거래분쟁/운영정책</option>
											    <option value="스토어">스토어</option>
											    <option value="포인트">포인트</option>
											    <option value="중고거래">중고거래</option>
											    <option value="경매">경매</option>
											 </select>
						              </div>
						              <div class="form-group">
						                <label class="text-black" for="FAQ_content">내용</label>
						              	<textarea class="form-control" placeholder="내용을 입력하세요." id="FAQ_content" name="FAQ_content" style="height: 500px"></textarea>
						              </div>
						              	<button type="submit" class="btn btn-primary" style="background-color: #0761ff;">등록하기</button>
						            </form>
						          </div>
						     	</div>
						 	</div>
						 </div>
						</div>
					</div>
					<!-- .page-body -->
				</div>
				<!-- #faqWrap -->

			</div>
			<!-- #contentWrap -->
		</div>
		<!-- #contentWrapper-->
		<hr />



<!-- main_content 영역 끝 -->

<!-- 푸터 시작 -->
<jsp:include page="../inc/footer.jsp" />


<!-- js -->
<script
	src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/market/market_intro_modify.js"></script>

<!-- customer_center 외부 js -->
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/all.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/analytics.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/bigin.sdk.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/board_list.jo112.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/bookmark.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/click.euc-kr.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/common.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/detailpage.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/fbevents.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/flash.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/footer.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/genesis.common.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/gtm.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/jquery.bxslider.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/kp.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/lazyload.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/ld.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/mslog.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/owl.carousel.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/prototype.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/referer_cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/remind.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/rightbanner.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/script.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/slick.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/swiper.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/unit_csboard_top2.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/util-min-2.0.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/wcslog.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/customer_center/wp_astg_2.0_shop.js"></script>
</body>
</html>


































