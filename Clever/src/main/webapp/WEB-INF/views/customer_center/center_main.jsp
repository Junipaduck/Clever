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



</head>
<body>
	<!-- 헤더 시작 -->
	<jsp:include page="../inc/mypage_header.jsp" />

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
									class="CMbutton1">글쓰기</a>
							</dd>
						</dl>
						<a
							onclick="javascript:void(window.open('https://lc-api.lunasoft.co.kr/lunachat/api-connect/@뮬라웨어/main/no_gid','win0','width=775,height=662,status=no,toolbar=no,scrollbars=yes'))">
							<div class="kakaocsbt">
								<img src="//mulawear.jpg3.kr//phps/kakaoicon/mulacskakao.png">
								<p>카톡상담</p>
							</div>
						</a>





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


































