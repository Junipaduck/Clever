<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>경매 - 상세페이지</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css?after">
    <!-- 공통 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
    <!-- 상세페이지 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_product_detail.css?after">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatting/chatting.css">
	
    <!-- 햄버거 메뉴 호버시 -->
    <script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/goods/goods_detail_menu.js"></script>
    <!-- 파비콘 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/chatting/chatting.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<style type="text/css">
	.goods_info  {
	height: 90px;
	}
	#textDiv {
		margin-top: 100px;
	}
	
	div .category_box {
	color: #4f4f4f;
	text-decoration: none;
	font-size: 12px;
	font-weight: 500;
	}
	.entire_bar  li, .category_clothes_bar  li , .category_acc_bar  li {
 	z-index: 10; 
 	position: relative;
 	background-color: #ffffff;
	}
	div #category {
	height: 61px;
	}
	</style>
</head>

<body>

	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="auction_header.jsp" />
	</header>
    <!-- main_content 영역 -->
    	<input type="hidden" id="inputInt" name="inputInt" value="${detailmap.auction_final_price }">
        <div id="main_content">
            <br>
            <!-- 카테고리 -->
                <div id="category">
                    <p id="home">
                        <span>
                            <img src="${pageContext.request.contextPath }/resources/images/market/home.png" alt="home">
                        </span>
                        <a href="auction"><span>홈</span></a>
                    </p>
                    <p id="entire">
                        <span>
                            <i class="bi bi-chevron-right"></i>
                        </span>
                        <span>
                            <ul class="entire_bar">
                                <c:if test="${not empty bigCategory }">
	                                <li><a href="auction_list?param=${bigCategory }">${bigCategory }</a></li>
                                </c:if>
                                <c:if test="${not empty midCategory }">
	                                <li><a href="auction_list?param=${midCategory[0].bigCategory }">${midCategory[0].bigCategory }</a></li>
                                </c:if>
                                <c:if test="${not empty smallCategory }">
	                                <li><a href="auction_list?param=${smallCategory[0].bigCategory }">${smallCategory[0].bigCategory }</a></li>
                                </c:if>
                                <c:forEach items="${bigCategorys }" var="big">
                               		<li id="big" class="hidden_menu"><a href="auction_list?param=${big.bigCategory }">${big.bigCategory }</a></li>
                                </c:forEach>
                                
                            </ul>
                            <i class="bi bi-chevron-down under_direction"></i>
                        </span>
                    </p>
	                    <p id="category_clothes">
	                        <span>
	                            <i class="bi bi-chevron-right"></i>
	                        </span>
	                        <span>
	                            <ul class="category_clothes_bar">
	                                <c:if test="${not empty midCategory }">
		                                <li><a href="#">${midCategory[0].midCategory }</a></li>
	                                </c:if>
	                                <c:if test="${not empty smallCategory }">
		                                <li><a href="#">${smallCategory[0].midCategory }</a></li>
	                                </c:if>
                                <c:forEach items="${midCategorys }" var="mid">
                               		<li id="big" class="hidden_menu"><a href="auction_list?param=${mid.midCategory }">${mid.midCategory }</a></li>
                                </c:forEach>
	                            </ul>
	                            <i class="bi bi-chevron-down under_direction"></i>
	                        </span>
	                    </p>
                    <c:if test="${not empty midCategory or not empty smallCategory }">
	                    <p id="category_clothes">
	                        <span>
	                            <i class="bi bi-chevron-right"></i>
	                        </span>
	                        <span>
	                            <ul class="category_acc_bar">
		                                <li><a href="#">${smallCategory[0].smallCategory }</a></li>
	                            <c:forEach items="${smallCategorys }" var="smalls">
                               		<li id="big" class="hidden_menu"><a href="auction_list?param=${smalls.smallCategory }">${smalls.smallCategory }</a></li>
                                </c:forEach>
	                            </ul>
	                            <i class="bi bi-chevron-down under_direction"></i>
	                        </span>
	                    </p>
                    </c:if>
                    
                </div>
                
            <!-- // category -->

            <!-- detail_content -->
            <div id="detail_content">
                <div class="container text-center">
                    <div class="row">
                        <div class="col detail_content_img">
                            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
                                <div class="carousel-indicators">
                                    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active change" id="change0" aria-current="true" aria-label="Slide 1"></button>
                                    <c:choose>
                                    	<c:when test="${fn:length(fileList) > 1 }">
		                                    <c:forEach items="${fileList }" var="file" varStatus="status" end="${fn:length(fileList) - 2}">
		                                    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${status.count }" id="change${status.count }" aria-label="Slide ${status.count + 1 }"></button>
		                                    </c:forEach>
                                    	</c:when>
                                    </c:choose>
                                    
                                </div>
                                <div class="carousel-inner">
                        
			                        <c:set var="length" value="${fn:length(fileList[0].file_name) }" />
									<c:set var="index" value="${fn:indexOf(fileList[0].file_name, '_') }" />
									<c:set var="file_name" value="${fn:substring(fileList[0].file_name, index + 1, length) }" />
				                            <div class="carousel-item active">
				                                <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지" class="d-block w-100" style="height: 488px">
				                            </div>
				                   <c:if test="${fn:length(fileList) > 1 }">
				                   	<c:forEach items="${fileList }" var="file" begin="1">
			                        <c:set var="length" value="${fn:length(file.file_name) }" />
									<c:set var="index" value="${fn:indexOf(file.file_name, '_') }" />
									<c:set var="file_name" value="${fn:substring(file.file_name, index + 1, length) }" />
	                                    <div class="carousel-item ">
				                                <img src="${pageContext.request.contextPath }/resources/fileUpload/${file_name}" alt="상품 이미지" class="d-block w-100">
	                                    </div>
				                   	</c:forEach>
				                   </c:if>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                        <div class="col detail_content_info">
                            <h2>상품명 : <span>${detailmap.auction_title } </span></h2>
                            <p id="result"><span id="currentPrice">현재 가격 : ${detailmap.auction_final_price } 원</span></p>
                            <script type="text/javascript">
	                                	function getTime() {
	                                	  var element;
	                                	  const endDay = new Date('${detailmap.auction_end}');
	                                	  const currDay = new Date();
	                                	  let diff = endDay - currDay;
	                                	  const diffDays = Math.floor((endDay.getTime() - currDay.getTime()) / (1000 * 60 * 60 * 24));
	                                	  diff -= diffDays * (1000 * 60 * 60 * 24);
	                                	  const diffHours = Math.floor(diff / (1000 * 60 * 60));
	                                	  diff -= diffHours * (1000 * 60 * 60);
	                                	  const diffMin = Math.floor(diff / (1000 * 60));
	                                	  diff -= diffMin * (1000 * 60);
	                                	  const diffSec = Math.floor(diff / 1000);
	                                	  element = document.getElementById("timeOut");
	                                	  if(diffDays < 0){
	                                		  element.innerHTML = "경매 종료";                    		  
	                                	  } else {
		                                	  element.innerHTML = diffDays+"일 "+diffHours+"시 "+diffMin+"분 "+diffSec+"초";
	                                	  }
	                                	}
	                                	(function() {
	                                		return setInterval(() => getTime(), 1000);
										}());
	                               </script>
                               <div id="timeOut" style="color: red; text-align: left; font-size: 20px"></div>
                            <hr>
                            <div id="detail_content_info_mid">
                                <p>
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/heart.png" alt="찜">
                                    <span>${detailmap.dibsCount }</span>
                                </p>
                                <p style="width: 80px;">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/eye.png" alt="조회">
                                    <span>${detailmap.auction_readcount }</span>
                                </p>
                                <p style="width: 130px;">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/time.png" alt="지난 시간">
                                    <span>${detailmap.date }</span>
                                </p>
                                <p>
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/report.png" alt="신고">
                                    <span>신고하기</span>
                                </p>
                            </div>
                            <div id="detail_content_info_state">
                                <p>
                                    <span>· 시작가격</span>
                                    <span class="shipping" id="auction_price"></span>
                                </p>
                                <p> 
                                    <span>· 상품상태</span>
                                    <span>${detailmap.auction_product_status }</span>
                                </p>
                                <p>
                                    <span>· 거래지역</span>
                                    <span><img src="${pageContext.request.contextPath }/resources/images/goods/place.png" alt="주소"> ${detailmap.auction_address }</span>
                                </p>
                            </div>
                            <jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" type="time" var="today" />
<%-- 							<fmt:parseDate value="" var="auction_start" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // detail_content -->

            <!-- related_goods -->
            <div id="related_goods" style="margin-top: 150px">
                <div>
                    <h3>연관 상품</h3>
                    <p>AD<span><img src="${pageContext.request.contextPath }/resources/images/goods/i.svg" alt="AD"></span></p>
                </div>
                <div class="container text-center" id="related_goods_imgs">
                    <div class="row g-2">
                        <div class="col-2 goods_list">
                            <div class="related_goods_img">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/cashmere_coat.jpg" alt="연관상품 캐시미어 코트">
                                    <p>연관 상품 목록</p>
                                </a>
                            </div>
                        </div>
                        <div class="col-2 goods_list">
                            <div class="related_goods_img">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/hood_coat.jpg" alt="연관상품 후드코트">
                                    <p>연관 상품 목록</p>
                                </a>
                            </div>
                        </div>
                        <div class="col-2 goods_list">
                            <div class="related_goods_img">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/wool_coat.jpg" alt="연관상품 울코트">
                                    <p>연관 상품 목록</p>
                                </a>
                            </div>
                        </div>
                        <div class="col-2 goods_list">
                            <div class="related_goods_img">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/long_padded.jpg" alt="연관상품 롱패딩">
                                    <p>연관 상품 목록</p>
                                </a>
                            </div>
                        </div>
                        <div class="col-2 goods_list">
                            <div class="related_goods_img">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/short_padded.jpg" alt="연관상품 숏패딩">
                                    <p>연관 상품 목록</p>
                                </a>
                            </div>
                        </div>
                        <div class="col-2 goods_list">
                            <div class="related_goods_img">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath }/resources/images/goods/cream_short_padded.jpg" alt="연관상품 크림색 숏패딩">
                                    <p>연관 상품 목록</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // related_goods -->

            <!-- url_images -->
            <div id="url_images">
                <p>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/naver.png" alt="Naver blog">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/facebook.png" alt="Facebook">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/twitter.png" alt="Twitter">
                    </span>
                    <span>
                        <img src="${pageContext.request.contextPath }/resources/images/goods/url.png" alt="URL">
                    </span>
                </p>
            </div>
            <!-- // url_images -->

            <!-- goods_info -->
            <div id="goods_info">
                <div class="container text-center info_area">
                    <div class="row g-2">
                        <div class="col-8 info_area_left">
                            <div class="info_content">
                                <div>
                                    <p>
                                        상품정보
                                    </p>
                                </div>
                                <div>
                                    ${detailmap.auction_content }
                                </div>
                            </div>
                            <div class="p-3 detailed_information">
                                <div class="container text-center ">
                                    <div class="row g-2">
                                        <div class="col-4">
                                            <div class="p-3 detailed_information_place">
                                                <img src="${pageContext.request.contextPath }/resources/images/goods/bottom_place.png" alt="거래지역"> <span>거래지역</span>
                                                <p>${detailmap.auction_address }</p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="p-3 detailed_information_category">
                                                <img src="${pageContext.request.contextPath }/resources/images/goods/category.png" alt="카테고리"> <span>카테고리</span>
                                                <p>${detailmap.auction_Lcategory } <br>↓<br> ${detailmap.auction_Mcategory } <br>↓<br> ${detailmap.auction_Scategory }</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-4">
                            <div class="store_info_area">
                                <div>
                                    <p>
                                        상점정보
                                    </p>
                                </div>
                                <div>
                                    <div>
                                        <div>
                                            <img src="${pageContext.request.contextPath }/resources/images/goods/store.svg" alt="상점명">
                                        </div>
                                        <div>
                                            <p>
                                                상점명
                                            </p>
                                            <p>
                                                <p>
                                                    상품 <span>0</span>
                                                </p>
                                                <p>
                                                    팔로워 <span>0</span>
                                                </p>
                                            </p>
                                        </div>
                                        <div id="store_follow">
                                            <button>
                                                <img src="${pageContext.request.contextPath }/resources/images/goods/follow.png" alt="팔로우">팔로우
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <img src="${pageContext.request.contextPath }/resources/images/goods/test_img.jpg" alt="상품 더보기">
                                        <img src="${pageContext.request.contextPath }/resources/images/goods/test_img.jpg" alt="상품 더보기">
                                    </div>
                                    <div>
                                        <p><span>0개</span> 상품 더보기 ></p>
                                    </div>
                                </div>
                                <div>
                                    <p>상점후기 <span>0</span></p>
                                    <div>
                                        <p>
                                            등록된 후기가 없습니다.<br>
                                            첫 후기를 등록해보세요!
                                        </p>
                                        <button>
                                            후기작성
                                        </button>
                                    </div>
                                </div>
                                <div>
                                    <button>
                                        <img src="${pageContext.request.contextPath }/resources/images/goods/talk.png" alt="번개톡"> 번개톡
                                    </button>
                                    <button>바로구매</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="side_bar2">
            	<div id="contentCover2">
					<div id="chatWrap" style="width: 400px; height: 500px">
			            <div id="chatHeader">입찰 내역</div>
			            	<div id="chatLog2">
		            	</div>
					</div>
				</div>
            </div>
            
            <!-- // goods_info -->
        <!-- // main_content 영역 -->
       		<c:if test="${sessionScope.sId eq detailmap.member_id }">
	       		<div class="btn_submit_area">
			        <div class="inner_submit">
			            <!--폼으로 등록 테스트 하실 때 type=submit으로 바꿔서 진행해주세요-->
			            <input type="button" class="btn_goods_submit" value="수정하기" onclick="location.href = 'auction_detail_modify?auction_idx=${detailmap.auction_idx}'" style="margin-right: 20px; background-color: blue;">
			            <input type="button" class="btn_goods_submit" value="삭제하기" onclick="location.href = 'auction_delete?auction_idx=${detailmap.auction_idx}'">
			        </div>
		    	</div>
	    	</c:if>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	
<script type="text/javascript">

	$(function() {
		auctionStart();
		document.getElementById("auction_price").innerText = comma(${detailmap.auction_price }) + " 원";
		
	});
// 	var chatSocket = new SockJS('http://c3d2212t2.itwillbs.com/Clever/auction_detail');
	var chatSocket = new SockJS('http://localhost:8082/clever/auction_detail');
	var userId = "${sessionScope.sId}";
	var auction_idx = "${param.auction_idx}";
	var logList = "${logList}";
	var logRoom_idx = "${logRoomIdx}";
	var message; //메시지 객체 들고오는 변수
	var checkPrice = false;

	
	var regex = /[^0-9]/g;
	
	function inputNumberFormat(obj) {
		
	    obj.value = comma(uncomma(obj.value));
	}
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
	
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	function showPrice() {
		
		var priceInput = document.getElementById("price").value;
		
		if(priceInput==""||priceInput==null||priceInput[0]=='0'){
			alert("금액을 확인하세요");
			return;
		}
		
		var currentPrice = document.getElementById("currentPrice").innerText; 
		var regexPrice = parseInt(currentPrice.replace(regex, "")); //정규표현식을 이용하여 현재가격 문자 추출
		var priceInputInt = parseInt(uncomma(priceInput));  //현재 입력한 값 인트타입 변환
		
		if(regexPrice>=priceInputInt) {
			alert("현재 가격보다 높게 입력하세요 !!");
			return;
		}
		
		checkPrice = true;
		
// 		var resultElement = document.getElementById("result");
// 		$("#inputInt").val(priceInput);
	
	}
	
	function auctionAddPrice(percent) {
		
		var priceInput;
		var currentPrice = document.getElementById("currentPrice").innerText; 
		var regexPrice = parseInt(currentPrice.replace(regex, "")); //정규표현식을 이용하여 현재가격 문자 추출
 		alert(regexPrice);
 		regexPrice += regexPrice * percent;
		alert(regexPrice);
		regexPrice = Math.floor(regexPrice/10) * 10; //10원 단위 짜르기
		$('#price').val(comma(regexPrice));
		
	}
	
	
	
// 	function auctionLog(){
// 		location.href="auction_Log";
// 	}
	

	//서버에서 메시지를 받았을 때

//war파일(DB공용폴더)로 연결시 소켓 연결 주소

//var chatSocket = new WebSocket('ws://localhost:8089/clever/chatting');


//el태그통해 js변수 셋팅
// const userNo = "${loginUser.userNo}";

// const contextPath = "${pageContext.request.requestURL}";
// //chat이라는 요청주소로 통신할수있는 webSocket 객체 생성 --> /spring/chat
// var chatSocket = new SockJS(contextPath + "/chatting");

// // 페이지 로딩 완료시 채팅창을 맨 아래로 내리기. 즉시 실행함수. IIFE
// (function() {
//  const displayChatting = document.getElementsByClassName("display-chatting")[0];

//  if (displayChatting != null) {
//      displayChatting.scrollTop = displayChatting.scrollHeight;
//  }
// })();

// 메세지 전송 버튼 클릭 시 이벤트


// 엔터키 눌렀을 때 메세지 전송
// $("#message").keypress(function(e) {
// 	if (e.keyCode && e.keyCode === 13) {
// 		$("#btnSend").trigger("click");
// 	}
// });


//메세지 전송
function sendMessage() {
	
	alert(checkPrice);
	
	if(checkPrice==false) {
		return;
	}
	// 채팅이 입력되는 textarea요소 가져오기
	
	// 채팅 내용을 입력하지 않았을 때
	if (message.value.trim().length == 0) {
     
		alert("채팅내용을 입력해주세요!");
		message.value = "";		// text입력창 초기화
		message.focus();
		
	// 채팅 내용 있을 때	
	} else {
	const chatMessage = {		// js객체로 생성
// 		"buyerId": userName,
		"logRoom_idx": logRoom_idx,
		"chat_id" : userId,
// 		"message_date" : ,
		"auction_idx": auction_idx,
		"message_content" : message.value
	};

	alert(chatMessage);
	alert(JSON.stringify(chatMessage));
	
	// 소켓으로 내용 보내기
	chatSocket.send(JSON.stringify(chatMessage));
	message.value = "";		// text입력창 초기화
	}
}

// 서버에서 메시지를 받았을 때
chatSocket.onmessage = function(e) {
	
	// 전달받은 메세지를 JS객체로 변환
// 	const chatMessage = JSON.parse(e.data);
	
	var receive = e.data.split(":");
	const data = {
			"id" : receive[0],
			"message" : receive[1],
			"auction_idx" : receive[2]
	}
	console.log('id : ' + data.id);
	console.log('message : ' + data.message);
	alert("테스트트트" + data.auction_idx);
	
	// 채팅방 화면에 채팅 내용 출력
	if (data.id == userId && auction_idx==data.auction_idx) {
		var str = "<div class='myMsg'>";
		str += "<span class='msg'><b>"+ data.id + " : "  + data.message + "</b></span>";
		str += "</div></div>";
		
		$("#chatLog2").append(str);
		
	} else if (auction_idx==data.auction_idx) {
		var str = "<div class='anotherMsg'>";
		str += "<span class='msg'>"+ data.id +" : <b>"  + data.message + "</b></span>";
		str += "</div></div>";
		
		$("#chatLog2").append(str);
		
	} 
	
	if(auction_idx==data.auction_idx){
		currentPrice = document.getElementById("currentPrice");
		currentPrice.innerText = "현재가격 : " + data.message + " 원";
	}
	
};

// 소켓 연결
chatSocket.onopen = function(e) {
	console.log('${sessionScope.sId}' + " 입장");
	var user = '${sessionScope.sId}';
	var str = user + "님이 입장하셨습니다.";
	$("#chatLog2").append(str);
}

// 소켓 연결 끊김 
chatSocket.onclose = function(e) {
	console.log('${sessionScope.sId}' + " 퇴장");
	var user = '${sessionScope.sId}';
	var str = user + " 님이 퇴장하셨습니다.ㅜ";
	$("#chatLog2").append(str);
}

</script>
<script type="text/javascript">
$(function() {
// 	document.getElementById("btnSend").addEventListener("click", sendMessage);
	$("#btnSend").on("click", function() {
		sendMessage();
	});
});
function auctionStart() {
	var auction_start = new Date("${detailmap.auction_start}");
	var auction_end = new Date("${detailmap.auction_end}");
	var nowDate = new Date();
	if(auction_start < nowDate && auction_end > nowDate){
		$("#detail_content_info_state").append(
				'<div style="height: 50px;">'
				+ '<span style="font-size: 20px">· 입찰가 : </span>'
				+ '<input type="text" id="price" name="price" value="" onkeyup="inputNumberFormat(this)" oninput="this.value = this.value.replace(/[^0-9.]/g, "").replace(/(\..*)\./g, \'$1\');" style="border-radius : 10px; width: 350px; height: 50px; font-size: 25px;" placeholder="입찰가를 입력하세요">'
				+ '&nbsp;'
				+ '<span style="font-size: 20px">원</span>'
				+ '</div>'
				+ '<div>'
				+ '<div class="container text-center detail_content_info_btn">'
				+ '<div class="row g-2">'
				+ '<div class="col-4" style="width: 50%">'
				+ '<div class="p-3 info_btn2" onclick="auctionAddPrice(0.05)">현재 입찰 5% 가격</div>'
				+ '</div>'
				+ '<div class="col-4" style="width: 50%">'
				+ '<div class="p-3 info_btn3" onclick="auctionAddPrice(0.1)">현재 입찰 10% 가격</div>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '<div class="container text-center detail_content_info_btn" style="margin-top: 20px ">'
				+ '<div class="row g-2">'
				+ '<div class="col-4">'
				+ '<div class="p-3 info_btn2" id="btnSend" onclick="showPrice();">입찰하기</div>'
				+ '</div>'
				+ '<div class="col-4">'
				+ '<div class="p-3 info_btn3" id="btnSend2" >즉시구매</div>'
				+ '</div>'
				+ '<div class="col-4">'
				+ '<c:if test="${result.dibs_check != null }">'
				+ '<a class="dibs">'
				+ '<c:if test="${result.dibs_check == 0}">'
				+ '<div class="p-3 info_btn1" style="background-color: #CCCCCC" id="dibsback" >'
				+ '<img id="dibsImage" src="${pageContext.request.contextPath }/resources/images/goods/w_heart.svg" alt="찜"> 찜 '
				+ '</div>'
				+ '</c:if>'	
				+ '<c:if test="${result.dibs_check == 1}">'
				+ '<div class="p-3 info_btn1" style="background-color: #333333;" id="dibsback">'
				+ '<img id="dibsImage" src="${pageContext.request.contextPath }/resources/images/goods/hearton.png" alt="찜"> 찜'
				+ '</div>'
				+ '</c:if>'
				+ '</a>'
				+ '</c:if>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
		);
	} else if(auction_end < nowDate) {
		$("#detail_content").append("<br><br><br><h1 style='color: red; font-size: 60px' align='center'>경매 종료 되었습니다</h1>");
	}
	
	/* 찜하기 AJAX 찜하기 버튼 누르면 상호작용 */
	let url = window.location.href;
	let product_idx = url.substring(url.indexOf("=")+1,url.indexOf("&"))
	
	$(document).ready(function() {
		 $(".dibs").on("click", function(){
		 	$.ajax({
		 		url : "dibsCheck",
		 		type: 'GET',
		 		data: {'type_num':product_idx, 'member_id':'${sessionScope.sId}', "dibs_type" : "auction"},
		 		success:function(data){
				
		 			if(data==1){
		 				alert("상품 찜 하셨습니다.");
		 				$('#dibsImage').attr("src","${pageContext.request.contextPath }/resources/images/goods/hearton.png");
		 				$('#dibsback').attr("style","background-color: #333333");
		 				var result = confirm('찜목록으로 이동하시겠습니까?');
		 				if (result) {
		 					//yes
		 	 				//찜 리스트 페이지 생성 후 -> 찜리스트 페이지 이동으로 변경 
		 					location.href='myPage.me'; 
		 	 			} 
		 			}
		 			else if(data == -1){
		 				alert("로그인이 필요한 서비스입니다. ");
		 				location.href='loginForm.me';
		 			} 		 			
		 			else {
		 				alert("상품 찜 취소하셨습니다. ");
		 				$('#dibsImage').attr("src","${pageContext.request.contextPath }/resources/images/goods/w_heart.svg");
		 				$('#dibsback').attr("style","background-color: #CCCCCC");
		 			}
		 		},
		 		error:function(error){
		 			console.log(error);
		 		}
		 	});
		 });
	}); 
		
 	message = document.getElementById("price");
	
}
</script>
	
</body>
</html>