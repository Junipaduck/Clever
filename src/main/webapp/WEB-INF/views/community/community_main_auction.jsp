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
<title>클레버 - 경매커뮤니티</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_my_store.css">

<!-- customer_center 외부 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/board_list.jo112.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/common.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/footer.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/header.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/unit_csboard_top2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/faq.css">

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
font-size: 15px;
}
/* Gradient - ugly css is ugly */
.btn-gradient {
  margin: 5px;
}
.btn-gradient.mini
 {
  padding: 4px 12px;  
  font-size: 12px;
}

.btn-gradient.cyan {
  background: rgba(27,188,194,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27,188,194,1)), to(rgba(24,163,168,1)));
  background: -webkit-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -moz-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -o-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../auction/auction_header.jsp" />
	</header>

	<!-- main_content 영역 -->

	<div id="contentWrapper">
		<div id="contentWrap">


			<div
				style="display: flex; justify-content: space-between; margin: 183px 0 0 0; align-items: center">
				<div class="log-tit animated con-tit">
					<p>경매 커뮤니티</p>
				</div>
			</div>



					<div class="bbs-table-list">
						<input type="button" onclick="location.href='community_form_auction?community_div=auction'" value="등록하기" style="margin-left: 1400px;" class="btn-gradient cyan mini">
						<!-- 자주묻는 질문 시작 -->
						<div id="faqWrap">
							<div class="page-body" style="width: 1040px; margin-left: auto; margin-right: auto;">
								<div id="faqTable">
									<table summary="분류 제목">
										<caption>질문/답변</caption>
										<colgroup>
											<col width="100" />
											<col width="200" />
											<col width="*" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">
													<div class="tb-center">글번호</div>
												</th>
												<th scope="col">
													<div class="tb-center">조회수</div>
												</th>
												<th scope="col">
													<div class="tb-center">제목</div>
												</th>
												<th scope="col">
													<div class="tb-center">등록일</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${communityList }" var="community">
												<tr id="6">
													<td>
														<div class="tb-center">${community.community_idx }</div>
													</td>
													<td>
														<div class="tb-center">${community.community_readcount }</div>
													</td>
													<td>
														<div class="tb-center"><a href="community_detail?community_idx=${community.community_idx }&community_div=${community.community_div }">${community.community_title }</a></div>
													</td>
													<td>
														<div class="tb-center">${community.community_date }</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- .page-body -->
<!-- 							<div> -->
<!-- 								<ol class="paging"> -->
<!-- 									<li><strong>1</strong></li> -->
<!-- 									<li><a href="/shop/faq.html?page=2">2</a></li> -->
<!-- 									<li><a href="/shop/faq.html?page=3">3</a></li> -->
<!-- 									<li><a href="/shop/faq.html?page=4">4</a></li> -->
<!-- 									<li class="last"><a href="/shop/faq.html?page=4"><img -->
<!-- 											src="/images/d3/modern_simple/btn/btn_bmatch_paging_last.gif" -->
<!-- 											alt="끝" title="" /></a></li> -->
<!-- 								</ol> -->
<!-- 							</div> -->
						</div>
						<!-- #faqWrap -->

					</div>
					<!-- #contentWrap -->
				</div>
				<!-- #contentWrapper-->
				<hr />
				</div>



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


































