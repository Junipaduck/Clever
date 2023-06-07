<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>채팅</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatting/chatting.css">
<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/chatting/chatting.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<style>

</style>
<body>
<!-- 헤더 시작 -->
<header>
	<jsp:include page="../inc/header.jsp" />
</header>	
<!-- main_content 영역 -->
<div id="main_content">
	<div class="page-navigation">
	<div id="contentWrap">
<!--     <nav> -->
<!-- 		<span id="nav-header"> -->
<!--             chat App -->
<!--         </span> -->
<!--         <span id="logoutBtn">로그아웃</span> -->
<!--     </nav> -->
    <div id="contentCover">
        <div id="roomWrap">
            <div id="roomList">
                <div id="roomHeader">채팅 방 목록</div>
                <div id="roomSelect">
                	<c:forEach items="${chatList }" var="chatList">
	                    <div class="roomEl active" data-id="1">${chatList.product_subject }</div>
<!-- 	                    <div class="roomEl" data-id="2">JSP책 판매</div> -->
<!-- 	                    <div class="roomEl" data-id="3">엠스톤 키보드</div> -->
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="chatWrap">
            <div id="chatHeader">Everyone<input type="button" id="btnClose" value="채팅 나가기"></div>
            <div id="chatLog">
            <!-- 채팅 내용 출력 화면 -->
            </div>
            <form id="chatForm">
            	<input type="text" style="display:none;"/> <!-- 의미없는 텍스트 박스 - 엔터키 입력 시 메세지 전송을 위해 필요함(form안에 text박스가 하나만 있으면 안됨) -->
                <input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
                <input type="button" id="btnSend" value="보내기">
            </form>
        </div>
        <div id="memberWrap">
            <div id="memberList">
                <div id="memberHeader">채팅중인 멤버</div>
                <div id="memberSelect">나 : ${sessionScope.sId }</div>
                <div id="targetUser">상대 : </div>
            </div>
        </div>
    </div>
</div>
	
	
	
	
	</div>
</div>
<!-- // main_content 영역 -->

	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>


		
<script type="text/javascript">

// 로컬주소로 연결시 소켓 연결 주소
var chatSocket = new SockJS('http://localhost:8082/clever/chatting');
//war파일(DB공용폴더)로 연결시 소켓 연결 주소
//var chatSocket = new SockJS('http://c3d2212t2.itwillbs.com/Clever/chatting');
//var chatSocket = new WebSocket('ws://localhost:8089/clever/chatting');


//el태그통해 js변수 셋팅
// const userNo = "${loginUser.userNo}";
var userId = "${sessionScope.sId}";
var productIdx = "${param.product_idx}";

var modifiedProductInfo = '${productInfo}'.replace(/\r\n/g, ' ');	// JSON 데이터 안에서 /r/n이 오류 발생하므로 공백문자로 대체
// console.log(modifiedProductInfo);

// 헤더의 채팅 버튼 클릭 시
if(!modifiedProductInfo) {
	console.log("헤더에서 입장!");
	var chatRoomInfo = JSON.parse('${chatRoom}');
// 	console.log(chatRoomInfo);
	var roomId = null;
	for (var i = 0; i < chatRoomInfo.length; i++) {
		roomId = chatRoomInfo[i].chatRoom_id;
	}
}
// 제품상세페이지 -> 채팅방 이동 시
if(modifiedProductInfo) {
	var productInfo = JSON.parse(modifiedProductInfo);
	var sellerIdx = "${sellerIdx}";
	var buyerIdx = "${buyerIdx}";
	console.log("sellerIdx : " + sellerIdx + ", buyerIdx : " + buyerIdx);
	var sellerId = null;
	var productSubject = null;
	for (var i = 0; i < productInfo.length; i++) {
		sellerId = productInfo[i].member_id;
		productSubject = productInfo[i].product_subject;
	}
	console.log("sellerId : " + sellerId);
	var roomId = "P" + productIdx + "S" + sellerIdx + "B" + buyerIdx;
	console.log("roomIdx : " + roomId);
}
	



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
document.getElementById("btnSend").addEventListener("click", sendMessage);

// 엔터키 눌렀을 때 메세지 전송
$("#message").keypress(function(e) {
	if (e.keyCode && e.keyCode === 13) {
		$("#btnSend").trigger("click");
	}
});

// 메세지 전송
function sendMessage() {

	// 채팅이 입력되는 textarea요소 가져오기
	const message = document.getElementById("message");

	// 채팅 내용을 입력하지 않았을 때
	if (message.value.trim().length == 0) {
     
		alert("채팅내용을 입력해주세요!");
		message.value = "";		// text입력창 초기화
		message.focus();
		
	// 채팅 내용 있을 때	
	} else {
	const chatMessage = {		// js객체로 생성
		"chatRoom_id": roomId,
		"buyer_id" : userId,
		"seller_id" : sellerId,
// 		"message_date" : ,
		"product_idx": productIdx,
		"message_content" : message.value
	};

	console.log(chatMessage);
	console.log(JSON.stringify(chatMessage));

	// 소켓으로 내용 보내기
	chatSocket.send(JSON.stringify(chatMessage));
	message.value = "";		// text입력창 초기화
	}

}

// 서버에서 메시지를 받았을 때
chatSocket.onmessage = function(e) {

// 	// 전달받은 메세지를 JS객체로 변환
// 	const chatMessage = JSON.parse(e.data);

	var receive = e.data.split(":");
	const data = {
			"id" : receive[0],
			"message" : receive[1]
	}
	console.log('id : ' + data.id);
	console.log('message : ' + data.message);

	// 채팅방 화면에 채팅 내용 출력
	if (data.id == userId) {
		var str = "<div class='myMsg'>";
		str += "<span class='msg'><b>"+ data.id + " : "  + data.message + "</b></span>";
		str += "</div></div>";
		
		$("#chatLog").append(str);
	} else {
		var str = "<div class='anotherMsg'>";
		str += "<span class='msg'>"+ data.id +" : <b>"  + data.message + "</b></span>";
		str += "</div></div>";
		
		$("#chatLog").append(str);
	}

// 	// 채팅창을 제일밑으로 내리기
// 	displayChatting.scrollTop = displayChatting.scrollHeight;
// 	// scrollTop : 스크롤 이동
// 	// scrollHeight : 스크롤이되는 요소의 전체 높이.

};


// function getCurrentTime() {
// 	const now = new Date();

// 	const time = now.getFullYear() + "년 " +
// 					addZero(now.getMonth() + 1) + "월 " +
// 					addZero(now.getDate()) + "일 " +
// 					addZero(now.getHours()) + ":" +
// 					addZero(now.getMinutes()) + ":" +
// 					addZero(now.getSeconds()) + " ";

// 	return time;
// }

// 10보다 작은수가 매개변수로 들어오는경우 앞에 0을 붙여서 반환해주는함수.
// function addZero(number) {
// 	return number < 10 ? "0" + number : number;
// }



// 소켓 연결
chatSocket.onopen = function(e) {
	console.log('${sessionScope.sId}' + " 입장");
	var user = '${sessionScope.sId}';
	var str = user + "님이 입장하셨습니다.";
	$("#chatLog").append(str);
}

// 소켓 연결 끊김 - (0601최보아) 나중에 상대방이 채팅방 나가면 상대방 아이디랑 함께 출력해줘야함
chatSocket.onclose = function(e) {
	console.log('${sessionScope.sId}' + " 퇴장");
	var user = '${sessionScope.sId}';
	var str = user + " 님이 퇴장하셨습니다.ㅜ";
	$("#chatLog").append(str);
}
</script>
	

</body>
</html>