<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>클레버 - 고객센터</title>
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



</head>
<body>
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
					<li><a href="/board/board.html?code=jo112_board1"
						data-link="jo112_board1">공지사항</a></li>
					<li><a href="/shop/faq.html">자주묻는질문</a></li>
					<li><a href="/board/board.html?code=jo112" data-link="jo112">고객문의</a></li>
					<li><a href="/shop/page.html?id=30" data-link="jo112">쇼핑가이드</a></li>
					<li><a
						href="/board/board.html?code=jo112_board24&type=v&num1=999999&num2=00000&lock="
						data-link="jo112_image1" target="_blank">멤버십</a>
					<li><a href="/board/board.html?code=jo112_board37"
						target="_blank">보도자료</a></li>
				</ul>
			</div>

			<div class="cstopwrap " style="width: 1340px; margin: 0 auto 50px;">

				<div class="qnaBoardWrap">
					<ul class="listWrap">
						<li class="list"><a href="/board/board.html?code=jo112"
							data-link="jo112"> <span class="qna_tit">상품 문의</span>
						</a></li>
						<li class="list"><a
							href="/board/board.html?code=jo112_board15"
							data-link="jo112_board15"> <span class="qna_tit">배송 문의</span>
						</a></li>
						<li class="list"><a
							href="/board/board.html?code=jo112_board16"
							data-link="jo112_board16"> <span class="qna_tit">취소 문의</span>
						</a></li>
						<li class="list"><a
							href="/board/board.html?code=jo112_board17"
							data-link="jo112_board17"> <span class="qna_tit">교환/반품
									문의</span>
						</a></li>
						<li class="list"><a
							href="/board/board.html?code=jo112_board18"
							data-link="jo112_board18"> <span class="qna_tit">입금/기타
									문의</span>
						</a></li>
						<li class="list"><a
							href="/board/board.html?code=jo112_board28"
							data-link="jo112_board28"> <span class="qna_tit">VIP
									전용</span>
						</a></li>
					</ul>
				</div>
				<div class="qa_contents">
					<div class="qa_txt">
						<div class="csContent">
							<p class="csTitle">상담시간</p>
							<p class="time">평일 10:00 - 17:00</p>
							점심시간 12:00 - 13:00, 주말/공휴일 휴무
							<p
								style="margin-top: 13px; display: block; font-size: 0.9em; color: #999;">*상담시간
								이외에는 답변이 늦어질 수 있습니다.</p>
						</div>
						<div class="csContent">
							<p class="csTitle">안내 및 유의사항</p>
							<ul class="csCaution">
								<li>한번 등록한 상담내용은 수정이 불가능합니다.</li>
								<li>문의 전 쇼핑몰 하단의 [<a href="/shop/page.html?id=30"><span
										class="cautionTxt">쇼핑가이드</span></a>] 확인 부탁드립니다.
								</li>
								<li>뮬라웨어는 <span class="cautionTxt">주문확인, 출고가 실시간</span>으로
									이루어지고 있습니다.
								</li>
								<li>결제완료 이후 취소는 마이페이지 내 <span class="cautionTxt">[상품준비]
										상태인 경우에 직접취소 </span> 가능하며, <span class="cautionTxt">[배송준비] 상태인
										경우에는 취소 및 변경이 불가</span>합니다.
								</li>
								<li>비회원일 경우 주문상태와 상관없이 직접취소가 불가능하오니 고객센터로 문의주시면 확인 후 안내
									도와드리겠습니다.</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
			<script type="text/javascript"
				src="/shopimages/jo112/template/unit/48/unit_csboard_top2.js"></script>
			<div id="content">
				<div id="bbsData">



					<div class="bbs-table-list">
						<dl class="bbs-link bbs-link-btm animated">
							<dd>
								<a href="/board/board.html?code=jo112&page=1&board_cate=&type=i"
									class="CMbutton1" style="color: white;">글쓰기</a>
							</dd>
						</dl>
						<!-- 자주묻는 질문 시작 -->
						<script type="text/javascript"
							src="/shopimages/jo112/template/unit/48/unit_csboard_top2.js"></script>

						<div id="faqWrap">
							<div class="page-body">
								<div class="faqtopwrap">
									<div id="faq-category">
										<ul class="faq-menu">
											<li><a href="javascript:faqSearch('category','ALL');">전체보기</a></li>
											<li><a href="javascript:faqSearch('category','3');">주문</a></li>
											<li><a href="javascript:faqSearch('category','4');">배송</a></li>
											<li><a href="javascript:faqSearch('category','5');">상품</a></li>
											<li><a href="javascript:faqSearch('category','1');">반품/교환</a></li>
											<li><a href="javascript:faqSearch('category','2');">회원정보</a></li>
											<li><a href="javascript:faqSearch('category','6');">적립금/쿠폰</a></li>
										</ul>
										<!-- .faq-menu-->
									</div>
									<!-- .faq-category-->
									<div class="faq-search">
										<div class="search-wrap">

											<fieldset>
												<legend>FAQ 검색 폼</legend>
												<select class="MS_input_select select-category"
													id="search-category">
													<option value="">전체검색</option>
													<option value="3">주문</option>
													<option value="4">배송</option>
													<option value="5">상품</option>
													<option value="1">반품/교환</option>
													<option value="2">회원정보</option>
													<option value="6">적립금/쿠폰</option>
												</select> <span class="keyword"> <input id='faqSearch'
													class="MS_input_txt"
													onKeyPress='javascript:faqEnter(event);' type='text'
													value='' />
												</span> <a class="searchbt" href="javascript:faqSearch('keyword')"><img
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
											<col width="200" />
											<col width="*" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">
													<div class="tb-center">번호</div>
												</th>
												<th scope="col">
													<div class="tb-center">분류</div>
												</th>
												<th scope="col">
													<div class="tb-left" style="font-weight: 400;">제목</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr uid="6">
												<td>
													<div class="tb-center">1</div>
												</td>
												<td>
													<div class="tb-center">주문</div>
												</td>
												<td>
													<div class="tb-left">물건이 도착하지 않으면 어떻게 해야 하나요</div>
												</td>
											</tr>
											<tr class="slide-hide">
												<td colspan="3">
													<div class="tb-slide">
														<dl class="qst">
															<dt>Q</dt>
															<dd>제가 구매하고 나서 이벤트가 진행되었어요! 행사가격으로 변경 해주세요!</dd>
														</dl>
														<dl class="adv">
															<dt>A</dt>
															<dd>
																이벤트의 경우 서프라이즈성 이벤트로 사전 공지 없이 진행이 되는 부분 깊은 양해 부탁드리며. <br>할인
																적용된 상품으로 구매 원하실 경우, 기존 상품 반품 후 재구매해주셔야 하는 점 참고
																부탁드립니다.&nbsp;&nbsp;: )<br> ( 반품 왕복 배송비 발생합니다. ) <br>*임의
																상품 가격 조정 처리는 어려운 점 깊은 양해 부탁드립니다.
															</dd>
														</dl>
													</div>
												</td>
											</tr>
											<tr uid="24">
												<td>
													<div class="tb-center">2</div>
												</td>
												<td>
													<div class="tb-center">반품</div>
												</td>
												<td>
													<div class="tb-left">중고 거래도 반품 가능한가요?</div>
												</td>
											</tr>
											<tr class="slide-hide">
												<td colspan="3">
													<div class="tb-slide">
														<dl class="qst">
															<dt>Q</dt>
															<dd>
																<p>
																	<span data-sheets-value="{" 1":2,"2":"교환="" 배송비는=""
																		얼마인가요?"}"="" data-sheets-userformat="{"
																		2":513,"3":{"1":0},"12":0}"=""
																		style="font-size: 10pt; font-family: Arial;">교환
																		배송비는 얼마인가요?</span>&nbsp;
																</p>
															</dd>
														</dl>
														<dl class="adv">
															<dt>A</dt>
															<dd>
																<p>
																	<span data-sheets-value="{" 1":2,"2":"교환="" 배송비는=""
																		회수비용과="" 재출고비용이="" 발생하여="" 5,000원이="" 발생합니다.=""
																		"}"="" data-sheets-userformat="{"
																		2":513,"3":{"1":0},"12":0}"=""
																		style="font-size: 10pt; font-family: Arial;">교환
																		배송비는 회수비용과 재출고비용이 발생하여 6,000원이 발생합니다. : )</span>&nbsp;
																</p>
																<p>&nbsp;</p>
																<p>입금주명 : 주식회사뮬라</p>
																<p>계좌 : 신한 100-029-277534</p>
																<p>&nbsp;</p>
																<p>가상 계좌가 아니기 때문에 주문자, 수령자 성함과 일치해야 확인이 가능하며</p>
																<p>정확한 확인을 위하여 입금자명 뒤에 연락처 뒷자리 기재 부탁드립니다.</p>
																<p>ex)&nbsp; 김뮬라4540</p>
															</dd>
														</dl>
													</div>
												</td>
											</tr>
	
										</tbody>
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


































