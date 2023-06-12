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
<title>클레버 - 공지사항</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/footer.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/header.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/unit_csboard_top2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/faq.css">



</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>


			<div style="display: flex; justify-content: space-between; margin: 100px 0 0 0; align-items: center">
				<div class="log-tit animated con-tit">
					<p>공지사항</p>
				</div>
			</div>
			<div class="bbs-cate">
				<ul>
					<li><a href="noticeMain.ad">공지사항</a></li>
					<li><a href="FAQ">자주묻는질문</a></li>
					<li><a href="centerAsked" data-link="jo112">1:1문의</a></li>
				</ul>
			</div>
			
	<!-- main_content 영역 -->

	<div id="contentWrapper">
		<div id="contentWrap">


<!-- 			<div -->
<!-- 				style="display: flex; justify-content: space-between; margin: 183px 0 0 0; align-items: center"> -->
<!-- 				<div class="log-tit animated con-tit"> -->
<!-- 					<p>공지사항</p> -->
<!-- 				</div> -->
<!-- 			</div> -->



					<div class="bbs-table-list">

						<!-- 자주묻는 질문 시작 -->
						<div id="faqWrap" style="margin-top: -50px;">
							<div class="page-body">
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
													<div class="tb-left" style="font-weight: 400;">등록일</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${noticeList }" var="noticeList">
												<tr uid="6">
													<td>
														<div class="tb-center">${noticeList.notice_idx }</div>
													</td>
													<td>
														<div class="tb-center">${noticeList.notice_readcount }</div>
													</td>
													<td>
														<div class="tb-left"><a href="noticeDetail.ad?notice_idx=${noticeList.notice_idx }">${noticeList.notice_title }</a></div>
													</td>
													<td>
														<div class="tb-left">${noticeList.notice_date }</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<input type="button" value="등록하기" style="margin-left: 1300px;">
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


































