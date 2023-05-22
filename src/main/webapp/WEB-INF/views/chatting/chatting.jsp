<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
  crossorigin="anonymous"></script>
    <!-- 제이쿼리 -->
</head>
<style>
    .font_gray{
    color: gray;
    font-size: small;
   }
   .font_gray_b{
    color: gray;
    font-size: small;
    vertical-align: bottom;
   }

  .modal-content {
        height: 250px;
        border-radius: 12px;
        padding: 20px;
    }
    
    
    /* 채팅쪽 */
   .chattingBox{
   margin: 0 auto;
   background-color: white;
   width: 992px;
   height: 800px;
   border: 1px solid rgb(222, 224, 225);
   border-radius: 6px;
   }
   
   .chatting_memberBox{
    float: left;
    width: 30%;
    height: 100%;
    
   }
   .chatting_member{
    height:calc(100% - 80px);
    overflow-y: scroll;
    overflow-x : hidden;
    
   }
  
   .member_textBox{
    width: 200px;
    overflow : hidden;
    white-space : nowrap;
    text-overflow:ellipsis;
   }
   .chatting_content{
    float: left;
    width: 70%;
    height: 100%;
    border-left: 1px solid rgb(222, 224, 225);
   }
    /* 윗라인  */
   .myProfile , .yourPost{
    display: flex;
    align-items:center;
    border-bottom: 1px solid rgb(222, 224, 225);
    height: 80px;
    padding: 10px;
    cursor: pointer;
    
   }
   #yourPost{
    cursor: pointer;
   }
   
   .myProfile img, #yourPost img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: 1px solid rgb(222, 224, 225);
    cursor: pointer;
   }

   /* 왼쪽 채팅 멤버 */
   .yourProfile{
    display: flex;
    align-items:center;
    height: 80px;
    padding: 10px;
    cursor: pointer;
   }
   .yourProfile img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: 1px solid rgb(222, 224, 225);
   }
   .yourProfile:hover{
    background-color: #ffad0a2d;
   }
      
   /* 오른쪽 채팅 컨텐츠 */
   .messageBox{
    height:calc(100% - 80px);
    padding: 10px;
   }
   .contentDiv{
    height:calc(100% - 150px);
    overflow-y: auto;
    }
   .textDiv{
    border-radius: 10px;
    border: 2px solid rgb(192, 194, 196);
   }
   .textDiv textarea{
    padding: 10px;
    height: 100px;
    resize: none;
   }
   .textDiv>.row img{
    cursor: pointer;
   }
   
    textarea:focus {
    outline: none;
    }
   
    .middle_Btn {
            background-color: rgb(255, 177, 88);
            border: 2px solid rgb(137, 111, 58);
            border-radius: 6px;
            height: 32px;
            font-size: small;
            box-shadow: 2px 2px 2px rgba(158, 136, 93, 0.712);
        }
    
        .middle_Btn:hover {
            color: white;
        }
    
        .middle_Btn:active {
            
            margin-right: -3px;
            /* margin-top: 3px; */
            box-shadow: none;
        }
        
        .middle_bottomLine {
	        padding-top: 50px;
	        border-bottom: 1px solid rgba(128, 128, 128, 0.233);
    	}

        /* 이모티콘 */
        .imoticonBox{
            background-color: white;
            width: 500px;
            height: 500px;
            border: 2px solid rgb(192, 194, 196);
            overflow: hidden;
            z-index: 0;
        }
        .no_index{
            z-index: 0;
        }
        .emoticon_gabal{
        float: left;
        width: 33.33%;
        height: 33.33%;
        cursor: pointer;
        }

        .dynamicChat_l{
            text-align: left;
            margin: 10px;
        }
        .dynamicChat_r{
            text-align: right;
            margin: 10px;
        }

        .dynamicChat_l > .chat_text{
            display: inline-block;
            padding: 10px;
            border-radius: 4px;
            background-color: rgb(223, 223, 224);
            
        }
        .dynamicChat_r > .chat_text{
            display: inline-block;
            padding: 10px;
            border-radius: 4px;
            background-color: orange;
            color: rgb(245, 248, 249)
        }

        
        /* 스크롤 */
        .contentDiv::-webkit-scrollbar {
        width: 6px;
        }
        .contentDiv::-webkit-scrollbar-track {
        background-color: transparent;
        }
        .contentDiv::-webkit-scrollbar-thumb {
        border-radius: 3px;
        background-color: rgb(193, 193, 193);
        }
        .contentDiv::-webkit-scrollbar-button {
        width: 0;
        height: 0;
        }
        .chatting_member::-webkit-scrollbar {
        width: 6px;
        }
        .chatting_member::-webkit-scrollbar-track {
        background-color: transparent;
        }
        .chatting_member::-webkit-scrollbar-thumb {
        border-radius: 3px;
        background-color: rgb(193, 193, 193);
        }
        .chatting_member::-webkit-scrollbar-button {
        width: 0;
        height: 0;
        }
   
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

     <!-- Contents -->
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
								현재 선택한 채팅방 유저 닉네임
                        </span>
                    </div>
                </div>
                <!-- 채팅목록 -->
                <div class="chatting_member">
<!--                 	<div class="yourProfile"> -->
<!--                         <div class="d-flex align-items-center"> -->
<!--                 		</div> -->
<!--                 	</div> -->
<!-- 	                	<div class="yourProfile"> -->
<!-- 	                        <div class="d-flex align-items-center"> -->
<!-- 	                            <div class="ms-2 member_textBox"> -->
<!-- 	                                <div > -->
<!-- 	                                </div> -->
<%-- 	                                 <input type="text" class="d-none" id="roomId" name="roomId" value="${list.roomId}"> --%>
<%-- 	                                 <input type="text" class="d-none" id="post_seq" name="post_seq"value="${list.post_seq}"> --%>
<%-- 	                                 <input type="text" class="d-none" id="" name="post_seq"value="${list.post_seq}"> --%>
<!-- 	                                 <input type="text" class="d-none" id="rooId_input" name="roomId"> -->
<!-- 	                                 <input type="text" class="d-none" id="post_seq_input" name="post_seq"> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
<!--                     	</div> -->
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="${pageContext.request.contextPath }/resources/images/chatting/박하사탕.jpeg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">박하사탕</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
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
                                <div >
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
                                <div >
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
                                <div >
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
                                <div >
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
                                <div >
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
                                <div >
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
                                <div >
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
                                <div >
                                    조금 입긴했어요... ㅁㅊ놈
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
                                <div >
                                    뿌우
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
            <div class="chatting_content d-flex justify-content-center align-items-center"  id="chatting_before">
            	 <img src="${pageContext.request.contextPath }/resources/images/chatting/1234.png">
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
	</footer></body>
</html>