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
		<div class="inner">
    	<!-- 시작하기전 밑에 middle 스타일 제거해주세용 -->
    		<div class="container middle" >
        		<div class="chattingBox" style="back-ground: #6c757d">
            		<div class="chatting_memberBox">
                		<div class="myProfile">
                    		<div class="d-flex align-items-center">
<%--                     	<c:if test="${empty memdto.user_profile}"> --%>
                        		<img src="${pageContext.request.contextPath }/resources/images/chatting/9.png">
<%--                         </c:if> --%>
<%--                         <c:if test="${not empty memdto.user_profile}"> --%>
							<%-- 프로필 완성후 경로값 설정 --%>
<%--                         	<img src="/user_profile/${memdto.user_profile}"> --%>
<%--                         </c:if> --%>
                        		<span class="ms-2 fw-bolder">
<%--                             ${memdto.user_nickname} --%>
									로그인한 회원 아이디
                        		</span>
                    		</div>
                		</div>
                		<!-- 채팅목록 -->
                		<div class="chatting_member">
<%-- 				<c:if test="${list.size() == 0}"> --%>
<!--                 	<div class="yourProfile"> -->
<!--                         <div class="d-flex align-items-center"> -->
<!--                 			<b>채팅 상대가 없습니다.</b> -->
<!--                 		</div> -->
<!--                 	</div> -->
<%--                 </c:if> --%>
<%--                 <c:if test="${list.size() > 0}"> --%>
<%--                 	<c:forEach items="${list}" var="list"> --%>
<!-- 	                	<div class="yourProfile"> -->
<!-- 	                        <div class="d-flex align-items-center"> -->
<%-- 	                        로그인정보값과 비교해서 다른 프로필 추출 --%>
<%-- 		                        <c:if test="${loginSession.user_nickname ne list.username}"> --%>
<%-- 		                        	<c:if test="${empty list.user_profile_a}"> --%>
<!--                         				<img src="/resources/images/chatting/NoImg.webp"> -->
<%-- 		                        	</c:if> --%>
<%-- 		                        	<c:if test="${not empty list.user_profile_a}"> --%>
<%--                         				<img src="/user_profile/${list.user_profile_a}"> --%>
<%-- 		                        	</c:if> --%>
<%-- 		                        </c:if> --%>
<%-- 		                        <c:if test="${loginSession.user_nickname eq list.username}"> --%>
<%-- 		                        	<c:if test="${empty list.user_profile_b}"> --%>
<!--                         				<img src="/resources/images/chatting/NoImg.webp"> -->
<%-- 		                        	</c:if> --%>
<%-- 		                        	<c:if test="${not empty list.user_profile_b}"> --%>
<%--                         				<img src="/user_profile/${list.user_profile_b}"> --%>
<%-- 		                        	</c:if> --%>
<%-- 		                        </c:if> --%>
<!-- 	                            <div class="ms-2 member_textBox"> -->
<%-- 	                            	로그인정보값과 비교해서 다른 닉네임 추출 --%>
<%-- 		                             <c:if test="${loginSession.user_nickname eq list.username}"> --%>
<%-- 		                             	<span class="fw-bolder" id="report_nickname">${list.mastername}</span>  --%>
<%-- 		                             </c:if> --%>
<%-- 		                              <c:if test="${loginSession.user_nickname ne list.username}"> --%>
<%-- 		                             	<span class="fw-bolder" id="report_nickname">${list.username}</span>  --%>
<%-- 		                             </c:if>    --%>
<%-- 	                                <span class="font_gray">${list.extraaddr}·${list.last_date}</span> --%>
<!-- 	                                <div > -->
<%-- 	                                    ${list.last_chat} --%>
<!-- 	                                </div> -->
<%-- 	                                 <input type="text" class="d-none" id="roomId" name="roomId" value="${list.roomId}"> --%>
<%-- 	                                 <input type="text" class="d-none" id="post_seq" name="post_seq"value="${list.post_seq}"> --%>
<%-- 	                                 <input type="text" class="d-none" id="" name="post_seq"value="${list.post_seq}"> --%>
<!-- 	                                 <input type="text" class="d-none" id="rooId_input" name="roomId"> -->
<!-- 	                                 <input type="text" class="d-none" id="post_seq_input" name="post_seq"> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
<!--                     	</div> -->
<%-- 	                </c:forEach> --%>
<%--                 </c:if> --%>
							<div class="yourProfile">
                        		<div class="d-flex align-items-center">
                            		<img src="${pageContext.request.contextPath }/resources/images/chatting/박하사탕.jpeg">
                            		<div class="ms-2 member_textBox">
                                		<span class="fw-bolder">박하사탕</span> 
                                		<span class="font_gray">망원동·2시간전</span>
                                			<div>
                                    			박하사탕 좋아하세요?
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/슈퍼파워.jpeg">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">슈퍼파워</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    헬스갔다가 구매할게요
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/우주.jpg">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">우주를살께</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    네고 조금만 부탁드려요 ㅜㅜ
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/상상력.jpg">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">생각대로</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    안살래요
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/NoImg.webp">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">싸게싸게</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    얼마까지 깍아주실수 있으세요?
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/만수르.jpg">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">중고만수르</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    그냥 새거살게요
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/간지남.jpg">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">중고간지남</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    쿨거래 ㄱㄱ
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/NoImg.webp">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">중고간지녀</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    다살게요
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/NoImg.webp">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">귀티자르</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    조금 입긴했어요...
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="yourProfile">
			                        <div class="d-flex align-items-center">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/NoImg.webp">
			                            <div class="ms-2 member_textBox">
			                                <span class="fw-bolder">(-*3*)-</span> 
			                                <span class="font_gray">망원동·2시간전</span>
			                                <div>
			                                    뿌우
			                                </div>
			                            </div>
			                        </div>
			                    </div> 
			                </div>
			            </div>
			            <div class="chatting_content d-flex justify-content-center align-items-center"  id="chatting_before">
<%-- 			            	 <img src="${pageContext.request.contextPath }/resources/images/chatting/1234.png"> --%>
<%-- 			            	<jsp:include page="chatting_2.jsp" /> --%>
<%-- 								<img id="menu" src="${pageContext.request.contextPath }/resources/images/market/hamburger.png" alt="메뉴"> --%>
								<!-- 채팅 창 -->
							    <div class="chatContainer display-none">
							        <div class="chatTop">
							            <div class="floatLeft" id="loginOn">
<!-- 							                <img class="profile_img" id="setPic">src 사진 경로 동적 생성 -->
							            </div>
							            <div class="name_container font_noto" id="setName">(누구?)hana님<!-- 이름 동적 생성 --></div>
							            <div class="floatRight">
							                <img src="${pageContext.request.contextPath }/resources/resources/img/chat-close.png" class="btnImg close">
							                닫기버튼
							            </div>
							            <div class="floatRight">
							                <img src="${pageContext.request.contextPath }/resources/resources/img/chat-minus.png" class="btnImg down">
							                마이너스버튼?
							            </div>
							        </div>
							        <div class="chatMiddle">
							            <ul>
							                <!-- 동적 생성 -->
							                동적 생성
							            </ul>
							        </div>
							        <div class="chatBottom">
							            <textarea placeholder="메세지를 입력해 주세요."></textarea>
							        </div>
							    </div>
							    
							    <!-- format -->
							    <div class="chatMiddle format">
							        <ul>
							            <li>
							                <div class="sender">
							                    <span>??????????sender</span>
							                </div>
							                <div class="message">
							                    <span>message</span>
							                </div>
							            </li>
							        </ul>
							    </div>
							 
							    <!-- 채팅 리스트 -->
							    <div class="chatListContainer font_jua display-none">
							        <div class="chatTop">
							            <div style="padding: 10px; margin-left: 4px;"></div>
							        </div>
							        <div class="chatList">
							        	채팅 리스트 동적생성
							            <!-- 동적 생성 -->
							        </div>
							    </div>
			            </div>
			            <div class="chatting_content d-none" id="chatting_after">
			                <div class="yourPost">
			                    <!-- 클릭시게시글로 이동 -->
			                    <div class="d-flex align-items-center" id="yourPost">
			                        <img src="${pageContext.request.contextPath }/resources/images/chatting/타블렛.jpeg">
			                        <div class="ms-2">
			                            <span class="fw-bolder">우주를살께</span> 
			                            <span class="font_gray">한번도안쓴 타블렛팝니다</span>
			                            <div class="fw-bolder">
			                                <span>5,000원</span>
			                            </div>
			                        </div>
			                    </div>
			                     <!-- 모달 -->
			                    <div class="col p-0 dropdown text-end">
			                        <a href="#" class="naviIcon fw-bolder" data-bs-toggle="dropdown" aria-expanded="false">
			                            <img src="${pageContext.request.contextPath }/resources/images/chatting/navibar.png" height="35px">
			                        </a>
			                        <ul class="dropdown-menu no_index" aria-labelledby="dropdownMenuButton1">
			                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModa3">신고하기</a></li>
			                            <li><a class="dropdown-item" id="chatExit" href="#">채팅방 나가기</a></li>
			                        </ul>
			                        <!-- Modal -->
			                		<div id="modal_delete">
			                    		<div class="modal fade" id="exampleModa3" aria-labelledby="exampleModalLabel" aria-hidden="true">
			                        		<div class="modal-dialog modal-dialog-centered" style="width: 350px;">
			                            		<div class="row align-items-center modal-content ">
			                                		<div class="row align-items-center middle_bottomLine">
			                                			<form class="m-0" id="reportForm" action="/report/insert" method="post">
				                                    		<div class="col d-flex justify-content-center" id="modalTitle" style="width:auto;">
				                                        		<input type="text" class="form-control-plaintext fw-bolder" id="report_content"
				                                            		name="report_content" placeholder="내용을 입력하세요">
				                                   		 	</div>
				                                     		<div class="d-none">
								                         		<input type="text" name="user_id"  value="${loginSession.user_id}"> <%-- 신고보내는 사람 --%>
								                         		<input type="text" name="user_category"  value="${loginSession.user_category}"> <%-- 그사람 로그인 카테고리 --%>
								                         		<input type="text" name="reported_id"id="reported_id" > <%-- 신고받는 사람 --%>
								                         		<input type="text" name="category"  value="채팅"> <%-- 게시글 카테고리 --%>
								                         		<input type="text" name="category_seq"id="category_seq"  > <%-- 게시글 번호 --%>
								                     		</div>
			                                    		</form>
			                                		</div>
			
			                                	<div class="col d-flex justify-content-center pt-5" id="modalBtn">
			                                    	<button type="button" class="middle_Btn" id="post_reportBtn"
			                                        	data-bs-dismiss="modal">신고하기</button>
			                                	</div>
			                            	</div>
			                        	</div>
			                    	</div>
			                	</div>
							</div>
						</div>
						<div class="messageBox">
							<!-- 텍스트창 -->
							<div class="contentDiv">
							</div>
			                    <!-- <div class="imoticonBox"></div> -->
			                    <!-- 인풋창 -->
							<div class="textDiv">
								<div>
									<textarea class="form-control-plaintext font_style" id="chatting_content" name="chatting_content"
										placeholder="메세지를 입력하세요."></textarea>
								</div>
			                        
								<div class="row p-2 dropup">
									<!-- 이모티콘 -->
									<div class="col" id="dropdownMenuButton1" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/이모티콘.png" height="30px">
									</div>
			                            
									<div class="dropdown-menu ms-2 imoticonBox"  aria-labelledby="dropdownMenuButton1">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/1.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/2.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/3.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/4.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/5.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/6.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/7.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/8.png" class="emoticon_gabal">
										<img src="${pageContext.request.contextPath }/resources/images/chatting/9.png" class="emoticon_gabal">
									</div>
									<div class="col text-end me-2">
										<span class="font_gray">
											<span class="length_num">0</span>/100
										</span>
										<button type="button" class="middle_Btn ms-2" id="writeBtn" style="width: 50px;">전송</button>
									</div>
								</div>
							</div>
						</div>
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
	
	
	
	
	<script>
    $(".myProfile").on("click",function(){
		location.href = "/mypage/toMyStore?user_id=${loginSession.user_id}";
	})
    //신고
    $("#post_reportBtn").on("click",function(){
    	 $("#reportForm").submit();
    	
    })
    //게시글 클릭시 디테일페이지 이동
    $("#yourPost").on("click",function(e){
    	let post_seq = $("#post_seq_input").val();
    	console.log(post_seq);
    	location.href = "/post/toPostDetail?post_seq="+post_seq;
    })
    //채팅방 나가기 클릭시
  	$("#chatExit").on("click", function(){
  		let roomId = $("#rooId_input").val();
  		console.log(roomId);
  		let post_seq = $("#post_seq_input").val();
    	console.log(post_seq);
  		location.href = "/chatting/chat_m_exit?roomId="+roomId+"&post_seq="+post_seq;
  	})
    //채팅멤버 클릭 -> 리스트 출력
    $(".yourProfile").on("click", function(e){
        $(".yourProfile").css('background-color','')
        $(this).css('background-color','rgb(237, 238, 239)');
        let roomId = $(this).find("#roomId").val();
        let post_seq = $(this).find("#post_seq").val();
        let loginId= '${loginSession.user_id}';
        $("#rooId_input").val(roomId);
        $("#post_seq_input").val(post_seq);
        console.log(post_seq,roomId);
       
        function ajax(){
        	 
        	  $(".yourProfile").on("click", function(e){
        		  clearInterval(timer);
        		  return 
        	 })
        	$.ajax({
        		url: "/chatting/chat_m_select"
        		, type: "get"
        		, data: {roomId : roomId, 
        				post_seq : post_seq}
        		, success: function(data){
        			console.log(data);
        			$("#chatting_before").remove();
        			$("#chatting_after").removeClass('d-none');
        			$("#yourPost").empty();
        			$("#yourPost").append(
        					"<img src='/user_profile/"+data.postMap.user_profile+"'>"
        					+'<div class="ms-2">'
        					+	'<span class="fw-bolder">'+ data.postMap.post_state +'</span>'
        					+	'<span class="font_gray ms-1">'+ data.postMap.post_title +'</span>'
        					+		'<div class="fw-bolder">'
        					+			'<span>'+data.postMap.price_selling+'원</span>'
        					+		'</div>'
        					+'</div>');
        			$("#reported_id").val(data.postMap.user_id);
        			$("#category_seq").val(data.postMap.post_seq);
        			console.log($("#reported_id").val()+$("#category_seq").val());
        			$(".contentDiv").empty();
        			for(var i=0; i<data.messagelist.length; i++){
        				if(data.messagelist[i].messageId==loginId){
        					var chat = 
        						"<div class='dynamicChat_r'>"
        						+"<span class='me-2 font_gray_b'>"
        	    				+	data.messagelist[i].upload_date
        	    				+"</span>"
        	    				+	data.messagelist[i].message 
        	    				+"</div>";
    	    				 $(".contentDiv").append(chat);
        				}else{
        					var chat = "<div class='dynamicChat_l'>" 
        	    				+ data.messagelist[i].message 
        	    				+ "<span class='ms-2 font_gray_b'>"+data.messagelist[i].upload_date+"</span></div>";
        	    				 $(".contentDiv").append(chat);
        				}
        			}
        			$(".contentDiv").scrollTop($(".contentDiv")[0].scrollHeight);   
        		}, error: function(e){
        			console.log(e);
        		}
        	})
        	
        }
        var timer = window.setInterval(ajax, 2500);
        
    })
	//이모티콘 클릭시
      $(".emoticon_gabal").on("click", function () {
    	  var now = new Date();
          // Date 객체의 getHours(시간) , getMinutes(분) 속성을 저장 합니다.
          var nowHour = now.getHours();
          var nowMt = now.getMinutes();
     		if ( nowHour <= 11  &&  nowHour  >= 0 ) {
     			if(nowHour<10){
     				var date ='오전0' + nowHour + ':' + nowMt;
     			}else{
     				var date ='오전' + nowHour + ':' + nowMt;
     			}
     		  
     		} else if (  nowHour >= 12  &&  nowHour  < 24  ) {
     			if(nowHour<20){
     				var date ='오후0' + (nowHour-12) + ':' + nowMt;
     			}else{
     				var date ='오후' + (nowHour-12) + ':' + nowMt;
     			}
    		    
     		}
     		let message2 = "이모티콘을 보냈어요."
    	  	let loginId= '${loginSession.user_id}';    
          	let roomId = $('#rooId_input').val();
          	let messageId= '${memdto.user_id}';
          	let name =  '${memdto.user_nickname}';
    	  	let message = "<span><img style='width:180px;height:180;' src=" + $(this).prop("src") + ">" + "</span>";
            let newChat = "<div class='dynamicChat_r'><span class='font_gray_b'>" + date + "</span>" 
                + message +"</div>";
            console.log(newChat);
            $(".contentDiv").append($(newChat).hide());
            $(".dynamicChat_r").fadeIn("slow")
                // 스크롤 아래
                let scrollH = $(".contentDiv").prop("scrollHeight");
                $(".contentDiv").scrollTop(scrollH);
                
              
                	$.ajax({
                		url: "/chatting/chat_m_insert"
                		, type: "post"
                		, data: {roomId:roomId, messageId : messageId, name:name,
                				message : message, message2:message2}
                		, success: function(data){
                			console.log(data);
                			if(data =="success"){
                			}else{
                				alert("실패!");
                			}
                		}, error: function(e){
                			console.log(e);
                		}
                	})
               
        })
    
    //전송버튼 클릭시
    $("#writeBtn").on("click", function(){
    	let user_id= '${memdto.user_id}';
    	let loginId= '${loginSession.user_id}';
    	console.log(user_id,loginId);
        if($(".length_num").html()>100){
            alert("글자수 초과로 입력할수 없습니다")
            return;
        }
        makeDynamicEl();
    })
    // 키보드입력시
    $("#chatting_content").on("keyup", function (e) {
        // 엔터 클릭시 
        if (e.keyCode == 13 && ($("#chatting_content").val() !== "")) {
            makeDynamicEl();
        }
        if($(".length_num").html()>100){
            alert("글자수 초과로 입력할수 없습니다")
        }
        let length_cnt = $("#chatting_content").val().length+1;
        let length_num = length_cnt*3;
        $(".length_num").html(length_num);
       
    })
    
      function makeDynamicEl(){
    	
    	let loginId= '${loginSession.user_id}';    
        let roomId = $('#rooId_input').val();
        let messageId= '${memdto.user_id}';
        let name =  '${memdto.user_nickname}';
        let message = '<span class="chat_text">' +$("#chatting_content").val() +'</span>';
       	let message2 = $("#chatting_content").val();
        $.ajax({
    		url: "/chatting/chat_m_insert"
    		, type: "post"
    		, data: {roomId:roomId, messageId : messageId, name:name,
    				message : message, message2:message2}
    		, success: function(data){
    			console.log(data);
    			if(data =="success"){
    			}else{
    				alert("실패!");
    			}
    		}, error: function(e){
    			console.log(e);
    		}
    	})  
    	 var now = new Date();
         // Date 객체의 getHours(시간) , getMinutes(분) 속성을 저장 합니다.
         var nowHour = now.getHours();
         var nowMt = now.getMinutes();
         if ( nowHour <= 11  &&  nowHour  >= 0 ) {
        	 if(nowHour<10){
  				var date ='오전0' + nowHour + ':' + nowMt;
  			}else{
  				var date ='오전' + nowHour + ':' + nowMt;
  			}
    		} else if (  nowHour >= 12  &&  nowHour  < 23  ) {
    			if(nowHour<20){
    				var date ='오후0' + (nowHour-12) + ':' + nowMt;
    			}else{
    				var date ='오후' + (nowHour-12) + ':' + nowMt;
    			}
   		    
    	}
         
    	if(loginId==messageId){
    		let newChat = "<div class='dynamicChat_r'><span class='me-2 font_gray_b'>" + date + 
            "</span>" + message + "</div>";
        	$(".contentDiv").append($(newChat).hide());
        	$(".dynamicChat_r").fadeIn("slow");
        	
    	}else{
    		let newChat = "<div class='dynamicChat_l'><span class='me-2 font_gray_b'>" + date + 
            "</span>" + message + "</div>";
	        $(".contentDiv").append($(newChat).hide());
	        $(".dynamicChat_l").fadeIn("slow");
    	}
            let scrollH = $(".contentDiv").prop("scrollHeight");
            $(".contentDiv").scrollTop(scrollH);
            $("#chatting_content").focus();
            $("#chatting_content").val("");
        }
    </script>
</body>
</html>