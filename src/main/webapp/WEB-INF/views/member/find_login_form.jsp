<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클레버 - 로그인</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!-- 네이버 로그인 css 링크 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/naverlogin.css">

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
	
	
	<!-- 중간 작업공간 시작 ============================================================== -->
	<div id="">
	
            <div class="container text-center">
			  <div class="row">
			    <div class="col"></div>
			    <div class="col"><!-- 그리드 중간부분 시작 -->
			    
			    			  
							 <div id="wrap" class="wrap">
							    <header class="header" role="banner" >
							        <div class="header_inner">
							            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px;"></a>
							        </div>
							    </header>
							
							    <div id="container" class="container">
							        <!-- content -->
							        <div class="content">
							            <div class="login_wrap">
							                <ul class="menu_wrap" role="tablist">
							                    <li class="menu_item" role="presentation">
							                        <!--[주] 탭메뉴 활성화시(=선택시) "on"을 추가해주세요. 접근성: aria-selected는 탭 선택시 true, 미선택시 false로 적용-->
							                        <!--[주:접근성] 탭메뉴의 id 값과 탭내용의 aria-controls를 연결하고 있습니다. -->
							                        <a href="#none" id="loinid" class="menu_id on" role="tab" aria-selected="true">
							                            <span class="menu_text"><span class="text">ID 로그인</span></span>
							                        </a>
							                    </li>
							                    <li class="menu_item" role="presentation">
							                        <a href="#none" id="ones" class="menu_ones" role="tab" aria-selected="false">
<!-- 							                            <span class="menu_text"><span class="text">일회용 번호</span></span> -->
							                        </a>
							                    </li>
							                    <li class="menu_item" role="presentation">
							                        <a href="#none" id="qrcode" class="menu_qr" role="tab" aria-selected="false">
<!-- 							                            <span class="menu_text"><span class="text">QR코드</span></span> -->
							                        </a>
							                    </li>
							                </ul>
							                <form action="loginPro.me" method="POST">
							                    <input type="hidden" id="localechange" name="localechange" value="">
							                    <input type="hidden" name="dynamicKey" id="dynamicKey" value="yof65-ms19PMu12I7ERX9NK_bo70mtLLDhrOpKL8WQOoh7PKDn0WWnUnh2maVur-Eq-p6To3HetGHjFR_eQiMZeayILhXOFK3AreSVv9j54">
							                    <input type="hidden" name="encpw" id="encpw" value="">
												<input type="hidden" name="enctp" id="enctp" value="1">
												<input type="hidden" name="svctype" id="svctype" value="1">
												<input type="hidden" name="smart_LEVEL" id="smart_LEVEL" value="1">
												<input type="hidden" name="bvsd" id="bvsd" value="">
												<input type="hidden" name="encnm" id="encnm" value="">
												<input type="hidden" name="locale" id="locale" value="ko_KR">
												<input type="hidden" name="url" id="url" value="https://www.naver.com/">
							
							
							                    <ul class="panel_wrap">
							                        <li class="panel_item" style="display: block;">
							                            <div class="panel_inner" role="tabpanel" aria-controls="loinid">
							                                <div class="id_pw_wrap">
							                                    <div class="input_row" id="id_line">
							                                        <div class="icon_cell" id="id_cell">
							                                            <span class="icon_id">
							                                                <span class="blind">아이디</span>
							                                            </span>
							                                        </div>
							                                        <input type="text" id="id" name="id" placeholder="아이디" title="아이디"
							                                               class="input_text" maxlength="41"
							                                               value="">
							                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;">
							                                            <span class="icon_delete">
																			<span class="blind">삭제</span>
							                                            </span>
							                                        </span>
							                                    </div>
							                                    <div class="input_row" id="pw_line">
							                                        <div class="icon_cell" id="pw_cell">
							                                            <span class="icon_pw">
							                                                <span class="blind">비밀번호</span>
							                                            </span>
							                                        </div>
							                                        <input type="password" id="pw" name="pw" placeholder="비밀번호" title="비밀번호"
							                                               class="input_text" maxlength="16">
							                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
							                                            <span class="icon_delete">
							                                                <span class="blind">삭제</span>
							                                            </span>
							                                        </span>
							                                    </div>
							                                </div>
							                                <div class="login_keep_wrap" id="login_keep_wrap">
<!-- 							                                    <div class="keep_check"> -->
<!-- 							                                        <input type="checkbox" id="keep" name="nvlong" -->
<!-- 							                                               class="input_keep"  value="off"> -->
<!-- 							                                        <label for="keep" class="keep_text">로그인 상태 유지</label> -->
<!-- 							                                    </div> -->
<!-- 							                                    <div class="ip_check"> -->
<!-- 							                                        <a href="/login/ext/help_ip3.html" target="_blank" id="ipguide" title="IP보안"><span class="ip_text">IP보안</span></a> -->
<!-- 							                                        <span class="switch"> -->
<!-- 							                                            <input type="checkbox" id="switch" -->
<!-- 							                                                   class="switch_checkbox" value="off"> -->
<!-- 							                                            <label for="switch" class="switch_btn"> -->
<!-- 							                                                <span class="blind" id="switch_blind">OFF</span> -->
<!-- 							                                            </label> -->
<!-- 							                                        </span> -->
<!-- 							                                    </div> -->
							                                </div>
							
							                                <div class="login_error_wrap" id="err_capslock" style="display: none;">
							                                    <div class="error_message">
							                                        <strong>CapsLock</strong>이 켜져 있습니다.
							                                    </div>
							                                </div>
							
							                                <div class="login_error_wrap" id="err_empty_id" style="display: none;">
							                                    <div class="error_message">
							                                        <strong>아이디</strong>를 입력해 주세요.
							                                    </div>
							                                </div>
							
							                                <div class="login_error_wrap" id="err_empty_pw" style="display: none;">
							                                    <div class="error_message">
							                                        <strong>비밀번호</strong>를 입력해 주세요.
							                                    </div>
							                                </div>
							                                <div class="login_error_wrap" id="err_common"  style="display:none;">
							                                    <div class="error_message"
							                                         style="width:90%">
							                                        
							                                    </div>
							                                </div>
							                                <div class="btn_login_wrap">
							
							                                    <button type="submit" class="btn_login" id="log.login">
							                                        <span class="btn_text">로그인</span>
							                                    </button>
							
							                                </div>
							                            </div>
							                        </li>
							                    </ul>
							                </form>
							            </div>
							            <ul class="find_wrap" id="find_wrap">
							
							                <li><a target="_blank" href=""
							                       class="find_text">비밀번호 찾기</a></li>
							                <li><a target="_blank" href=""
							                       class="find_text">아이디 찾기</a></li>
							                <li><a href="joinForm.me" class="find_text">회원가입</a>
							                </li>
							
							            </ul>
							            <!--배너-->
							            <div id="gladbanner" class="banner_wrap">
							                &nbsp;
							            </div>
							        </div>
							        <!-- //content -->
							    </div>
							
							
							</div>
							<input type="hidden" id="nclicks_nsc" name="nclicks_nsc" value="nid.login_kr">
							<input type="hidden" id="nid_buk" name="nid_buk" value="exist">
							<input type="hidden" id="removeLink" name="removeLink" value="">
							<input type="hidden" id="hide_util" name="hide_util" value="">
							<input type="hidden" id="ncaptchaSplit" name="ncaptchaSplit" value="none">
							<input type="hidden" id="id_error_msg" name="id_error_msg" value="<strong>아이디</strong>를 입력해주세요.">
							<input type="hidden" id="pw_error_msg" name="pw_error_msg" value="<strong>비밀번호</strong>를 입력해주세요.">
							<input type="hidden" id="locale" name="locale" value="ko_KR">
							<input type="hidden" id="adult_surl_v2" name="adult_surl_v2" value="">
							<input type="hidden" id="ispopup" name="ispopup" value="false">
							<script type="text/javascript" src="/login/js/bvsd.1.3.9.min.js"></script>
							<script type="text/javascript" async src="https://ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js"></script>
							<script type="text/javascript" src="/login/js/v2/default/common_202201.js?v=20230217"></script>
							<script type="text/javascript" src="/login/js/v2/default/default_202105.js?v=20230217"></script>
							<div id="nv_stat" style="display:none;">20</div>
							
							  
			    
			    </div> <!-- 그리드 중간부분 끝 -->
			    <div class="col"></div>
			  </div>
			</div>
    </div>
				  		

	<!-- 중간 작업공간 끝 ============================================================== -->
	
	
	
	
	
	
	
	
	<!-- 푸터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>