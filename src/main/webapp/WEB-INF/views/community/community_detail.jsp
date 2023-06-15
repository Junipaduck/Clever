<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 커뮤니티 상세페이지</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css?after">
<!-- 햄버거 메뉴 호버시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js?after"></script>
<!-- 데이트피커 cdn -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/datepicker.css">
 
<!-- 타임피커 cdn -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/timepicker.css">
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2");
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
body {
font-family: 'SUITE-Regular';
}
	/* -- 댓글 달기 --  */
	#replyArea {
		width: 770px;
		height: 150px;
		margin-left: 165px;
		margin-top: 20px;
	}
	#replyArea textarea {
		width: 690px;
		height: 50px;
 		vertical-align: middle;
		resize: none;
	}
	
	#replyArea input {
		width: 80px;
		height: 55px;
		
	}
	
	#replyContentArea {
		width: 500px;
		height: 100px;
		font-size: 12px;
/* 		white-space: nowrap; */
 		overflow: auto; 
/* 		text-overflow: ellipsis; */
	}
	
	#replyContentArea table, tr, td {
		border: none;
	}
	
	.replyContent {
		width: 350px;
		text-align: left;
	}
	.replyWriter {
		width: 60px;
	}
	.replyDate {
		width: 90px;
	}
	
	.replyContent img {
	width:10px; height:10px;
	}
	
	/* 대댓글 */
	#reReplyTextarea {
		width: 350px;
		height: 40px;
		vertical-align: middle;
		resize: none;
	}
	
	#reReplySubmit {
		width: 80px;
		height: 45px;
		vertical-align: middle;
		
	}

</style>
<script type="text/javascript">
function confirmDelete(community_idx, pageNum) {
	let result = confirm("삭제하시겠습니까?");
		if(result){
			location.href="BoardDelete.bo?community_idx=" + community_idx;
		}
}

 function confirmReplyDelete(community_idx, reply_num) {
	 let result = confirm("삭제하시겠습니까?");
	 if(result){
		 location.href = "communityTinyReplyDelete?community_idx="+ community_idx + "&reply_num=" + reply_num
	 }
	 
}
 
function reReplyWrite(community_idx, reply_num, reply_re_ref, reply_re_lev, reply_re_seq) {
	if("${sessionScope.sId}".length == 0){
		alert("로그인 후 사용가능한 기능입니다!");
	} else {
		// 다른 대댓글 영역을 제거
		$(".reReplyTr").remove();
		
		// 대댓글 영역 추가
		 $("#replyTr" + reply_num).after(
				"<tr class='reReplyTr'><td colspan='3'>"
				+ '<form action="communityTinyReReplyWrite" method="post">'
				+ '<input type="hidden" name="community_idx" value="'+ community_idx +'">'
				+ '<input type="hidden" name="reply_name" value="${sessionScope.sId }">'
				+ '<input type="hidden" name="reply_num" value="'+ reply_num +'">'
				+ '<input type="hidden" name="reply_re_ref" value="'+ reply_re_ref +'">'
				+ '<input type="hidden" name="reply_re_lev" value="'+ reply_re_lev +'">'
				+ '<input type="hidden" name="reply_re_seq" value="'+ reply_re_seq +'">'
				+ '<textarea id="reReplyTextarea" name="reply_content" ></textarea>'
				+ '<input type="submit" value="댓글 쓰기" id="reReplySubmit">'
				+ '</form></td></tr>'
					
		);
	}
}
function communityDelete(community_idx, community_div) {
	let result = confirm("삭제하시겠습니까?");
	if(result){
		location.href = 'community_delete?community_idx=' + community_idx + '&community_div=' + community_div;
	}
	
}
</script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../auction/auction_header.jsp" />
	</header>    
<!--메인 컨텐츠 -->
        <div id="main_content">
            <!--판매 폼-->
            <section class="goods_form">
                <h2>기본정보</h2>
                <form action="community_formPro" class="frm_selling_goods" id="formform" enctype="multipart/form-data" method="post">
                    <div class="goods_title_area">
                        등록일 |
                        조회수 |
                        작성자
                        <br>
                        ${communityList[0].community_date } |
                        ${communityList[0].community_readcount } |
                        ${communityList[0].member_id }
                    </div>
                    <div class="goods_title_area">
                        <p>제목</p>
                        <div class="goods_title">
                            <input type="text" value="${communityList[0].community_title }" maxlength="50" readonly="readonly">
                        </div>
                    </div>
                    
                    <div class="goods_info_area">
                        <p>설명</p>
                        <div>
                            <textarea cols="30" rows="10" readonly="readonly">${communityList[0].community_content }</textarea>
                        </div>
                    </div>
                </form>
            </section>
            <section id="replyArea">
		<form action="communityTinyReplyWrite" method="post">
			<input type="hidden" name="community_idx" value="${communityList[0].community_idx }">
			<input type="hidden" name="reply_name" value="${sessionScope.sId }">
			<c:choose>
				<c:when test="${empty sessionScope.sId }">
					<textarea id="replyTextarea" name="reply_content" disabled="disabled" placeholder="로그인 한 사용자만 작성 가능합니다."></textarea>
					<input type="submit" disabled="disabled" value="댓글 쓰기">
				</c:when>
				<c:otherwise>
					<textarea id="replyTextarea" name="reply_content" ></textarea><input type="submit" value="댓글 쓰기">
				</c:otherwise>
			</c:choose>
		
		</form>
		<div id="replyContentArea">
<!-- 			안녕하세요 댓글입니다. 안녕하세요 댓글입니다. 안녕하세요 댓글입니다. 안녕하세요 댓글입니다. 안녕하세요 댓글입니다. <br> -->
<!-- 			안녕하세요 댓글입니다. <br> -->
<!-- 			안녕하세요 댓글입니다. <br> -->
<!-- 			안녕하세요 댓글입니다. 안녕하세요 댓글입니다. 안녕하세요 댓글입니다. 안녕하세요 댓글입니다. 안녕하세요 댓글입니다.<br> -->
			<table>
				<c:forEach items="${tinyReplyCommunityList }" var="tinyReplyCommunity">
					<tr id="replyTr${tinyReplyCommunity.reply_num }">
						<td class="replyContent">
							<c:if test="${tinyReplyCommunity.reply_re_lev > 0 }">
								<%-- 반복문을 통해 board_re_lev 값 만큼 공백 추가 --%>
								<c:forEach var="i" begin="1" end="${tinyReplyCommunity.reply_re_lev }">
									&nbsp;&nbsp;
								</c:forEach>
								<%-- 답글 제목 앞에 답글 이미지(re.gif) 추가 --%>
								<img src="${pageContext.request.contextPath }/resources/images/re.gif" alt="대댓글">
							</c:if>
							${tinyReplyCommunity.reply_content } 
							<c:if test="${not empty sessionScope.sId and (sessionScope.sId eq 'admin' or sessionScope.sId eq tinyReplyCommunity.reply_name)}">
								<a href="javascript:confirmReplyDelete(${tinyReplyCommunity.community_idx },${tinyReplyCommunity.reply_num })">
									<img src="${pageContext.request.contextPath }/resources/images/delete-icon.png" alt="삭제">
								</a>
							</c:if>
							<a href="javascript:reReplyWrite(${tinyReplyCommunity.community_idx },${tinyReplyCommunity.reply_num }, ${tinyReplyCommunity.reply_re_ref }, ${tinyReplyCommunity.reply_re_lev }, ${tinyReplyCommunity.reply_re_seq })">
								<img src="${pageContext.request.contextPath }/resources/images/reply-icon.png" alt="등록">
							</a>
						
						</td>
						<td class="replyWriter">${tinyReplyCommunity.reply_name }</td>
						<td class="replyDate">
						<!-- map 으로 받아오면 오류 뜸 dateTime T를 못받아온대 -->
							<fmt:formatDate value="${tinyReplyCommunity.reply_date }" pattern="MM-dd HH:mm"/>
<%-- 							${board.reply_date } --%>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<c:if test="${sessionScope.sId eq communityList[0].member_id }">
			<input type="button" value="수정" onclick="location.href='community_modify?community_idx=${communityList[0].community_idx }'"><input type="button" value="삭제" onclick="communityDelete('${communityList[0].community_idx }','${communityList[0].community_div }');">
			<c:choose>
				<c:when test="${communityList[0].community_div eq 'auction'}">
					<input type="button" value="목록" onclick="location.href='community_auction'">
				</c:when>
				<c:otherwise>
					<input type="button" value="목록" onclick="location.href='community'">
				</c:otherwise>
			</c:choose>
	</c:if>
    </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	</body>
</html>