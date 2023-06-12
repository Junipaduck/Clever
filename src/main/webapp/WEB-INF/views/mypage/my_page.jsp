<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>클레버 - 마이페이지</title>
<link rel="shortcut icon"href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<!-- 부트스트랩 icon -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_comon.css">

<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_my_store.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_history.css">

<!-- js -->
<script	src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/market/market_intro_modify.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/goods/goods_history_common.js"></script>
<script	src="${pageContext.request.contextPath }/resources/js/goods/goods_buy_history.js"></script>

</head>

<style>
div.left {
	width: 50%; // 원하는 사이즈 만큼 조절 float : left;
	position: relative;
}

div.right {
	width: 50%; // 원하는 사이즈 만큼 조절 float : right;
	position: relative;
}

.goods_info {
	padding: 0px 0px;
}

.goods_info h2.goods_title {
	padding-bottom: 0px;
}
</style>


<body>
	<!-- 헤더 시작 -->
	<jsp:include page="../inc/mypage_header.jsp" />

	<!-- main_content 영역 -->
	<div id="main_content">
		<!-- 프로필 영역 -->
		<div id="my_store_area">
			<div class="my_store_left">
				<div>
					<img
						src="${pageContext.request.contextPath }/resources/images/market/store.svg"
						alt="내 상점">
				</div>
				<div>
					<p>${member.member_name}님</p>
					<p>
						<img src="${pageContext.request.contextPath }/resources/images/market/star.png"	alt="별점"> 
						<img src="${pageContext.request.contextPath }/resources/images/market/star.png"	alt="별점"> 
						<img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점"> 
						<img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점"> 
						<img src="${pageContext.request.contextPath }/resources/images/market/star.png" alt="별점">
					</p>
				</div>
				<div>
					<p>
						<a href="#">${member.member_point} 포인트</a>
					</p>
				</div>
			</div>

			<div class="my_store_right">
				<div id="my_store_right_top">
					<div>
						<h2>${member.member_id}님</h2>
						<button onclick="location.href='memberModify.me'">내 정보 수정</button>
					</div>
					<div>
						<p>
							<span>OK</span> 계좌 인증 완료
						</p>
					</div>
				</div>
				<div id="my_store_right_mid">
					<div>
						<p>
							<img src="${pageContext.request.contextPath }/resources/images/market/store_open.png" alt="상점 오픈일">
						</p>
						<p>
							여긴뭐해요 <span>0 일 전</span>
						</p>
					</div>
					<div>
						<p>
							<img src="${pageContext.request.contextPath }/resources/images/market/people.png" alt="상점 방문수">
						</p>
						<p>
							거래후기 <span>0 명</span>
						</p>
					</div>
					<div>
						<p>
							<img src="${pageContext.request.contextPath }/resources/images/market/product_sell.png" alt="상품판매">
						</p>
						<p>
							내물건판매 <span>0 회</span>
						</p>
					</div>
					<div>
						<p>
							<img src="${pageContext.request.contextPath }/resources/images/market/parcel_service.png" alt="택배발송">
						</p>
						<p>
							경매참여 <span>0 회</span>
						</p>
					</div>
				</div>

				<div id="my_store_right_bot">
					<div id="intro_modify">
						<button>회원 등급 / 관심목록 / 결제수단 / 포인트 출금</button>
					</div>

					<div class="text_area">
						<textarea></textarea>
						<button>확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 프로필 영역 끝 -->

		<!-- 가계부 -->
		<div id="my_accountbook" style="margin-top: 30px;">
			<div style="display: flex; flex-direction: row; height: 400px;">
				<div id="top_x_div"	style="flex-grow: 1; width1: 50%; height: 400px; margin-left: 65px;">
					<script type="text/javascript"
						src="https://www.gstatic.com/charts/loader.js"></script>
					<script type="text/javascript">
						google.charts.load('current', {
							'packages' : [ 'bar' ]
						});
						google.charts.setOnLoadCallback(drawStuff);

						function drawStuff() {
							var data = new google.visualization.arrayToDataTable(
									[ [ '월별 지출 그래프', '원' ], [ '1월', 10000 ],
											[ '2월', 20000 ], [ '3월', 30000 ],
											[ '4월', 40000 ], [ '5월', 8000 ],
											[ '6월', 60000 ], [ '7월', 70000 ],
											[ '8월', 8000 ], [ '9월', 150000 ],
											[ '10월', 80000 ], [ '11월', 40000 ],
											[ '12월', 20000 ], ]);

							var options = {
								width : 400,
								legend : {
									position : 'none'
								},
								chart : {
									title : '월별 구매 내역',
								// 		            subtitle: 'popularity by percentage' },
								},
								bar : {
									groupWidth : "10%"
								}
							};

							var chart = new google.charts.Bar(document
									.getElementById('top_x_div'));
							// Convert the Classic options to Material options.
							chart.draw(data, google.charts.Bar
									.convertOptions(options));
						};
					</script>
				</div>

				<div id="top_x_div2" style="flex-grow: 1; height: 400px;">
					<script type="text/javascript">
						google.charts.load('current', {
							'packages' : [ 'bar' ]
						});
						google.charts.setOnLoadCallback(drawStuff2);

						function drawStuff2() {
							var data2 = new google.visualization.arrayToDataTable(
									[ [ '월별 지출 그래프', '원' ], [ '1월', 10000 ],
											[ '2월', 20000 ], [ '3월', 30000 ],
											[ '4월', 40000 ], [ '5월', 8000 ],
											[ '6월', 60000 ], [ '7월', 70000 ],
											[ '8월', 8000 ], [ '9월', 150000 ],
											[ '10월', 80000 ], [ '11월', 40000 ],
											[ '12월', 20000 ], ]);

							var options2 = {
								width : 400,
								legend : {
									position : 'none'
								},
								chart : {
									title : '월별 판매 내역',
								},
								bar : {
									groupWidth : "10%"
								}
							};

							var chart = new google.charts.Bar(document
									.getElementById('top_x_div2'));
							chart.draw(data2, google.charts.Bar
									.convertOptions(options2));
						};
					</script>
				</div>
			</div>

		</div>
		<!-- 가계부 끝 -->

		<!-- 하단 내역 부분 -->
		<div id="my_store_menu">
			<div class="container text-center menu_bar">
				<div class="row">
					<div class="col my_store_menus sales_menu">
						판매내역 <span>0</span>
					</div>
					<div class="col my_store_menus purchases_menu">
						구매내역 <span>0</span>
					</div>
					<div class="col my_store_menus secondhandLike_menu">
						중고거래 찜 <span>0</span>
					</div>
					<div class="col my_store_menus auction_menu">
						내 경매 <span>0</span>
					</div>
					<div class="col my_store_menus auctionbid_menu">
						경매 낙찰내역 <span>0</span>
					</div>
					<div class="col my_store_menus auctionLike_menu">
						경매 찜 <span>0</span>
					</div>
				</div>
			</div>

			<div id="my_store_menu_content">
				<div id="sales_menu_area" class="common_menu">
					<div>
						<p>
							판매내역 <span>1</span>
						</p>
						<ul class="goods_cate">
							<li>전체</li>
							<li class="hidden_menu">전체</li>
							<li class="hidden_menu">거래중</li>
							<li class="hidden_menu">거래완료</li>
							<li class="hidden_menu">숨김내역</li>
						</ul>
						<i class="bi bi-chevron-down under_direction under"></i>
					</div>
					<div>
						<!-- 판매 내역 시작 -->
						<div id="main_content">
							<nav class="filter_nav">
								<div class="status_filter">
									<button type="button" class="all_buy_status active">전체	상태</button>
									<button type="button" class="buying_status">진행중</button>
									<button type="button" class="bought_status">거래완료</button>
								</div>
								<div class="pay_filter">
									<button type="button" class="pay_filter">
										<svg width="20" height="20" fill="#000" viewBox="0 0 20 20">
					                     <path d="M0 3a1 1 0 011-1h3.185A2.995 2.995 0 017 0a2.995 2.995 0 012.815 2H19a1 1 0 010 2H9.815A2.995 2.995 0 017 6a2.995 2.995 0 01-2.815-2H1a1 1 0 01-1-1zm20 14a1 1 0 01-1 1H9.815A2.995 2.995 0 017 20a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h3.185A2.995 2.995 0 017 14a2.995 2.995 0 012.815 2H19a1 1 0 011 1zm0-7a1 1 0 01-1 1h-3.185A2.995 2.995 0 0113 13a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h9.185A2.995 2.995 0 0113 7a2.995 2.995 0 012.815 2H19a1 1 0 011 1zM6 3a1 1 0 102 0 1 1 0 00-2 0zm2 14a1 1 0 10-2 0 1 1 0 002 0zm6-7a1 1 0 10-2 0 1 1 0 002 0z"
											fill-rule="evenodd" fill="#000">
					                     </path>
	                 					</svg>
									</button>
								</div>
							</nav>
							<!--상품 내용-->
							<c:forEach items="${productSellList }" var="productSellList">
								<div class="goods">
									<div class="goods_one">
										<a href="product_detail?product_idx=${productSellList.product_idx }">
											<div class="goods_image">
												<c:forEach items="${fileList }" var="fileList">
													<c:set var="length" value="${fn:length(fileList.file_name) }" />
													<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
													<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
													<c:choose>
														<c:when test="${fileList.file_num eq productSellList.product_idx && productSellList.sale_status eq '판매중' }">
															<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
														</c:when>
														<c:when
															test="${fileList.file_num eq productSellList.product_idx && productSellList.sale_status eq '판매완료' }">
															<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
															<span class="goods_front"> <i
																class="far fa-check-circle"></i><br> 거래완료
															</span>
														</c:when>
													</c:choose>
												</c:forEach>
											</div>
											<div class="goods_info">
												<h2 class="goods_title">${productSellList.product_subject }</h2>
												<p class="goods_price">
													<span class="bold">${productSellList.product_price }</span>원
												</p>
												<p class="goods_shop">상점명 / 번개페이 안전결제</p>
												<c:choose>
													<c:when test="${productSellList.sale_status eq '판매중'}">
														<p class="goods_date">${productSellList.product_date }</p>
													</c:when>
													<c:when test="${productSellList.sale_status eq '판매완료'}">
														<c:forEach items="${productSellDate }" var="productSellDate">
															<p class="goods_date">${productSellDate.sell_date }</p>
														</c:forEach>
													</c:when>
												</c:choose>
											</div>
										</a>
										<c:choose>
											<c:when test="${productSellList.sale_status eq '판매중'}">
												<div class="btn_area">
													<button type="button" class="">배송 완료</button>
													<button type="button" class="" onclick="location.href='myChatting'">채팅</button>
												</div>
											</c:when>
											<c:when test="${productSellList.sale_status eq '판매완료'}">
												<button type="button" class="" onclick="location.href='myChatting'">채팅</button>
											</c:when>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 판매 내역 끝 -->
				
				<!-- 구매 내역 시작  -->
				<div id="purchases_menu_area" class="common_menu">
					<div>
						<p>
							구매내역 <span>2</span>
						</p>
						<!-- 테스트용 -->
						<c:forEach items="${goodsList }" var="goodsList">
							상품명 : ${goodsList.buy_title }
							구매일 : ${goodsList.buy_date }
						</c:forEach>
						<ul class="goods_cate">
							<li>전체</li>
							<li class="hidden_menu">전체</li>
							<li class="hidden_menu">거래중</li>
							<li class="hidden_menu">거래완료</li>
							<li class="hidden_menu">숨김내역</li>
						</ul>
						<i class="bi bi-chevron-down under_direction under"></i>
					</div>
					<div>

						<!-- 구매 내역 메인 컨텐츠 -->
						<!--반품 모달-->
						<div class="modal_return_area hidden">
							<div class="return_bg bg"></div>
							<div class="return_modal">
								<h2>알림</h2>
								<p>반품신청 하시겠습니까?</p>
								<div class="btn_area">
									<button type="button" class="btn_no">아니요</button>
									<button type="button" class="btn_yes">네</button>
								</div>
							</div>
						</div>
						<!--상품수령 모달-->
						<div class="modal_decide_area hidden">
							<div class="decide_bg bg"></div>
							<div class="decide_modal">
								<div class="decide_content">
									<h2>상품을 수령하셨나요?</h2>
									<p>
										구매확정 후에는 취소할 수 없습니다.<br> 만약 상품 수령 전에 미리 구매확정을 할 경우 사기 위험에
										노출될 수 있습니다.<br> (불법적 금융대출 목적으로 이용 시 금융거래에 불이익을 받을 수
										있습니다.)
									</p>
								</div>
								<div class="btn_area">
									<button type="button" class="btn_no">아니요</button>
									<button type="button" class="btn_yes">네</button>
								</div>
							</div>
						</div>
						<!--리뷰 모달-->
						<div class="modal_review_area hidden">
							<div class="review_bg bg"></div>
							<div class="review_modal">
								<h2>알림</h2>
								<p>
									후기는 앱에서만 작성할 수 있습니다 <br> 작성하시겠습니까?
								</p>
								<div class="btn_area">
									<button type="button" class="btn_no">아니요</button>
									<button type="button" class="btn_yes">네</button>
								</div>
							</div>
						</div>
						<div id="main_content">
							<!--필터-->
							<nav class="filter_nav">
								<div class="status_filter">
									<button type="button" class="all_buy_status active">전체
										상태</button>
									<button type="button" class="buying_status">진행중</button>
									<button type="button" class="bought_status">완료</button>
									<button type="button" class="cancle_status">취소/환불</button>
								</div>
								<div class="pay_filter">
									<button type="button" class="pay_filter">
										<svg width="20" height="20" fill="#000" viewBox="0 0 20 20">
				                           <path d="M0 3a1 1 0 011-1h3.185A2.995 2.995 0 017 0a2.995 2.995 0 012.815 2H19a1 1 0 010 2H9.815A2.995 2.995 0 017 6a2.995 2.995 0 01-2.815-2H1a1 1 0 01-1-1zm20 14a1 1 0 01-1 1H9.815A2.995 2.995 0 017 20a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h3.185A2.995 2.995 0 017 14a2.995 2.995 0 012.815 2H19a1 1 0 011 1zm0-7a1 1 0 01-1 1h-3.185A2.995 2.995 0 0113 13a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h9.185A2.995 2.995 0 0113 7a2.995 2.995 0 012.815 2H19a1 1 0 011 1zM6 3a1 1 0 102 0 1 1 0 00-2 0zm2 14a1 1 0 10-2 0 1 1 0 002 0zm6-7a1 1 0 10-2 0 1 1 0 002 0z"
											fill-rule="evenodd" fill="#000">
				                           </path>
				                       </svg>
									</button>
								</div>
							</nav>
							<!--상품 내용-->
							<c:forEach items="${productBuyList }" var="productBuyList">
								<div class="goods">
									<div class="goods_one">
										<a href="product_detail?product_idx=${productBuyList.product_idx }">
											<div class="goods_image">
												<c:forEach items="${fileList }" var="fileList">
													<c:set var="length" value="${fn:length(fileList.file_name) }" />
													<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
													<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
													<c:choose>
														<c:when test="${fileList.file_num eq productBuyList.product_idx && productBuyList.buy_status eq '배송완료' }">
															<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
															<span class="goods_front"> <i class="fas fa-box"></i><br>
																배송완료
															</span>
														</c:when>
														<c:when test="${fileList.file_num eq productBuyList.product_idx && productBuyList.buy_status eq '거래완료' }">
															<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
															<span class="goods_front"> <i class="far fa-check-circle"></i><br> 
															거래완료
															</span>
														</c:when>
													</c:choose>
												</c:forEach>
											</div>
											<div class="goods_info">
												<h2 class="goods_title">${productBuyList.buy_title }</h2>
												<p class="goods_price">
													<span class="bold">${productBuyList.buy_price }</span>원
												</p>
												<p class="goods_shop">상점명 / 번개페이 안전결제</p>
												<p class="goods_date">${productBuyList.buy_date }</p>
											</div>
										</a>
										<c:choose>
											<c:when test="${productBuyList.buy_status eq '배송완료' }">
												<div class="btn_area">
													<button type="button" class="btn_buy_decide">구매확정</button>
													<button type="button" class="btn_return">반품신청</button>
												</div>
											</c:when>
											<c:when test="${productBuyList.buy_status eq '거래완료' }">
												<button type="button" class="btn_review_modal">후기작성</button>
											</c:when>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 구매 내역 끝 -->

				<!-- 찜 내역 시작 -->
				<div id="secondhandLike_menu_area" class="common_menu">
					<div>
						<p>
							중고거래 찜 <span>0</span>
						</p>
					</div>
					<div>
						<!--찜 상풍-->
						<c:forEach items="${productdibsList }" var="productdibsList">
							<div class="goods">
								<div class="goods_one">
									<a href="product_detail?product_idx=${productdibsList.product_idx }">
										<div class="goods_image">
											<c:forEach items="${fileList }" var="fileList">
												<c:set var="length" value="${fn:length(fileList.file_name) }" />
												<c:set var="index" value="${fn:indexOf(fileList.file_name, '_') }" />
												<c:set var="file_name" value="${fn:substring(fileList.file_name, index + 1, length) }" />
												<c:choose>
													<c:when	test="${fileList.file_num eq productdibsList.product_idx }">
														<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
													</c:when>
													<c:when	test="${fileList.file_num eq productdibsList.product_idx }">
														<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
														<span class="goods_front"> <i class="far fa-check-circle"></i><br> 
														거래완료
														</span>
													</c:when>
												</c:choose>
											</c:forEach>
										</div>
										<div class="goods_info">
											<h2 class="goods_title">${productdibsList.product_subject }</h2>
											<p class="goods_price">
												<span class="bold">${productdibsList.product_price }</span>원
											</p>
											<p class="goods_shop">상점명 / 번개페이 안전결제</p>
											<p class="goods_date">${productdibsList.product_date }</p>
										</div>
									</a>
									<button type="button" class=""> 찜 취소 </button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- 찜 내역 끝 -->
				
				<!-- 내 경매 시작 -->
				<div id="auction_menu_area" class="common_menu">
					<div>
						<p>
							내가 올린 경매 목록 <span>0</span>
						</p>
						<ul class="goods_cate">
							<li>전체</li>
							<li class="hidden_menu">전체</li>
							<li class="hidden_menu">참여중</li>
							<li class="hidden_menu">경매완료</li>
							<li class="hidden_menu">숨김내역</li>
						</ul>
						<i class="bi bi-chevron-down under_direction under"></i>
					</div>
					<div>
						<div id="main_content">
							<!--필터-->
							<nav class="filter_nav">
								<div class="status_filter">
									<button type="button" class="all_buy_status active">전체 상태</button>
									<button type="button" class="buying_status">진행중</button>
									<button type="button" class="bought_status">완료</button>
									<button type="button" class="cancle_status">취소/환불</button>
								</div>
								<div class="pay_filter">
									<button type="button" class="pay_filter">
										<svg width="20" height="20" fill="#000" viewBox="0 0 20 20">
				                           <path d="M0 3a1 1 0 011-1h3.185A2.995 2.995 0 017 0a2.995 2.995 0 012.815 2H19a1 1 0 010 2H9.815A2.995 2.995 0 017 6a2.995 2.995 0 01-2.815-2H1a1 1 0 01-1-1zm20 14a1 1 0 01-1 1H9.815A2.995 2.995 0 017 20a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h3.185A2.995 2.995 0 017 14a2.995 2.995 0 012.815 2H19a1 1 0 011 1zm0-7a1 1 0 01-1 1h-3.185A2.995 2.995 0 0113 13a2.995 2.995 0 01-2.815-2H1a1 1 0 010-2h9.185A2.995 2.995 0 0113 7a2.995 2.995 0 012.815 2H19a1 1 0 011 1zM6 3a1 1 0 102 0 1 1 0 00-2 0zm2 14a1 1 0 10-2 0 1 1 0 002 0zm6-7a1 1 0 10-2 0 1 1 0 002 0z"
											fill-rule="evenodd" fill="#000">
				                           </path>
				                       </svg>
									</button>
								</div>
							</nav>
							<!--상품 내용-->
							<c:forEach items="${auctionList }" var="auctionList">
								<div class="goods">
									<div class="goods_one">
										<a href="auction_detail?auction_idx=${auctionList.auction_idx }&param=${auctionList.auction_Scategory }">
											<div class="goods_image">
												<c:forEach items="${auctionfileList }" var="auctionfileList">
													<c:set var="length"	value="${fn:length(auctionfileList.file_name) }" />
													<c:set var="index" value="${fn:indexOf(auctionfileList.file_name, '_') }" />
													<c:set var="file_name" value="${fn:substring(auctionfileList.file_name, index + 1, length) }" />
													<c:choose>
														<c:when	test="${auctionfileList.file_num eq auctionList.auction_idx && auctionList.auction_status eq '경매 등록 대기중' }">
															<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
															<span class="goods_front"> 경매 진행 중 </span>
														</c:when>
														<c:when test="${auctionfileList.file_num eq auctionList.auction_idx && auctionList.auction_status eq '경매 마감' }">
															<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
															<span class="goods_front"> <i class="far fa-check-circle"></i><br> 
															경매 마감
															</span>
														</c:when>
													</c:choose>
												</c:forEach>
											</div>
											<div class="goods_info">
												<h2 class="goods_title">${auctionList.auction_title }</h2>
												<p class="goods_price">
													<span class="bold">최종 낙찰가 : ${auctionList.auction_final_price }</span>원
												</p>
												<p class="goods_shop">상점명 / 번개페이 안전결제</p>
												<p class="goods_date">경매 시작 시간 : ${auctionList.auction_date }</p>
											</div>
										</a>
										<c:choose>
											<c:when test="${auctionList.auction_status eq '경매 등록 대기중' }">
												<div class="btn_area">
													<button type="button" class="">판매 확정</button>
													<button type="button" class="" onclick="location.href='myChatting'">채팅</button>
												</div>
											</c:when>
											<c:when test="${auctionList.auction_status eq '경매 마감' }">
												<button type="button" class="" onclick="location.href='myChatting'">채팅</button>
											</c:when>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 내 경매 끝 -->

				<!-- 경매낙찰내역 시작 -->
					<div id="auctionbid_menu_area" class="common_menu">
					<div>
						<p>
							경매 낙찰 내역 <span>0</span>
						</p>
					</div>
					<div>
						<c:forEach items="${auctionBidList }" var="auctionBidList">
							<div class="goods">
								<div class="goods_one">
									<a href="auction_detail?auction_idx=${auctionBidList.auction_idx }&param=${auctionBidList.auction_Scategory }">
										<div class="goods_image">
											<c:forEach items="${auctionfileList }" var="auctionfileList">
												<c:set var="length"	value="${fn:length(auctionfileList.file_name) }" />
												<c:set var="index" value="${fn:indexOf(auctionfileList.file_name, '_') }" />
												<c:set var="file_name" value="${fn:substring(auctionfileList.file_name, index + 1, length) }" />
												<c:choose>
													<c:when test="${auctionfileList.file_num eq auctionBidList.auction_idx }">
														<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
													</c:when>
													<c:when	test="${auctionfileList.file_num eq auctionBidList.auction_idx }">
														<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
														<span class="goods_front"> <i class="far fa-check-circle"></i><br> 
														경매 낙찰
														</span>
													</c:when>
												</c:choose>
											</c:forEach>
										</div>
										<div class="goods_info">
											<h2 class="goods_title">${auctionBidList.auction_title }</h2>
											<p class="goods_price">
												<span class="bold">낙찰가 : ${auctionBidList.auction_final_price }</span>원
											</p>
											<p class="goods_shop">상점명 / 번개페이 안전결제</p>
											<p class="goods_date">${auctionBidList.auction_date }</p>
										</div>
									</a>
									<div class="btn_area">
									<button type="button" class="">결제하기</button>
									<button type="button" class="" onclick="location.href='myChatting'">채팅</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>				
				<!-- 경매낙찰내역 시작 -->
			
				
				<!-- 경매 찜 시작 -->
				<div id="auctionLike_menu_area" class="common_menu">
					<div>
						<p>
							경매 찜 <span>0</span>
						</p>
					</div>
					<div>
						<c:forEach items="${auctionDibsList }" var="auctionDibsList">
							<div class="goods">
								<div class="goods_one">
									<a href="product_detail?product_idx=${auctionDibsList.auction_idx }">
										<div class="goods_image">
											<c:forEach items="${auctionfileList }" var="auctionfileList">
												<c:set var="length"	value="${fn:length(auctionfileList.file_name) }" />
												<c:set var="index" value="${fn:indexOf(auctionfileList.file_name, '_') }" />
												<c:set var="file_name" value="${fn:substring(auctionfileList.file_name, index + 1, length) }" />
												<c:choose>
													<c:when test="${auctionfileList.file_num eq auctionDibsList.auction_idx }">
														<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
													</c:when>
													<c:when	test="${auctionfileList.file_num eq auctionDibsList.auction_idx }">
														<img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지">
														<span class="goods_front"> <i class="far fa-check-circle"></i><br> 
														거래완료
														</span>
													</c:when>
												</c:choose>
											</c:forEach>
										</div>
										<div class="goods_info">
											<h2 class="goods_title">${auctionDibsList.auction_title }</h2>
											<p class="goods_price">
												<span class="bold">${auctionDibsList.auction_final_price }</span>원
											</p>
											<p class="goods_shop">상점명 / 번개페이 안전결제</p>
											<p class="goods_date">${auctionDibsList.auction_date }</p>
										</div>
									</a>
									<button type="button" class=""> 찜 취소 </button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- 경매 찜 끝 -->
				
			</div>
		</div>
		<!-- 하단 내역 부분 끝 -->
	</div>
	<!-- main_content 영역 끝 -->

	<!-- 푸터 시작 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>