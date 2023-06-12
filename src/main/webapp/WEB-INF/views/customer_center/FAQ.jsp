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

</head>
<body>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">

/* 검색창에 엔터키 치는 기능 */
// function faqEnter(event) {
//     if (event.keyCode === 13) {
//       faqSearch('keyword');
//     }
//   }


$(document).ready(function() {
  $('.accordion-button').click(function() {
    // 현재 클릭한 아코디언 요소
    var currentAccordion = $(this);
    
    // 해당 아코디언 요소의 상태 변경
    currentAccordion.toggleClass('collapsed');
    
    // 현재 아코디언 상태에 따라 열리거나 닫힘 처리
    var collapseTarget = currentAccordion.attr('data-bs-target');
    if (currentAccordion.hasClass('collapsed')) {
      $(collapseTarget).collapse('hide');
    } else {
      $(collapseTarget).collapse('show');
    }
  });
});
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
									<li><a href="FAQ?param=ALL">전체보기</a></li>
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
							<!-- .faq-category-->
							<div class="faq-search">
								<div class="search-wrap">

									<fieldset>
										<legend>FAQ 검색 폼</legend>
										<form action="FAQ?param=ALL"></form>
										<select class="MS_input_select select-category"
											id="search-category" name="searchType">
											<option value="FAQ_subject" <c:if test="${param.searchKeyword eq 'store_name'}">selected</c:if>>제목</option>
											<option value="FAQ_content"<c:if test="${param.searchKeyword eq 'store_name'}">selected</c:if>>내용</option>
<!-- 											<option value="ALL">전체검색</option> -->
<!-- 											<option value="1">회원/계정</option> -->
<!-- 											<option value="2">거래분쟁/운영정책</option> -->
<!-- 											<option value="3">스토어</option> -->
<!-- 											<option value="4">포인트</option> -->
<!-- 											<option value="5">중고거래</option> -->
<!-- 											<option value="6">경매</option> -->
										</select> <span class="keyword"> <input id='faqSearch'
											class="MS_input_txt"
											onKeyPress="faqEnter(event);" aria-label="Search" name="searchKeyword" value="${param.searchKeyword }"/>
										</span> <a class="searchbt" href="javascript:faqSearch('keyword')" onKeyPress="faqEnter(event);"><img
											src="https://cdn3-aka.makeshop.co.kr/design/jo112/phps/common/btn_search.gif"
											alt="검색" title="검색"></a>
									</fieldset>
									<dl class="best-keyword" style="display: none;">
										<dt>
											<strong>자주 찾는 검색어</strong> :
										</dt>
										<dd>
											<ul class="list">
											</ul>
										</dd>
									</dl>
								</div>
								<!-- .search-wrap -->
								</form>
							</div>
							<!-- .faq-search-->
						</div>

						<div id="faqTable">
							<table summary="분류 제목">
								<caption>질문/답변</caption>
								<colgroup>
									<col width="100" />
									<col width="*" />
									<col width="1" />
								</colgroup>
								
								<!-- 아코디언 오류나면 여기서부터 주석풀고 FAQ_detail.jsp랑 같이 사용하면 됨 -->
<!-- 								<thead> -->
<!-- 									<tr> -->
<!-- 										<th scope="col"> -->
<!-- 											<div class="tb-center">분류</div> -->
<!-- 										</th> -->
<!-- 										<th scope="col"> -->
<!-- 											<div class="tb-center" style="font-weight: 400;">클레버 FAQ</div> -->
<!-- 										</th> -->
<!-- 										<th scope="col"> -->
<!-- 											<div class="tb-left"></div> -->
<!-- 										</th> -->
<!-- 									</tr> -->
<!-- 								</thead> -->
							
<!-- 								<tbody> -->
<!-- 									<tr uid="6"> -->
<!-- 										<td> -->
<%-- 											<div class="tb-center">${FAQcategory.FAQ_category }</div> --%>
<!-- 										</td> -->
<!-- 										<td> -->
<%-- 											<div class="tb-center"><a href="FAQdetail?FAQ_idx=${FAQcategory.FAQ_idx}">${FAQcategory.FAQ_subject }</a></div> --%>
<!-- 										</td> -->
<!-- 										<td> -->
<!-- 											<div class="tb-left"></div> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 								</tbody> -->

									<!-- 부트스트랩 아코디언 시작 -->
									<div class="accordion" id="accordionExample" style="width: 1350px; margin: auto; margin-top:10px;">
										<c:forEach items="${FAQcategory }" var="FAQcategory" varStatus="loop">
										  <div class="accordion-item">
										  	<div class="card-header border-bottom">
											    <h2 class="accordion-header">
											      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_${FAQcategory.FAQ_idx}" aria-expanded="true" aria-controls="collapse_${FAQcategory.FAQ_idx}">
											        Q. ${FAQcategory.FAQ_subject }
											      </button>
											    </h2>
											 </div>
										    <div id="collapse_${FAQcategory.FAQ_idx}" class="collapse" aria-labelledby="heading_${FAQcategory.FAQ_idx}" data-bs-parent="#accordionExample">
										      <div class="accordion-body">
										      	${FAQcategory.FAQ_content }
										      </div>
										    </div>
										  </div>
										</c:forEach>
									</div>
									<!-- //부트스트랩 아코디언 끝 -->
									
									
									 
							</table>
						</div>
					</div>
					<!-- .page-body -->
					<div>
						<ol class="paging">
							<li><strong>1</strong></li>
							<li><a href="/shop/faq.html?page=2">2</a></li>
							<li><a href="/shop/faq.html?page=3">3</a></li>
							<li><a href="/shop/faq.html?page=4">4</a></li>
							<li class="last"><a href="/shop/faq.html?page=4"><img
									src="/images/d3/modern_simple/btn/btn_bmatch_paging_last.gif"
									alt="끝" title="" /></a></li>
						</ol>
					</div>
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
