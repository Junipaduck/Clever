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
                    <div class="roomEl active" data-id="1">고양이 두부모래 팝니다~</div>
                    <div class="roomEl" data-id="2">JSP책 판매</div>
                    <div class="roomEl" data-id="3">엠스톤 키보드</div>
                </div>
            </div>
        </div>
        <div id="chatWrap">
            <div id="chatHeader">Everyone</div>
            <div id="chatLog">
<!--                 <div class="anotherMsg"> -->
<!--                     <span class="anotherName">Boa</span> -->
<!--                     <span class="msg">안녕?</span> -->
<!--                 </div> -->
<!--                 <div class="myMsg"> -->
<!--                     <span class="msg">안녕안녕</span> -->
<!--                     <span class="msg">우리집고양이</span> -->
<%--                     <img src="${pageContext.request.contextPath }/resources/images/고양이.jpg" style="width: 50px;"> --%>
<!--                 </div> -->
            </div>
            <form id="chatForm">
                <input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
                <input type="button" id="btnSend" value="보내기">
            </form>
        </div>
        <div id="memberWrap">
            <div id="memberList">
                <div id="memberHeader">채팅중인 멤버</div>
                <div id="memberSelect">나 : ${sessionScope.sId }</div>
                <div id="targetUser">Boa</div>
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
// 	var ws;
// 	var userId = '{param.id}';
	
// 	function connect() {
// 		// 웹소켓 객체 생성
// 		// 핸들러 등록(연결, 메세지 수신, 연결 종료)
		
// 		// url 연결할 서버 경로
// 		ws = new SockJS('http://localhost:8089/clever/chatting');
		
// 		ws.onopen = function() {
// 			console.log('연결 생성');
// 			register();
// 		};
// 		ws.onmessage = function(e) {
// 			console.log('메세지 받음');
// 			var data = e.data;
// 			addMsg(data);
// 		};
// 		ws.onclose = function() {
// 			console.log('연결 끊김');
// 		};
// 	}
	
// 	// 원래 채팅 메세지에 방금 받은 메세지 더하기
// 	function addMsg(msg) {
// 		var chat = $('#chatLog').val();
// 		chat = chat + "\n상대방 : " + msg;
// 		$('#chatLog').val(chat);
// 	}
	
// 	// 메세지 수신을 위한 서버에 id등록하기
// 	function register() {
// 		var msg = {
// 				type : "register",
// 				userid : '${param.id}'
// 		};
// 		ws.send(JSON.stringify(msg));
// 	}
	
// 	function sendMsg() {
// 		var msg = {
// 				type : "chat",
// 				target : $("#targetUser").val(),
// 				message : $("#chatLog").val()
// 		};
// 		ws.send(JSON.stringify(msg));
// 	};
	
// 	// 페이지 로딩되면 connect 실행
// 	$(function() {
// 		connect();
// 		console.log("로딩완");
// 		$('#btnSend').on("click", function() {
// 			var chat = $("#chatLog").val();
// 			chat = caht + "\n나 : " + $("#message").val();
// 			$("chatLog").val(chat);
// 			sendMsg();
// 			$("#chatLog").val("");
// 		})
// 	});



//전송 버튼 누르는 이벤트
$("#btnSend").on("click", function(e) {
	sendMessage();
	$('#message').val('')
});

var sock = new SockJS('http://localhost:8089/clever/chatting');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	sock.send($("#message").val());
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
	var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#chatLog").append(str);
	}
	else{
		
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#chatLog").append(str);
	}
	
}
//채팅창에서 나갔을 때
function onClose(evt) {
	
	var user = '${pr.username}';
	var str = user + " 님이 퇴장하셨습니다.";
	
	$("#chatLog").append(str);
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
	var user = '${pr.username}';
	var str = user + "님이 입장하셨습니다.";
	
	$("#chatLog").append(str);
}

</script>
	
	
</body>
</html>