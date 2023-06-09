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
<%-- <script src="${pageContext.request.contextPath }/resources/js/chatting/chatting.js"></script> --%>
<!-- <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 로컬주소로 연결시 소켓 연결 주소
// 	var chatSocket = new SockJS('http://localhost:8082/clever/chatting');
	//war파일(DB공용폴더)로 연결시 소켓 연결 주소
	// war 파일 구울 때 열어야 하는거
	var chatSocket = new SockJS('http://c3d2212t2.itwillbs.com/Clever/chatting');
	//var chatSocket = new WebSocket('ws://localhost:8089/clever/chatting');
	
	
	//el태그통해 js변수 셋팅
	// const userNo = "${loginUser.userNo}";
	var userId = "${sessionScope.sId}";
	var buyerId = "${sessionScope.sId}";
	
	
	var modifiedProductInfo = '${productInfo}'.replace(/\r\n/g, ' ');	// JSON 데이터 안에서 /r/n이 오류 발생하므로 공백문자로 대체
	// console.log(modifiedProductInfo);
	
	// 헤더의 채팅 버튼 클릭 시
	if(!modifiedProductInfo) {
		console.log("헤더에서 입장!");
		var chatRoomInfo = JSON.parse('${chatRoom}');
		console.log(chatRoomInfo);
		var roomId = chatRoomInfo[0].chatRoom_id;
	// 	for (var i = 0; i < chatRoomInfo.length; i++) {
	// 		roomId = chatRoomInfo[i].chatRoom_id;
	// 	}
	}
	console.log(roomId);
	// 제품상세페이지 -> 채팅방 이동 시
	if(modifiedProductInfo) {
		var productIdx = "${param.product_idx}";
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
	
	//방 나누기 + 메세지나누기
// 	$("#roomSelect .roomEl").on("click", function(e) {
	$(document).on("click", "#roomSelect .roomEl", function(e) {
	    // 처음 나오는 A채팅방의 메세지 제거
	    $(".roomEl.selected").removeClass("selected");
	
	    // 목록에서 B채팅방 선택
	    $(this).addClass("selected");
	
// 	    roomId = $(this).data("id");
	    roomId = this.id;		// (0610) data-id 사용하지 않고 그냥 id사용해서 코드 변경함
	    console.log('roomId : ' + roomId);
	    productIdx = roomId.substring(roomId.indexOf("P")+1, roomId.indexOf("S"));
	    console.log('productIdx : ' + productIdx);
	    $("#chatHeader").text($(this).text());
	//     sellerId = $('input[type=hidden]').val();
	 	console.log('sellerId : ' + sellerId);
	    
	    
	    var userId = "${sessionScope.sId}";
		console.log('현재 로그인한 sId : ' + userId);
		
	    $.ajax({
	        type: "POST",
	        url: "roomInfo",
	        data: {roomId: roomId, sId: userId},
	        dataType: "json",
	        success: function(response) {
	            console.log(response);
	            // A채팅방의 메세지를 지우고, B채팅방의 메세지를 출력
	            $("#chatLog").empty();
	
	            $.each(response, function(i) {
	                var message = response[i];
	                var str = "";
	
	                // 로그인한 사용자의 아이디와 보내는 사람의 아이디를 비교하여 구분
	                if (message.senderId === userId) {
	                    str = "<div class='myMsg'>";
	                    str += "<span class='msg'>"+ message.senderId +" : <b>"  + message.message_content + "</b></span>";
	                    str += "<div>" + message.message_date +"</div></div><br></div>";
	                } else {
	                    str = "<div class='anotherMsg'>";
	                    str += "<span class='msg'>"+ message.senderId +" : <b>"  + message.message_content + "</b></span>";
	                    str += "<div>" + message.message_date +"</div></div><br></div>";
	                }
	                
	                $("#chatLog").append(str);
	                sellerId = message.seller_id;
	                console.log("채팅 내용 조회 후 sellerId ! " + sellerId);
	                buyerId = message.buyer_id;
	                console.log("채팅 내용 조회 후 buyerId ! " + buyerId);
	            });
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	});
	
	
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
	
		console.log('roomId : ' + roomId);
		console.log('productIdx : ' + productIdx);
		// 채팅 내용을 입력하지 않았을 때
		if (message.value.trim().length == 0) {
	     
			alert("채팅내용을 입력해주세요!"); 
			message.value = "";		// text입력창 초기화
			message.focus();
			
		// 채팅 내용 있을 때	
		} else {
			const chatMessage = {		// js객체로 생성
				"chatRoom_id": roomId,
				"buyer_id" : buyerId,
		 		"senderId" : userId, //하나가 잠깐 추가함
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
			
			// 새로운 채팅방일 경우 엔터키 누를때 채팅목록 생성
	//         var idValue = $(".roomEl").attr("id");
// 	        var idValue = $(".roomEl:last").attr("id");		// (0610최보아).roomEl 클래스 가진 요소들 중 마지막 요소의 id가져오기
// 	        var idValue = $(".roomEl");		// (0613최보아).roomEl 클래스 가진 요소들 모두랑 비교해야 함
	        var roomElements = $(".roomEl");		// (0613최보아).roomEl 클래스 가진 요소들 모두랑 비교해야 함
	        var foundMatch = false;
	        var idValue;
	        roomElements.each(function() {
	            idValue = $(this).attr("id");	// 현재 요소의 id값 가져오기
	            console.log("idValue: " + idValue);
	            console.log(roomId);
	            if (idValue == roomId) {
	                foundMatch = true;
	                return false;	// 종료
	            }
	        });
	        console.log("idValue: " + idValue);
	        console.log(roomId);
	        if(!foundMatch) {
	            var strTitle = '<div class="roomEl active" style="width: 440px; border: 1px solid #0084FF;" id="' + roomId + '">'
	            				 + productSubject
	            				 + '<div style="display: inline-block; float: right;"><img src="${pageContext.request.contextPath }/resources/fileUpload/나가기.png" id="btnClose" onclick="location.href=\'deleteRoom?chatRoom_id=' + roomId + '\'" style="width: 40px;"></div>'
	            				 + '</div>';
	            $("#roomSelect").append(strTitle);
	        }
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
		let chatTime = getCurrentTime();
	
		// 채팅방 화면에 채팅 내용 출력
		if (data.id == userId) {
			var str = "<div class='myMsg'>";
			str += "<span class='msg'><b>"+ data.id + " : "  + data.message + "</b></span>";
			str += "<div>" + chatTime +"</div></div><br></div>";
			
			$("#chatLog").append(str);
		} else {
			var str = "<div class='anotherMsg'>";
			str += "<span class='msg'>"+ data.id +" : <b>"  + data.message + "</b></span>";
			str += "<div>" + chatTime +"</div></div><br></div>";
			
			$("#chatLog").append(str);
		}
		
		const displayChatting = document.getElementById('chatLog');
		console.log(displayChatting);
	
		// 채팅창을 제일밑으로 내리기
		displayChatting.scrollTop = displayChatting.scrollHeight;
		// scrollTop : 스크롤 이동
		// scrollHeight : 스크롤이되는 요소의 전체 높이.
	
	};
	
	
	function getCurrentTime() {
		const now = new Date();
	
		const time = now.getFullYear() + "-" +
						addZero(now.getMonth() + 1) + "-" +
						addZero(now.getDate()) + "-" +
						addZero(now.getHours()) + ":" +
						addZero(now.getMinutes()) + ":" +
						addZero(now.getSeconds()) + " ";
	
		return time;
	}
	
	// 10보다 작은수가 매개변수로 들어오는경우 앞에 0을 붙여서 반환해주는함수.
	function addZero(number) {
		return number < 10 ? "0" + number : number;
	}
	
	
	
	// 소켓 연결
	chatSocket.onopen = function(e) {
		console.log('${sessionScope.sId}' + " 입장");
// 		var user = '${sessionScope.sId}';
// 		var str = user + "님이 입장하셨습니다.";
// 		$("#chatLog").append(str);
	}
	
	// 소켓 연결 끊김
	chatSocket.onclose = function(e) {
		console.log('${sessionScope.sId}' + " 퇴장");
// 		var user = '${sessionScope.sId}';
// 		var str = user + " 님이 퇴장하셨습니다.ㅜ";
// 		$("#chatLog").append(str);
	}
	
}); // document 끝

</script>

</head>

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
		        <div id="roomWrap" style="margin-left:-100px;">
		            <div id="roomList" style="width: 440px;">
		                <div id="roomHeader" style="width: 440px;">채팅 방 목록</div>
		<%--                 	<c:if test="${chatList.size() == 0 }"> --%>
		<!--                 		<div id="roomSelect" > -->
		<!-- 	                    	<div class="roomEl active" style="width: 440px;" data-id="1">채팅 상대가 없습니다.</div> -->
		<!--                 		</div> -->
		<%--                 	</c:if> --%>
		                <div id="roomSelect" >
		                	<c:forEach items="${chatList }" var="chatList">
			                    <div class="roomEl active" style="width: 440px; border: 1px solid #0084FF;" id="${chatList.chatRoom_id}">
			                    	${chatList.product_subject }
			                    	<div style="display: inline-block; float: right;">
			                    		<img src="${pageContext.request.contextPath }/resources/fileUpload/나가기.png" id="btnClose" onclick="location.href='deleteRoom?chatRoom_id=${chatList.chatRoom_id}'" style="width: 40px; ">
			                    	</div>
			                    </div>
<%-- 								<input type="hidden" id="sellerId" value="${chatList.seller_id }"> --%>
		<!-- 	                    <div class="roomEl" data-id="2">JSP책 판매</div> -->
		<!-- 	                    <div class="roomEl" data-id="3">엠스톤 키보드</div> -->
		                    </c:forEach>
		                </div>
		            </div>
		        </div>
		        <div id="chatWrap" style="margin-right:100px; margin-bottom:50px;">
			        <c:choose>
			        	<c:when test="${product.size() > 0 }">	<!-- 제품상세페이지에서 넘어올 때 제목 출력 -->
				        	<c:forEach items="${product }" var="product">
				            	<div id="chatHeader">${product.product_subject }</div>
				            </c:forEach>
				        </c:when>
				        <c:otherwise>
				        	<div id="chatHeader">채팅방을 선택해주세요</div>	<!-- 헤더에서 넘어올 때 제목 출력 -->
						</c:otherwise>
					</c:choose>
		            <div id="chatLog">
		            	<!-- 채팅 내용 출력 화면 -->
		            </div>
		            <form id="chatForm">
		            	<input type="text" style="display:none;"/> <!-- 의미없는 텍스트 박스 - 엔터키 입력 시 메세지 전송을 위해 필요함(form안에 text박스가 하나만 있으면 안됨) -->
		                <input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
		                <input type="button" id="btnSend" value="보내기">
		            </form>
		        </div>
		<!--         <div id="memberWrap"> -->
		<!--             <div id="memberList"> -->
		<!--                 <div id="memberHeader">채팅중인 멤버</div> -->
		<%--                 <div id="memberSelect">나 : ${sessionScope.sId }</div> --%>
		<!--                 <div id="targetUser">상대 : </div> -->
		<!--             </div> -->
		<!--         </div> -->
		    </div>
		</div>
	</div>
</div>
<!-- // main_content 영역 -->

<!-- 풋터 시작 -->
<footer>
	<jsp:include page="../inc/footer.jsp" />
</footer>


		

</body>
</html>