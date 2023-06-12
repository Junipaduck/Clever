<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>클레버 - 1:1 문의</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_my_store.css">

<!-- customer_center 외부 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/board_list.jo112.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/footer.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/header.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/unit_csboard_top2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/faq.css">
</head>
<body>
<!-- 헤더 시작 -->
<header>
	<jsp:include page="../inc/header.jsp" />
</header>

				
			<div style="display: flex; justify-content: space-between; margin: 100px 0 0 0; align-items: center">
				<div class="log-tit animated con-tit">
					<p>1 : 1 문의 내역</p>
				</div>
			</div>
			<div class="bbs-cate">
				<ul>
					<li><a href="noticeMain.ad">공지사항</a></li>
					<li><a href="FAQ?param=ALL">자주묻는질문</a></li>
					<li><a href="centerAsked" data-link="jo112">1:1문의</a></li>
				</ul>
			</div>
			
<!-- main_content 영역 -->

<div id="contentWrapper">
	<div id="contentWrap">
<!-- 		<div style="display: flex; justify-content: space-between; margin: 183px 0 0 0; align-items: center"> -->
<!-- 			<div class="log-tit animated con-tit"> -->
<!-- 				<p>1 : 1 문의 내역</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="bbs-cate"> -->
<!-- 			<ul> -->
<!-- 				<li><a href="noticeMain.ad">답변 진행중</a></li> -->
<!-- 				<li><a href="/shop/faq.html">답변 완료</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
		
		<div id="bbsData">
			<div class="bbs-table-list">
				
				<script type="text/javascript"
					src="/shopimages/jo112/template/unit/48/unit_csboard_top2.js"></script>
	
				<div id="faqWrap" style="margin-top: -50px;">
					<div class="page-body">
						<div id="faqTable">
							<table summary="분류 제목">
								<caption>질문/답변</caption>
								<colgroup>
									<col width="100" />
									<col width="200" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<div class="tb-center">번호</div>
										</th>
										<th scope="col">
											<div class="tb-center">답변상태</div>
										</th>
										<th scope="col">
											<div class="tb-left" style="font-weight: 400;">제목</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${myAsked }" var="myAsked">
										<tr uid="6">
												<td>
													<div class="tb-center">${myAsked.asked_idx }</div>
												</td>
												<td>
													<c:if test="${myAsked.asked_status  eq 'N' }">
														<div class="tb-center">답변 진행중</div>
													</c:if>
													<c:if test="${myAsked.asked_status  eq 'Y' }">
														<div class="tb-center">답변 완료</div>
													</c:if>
												</td>
												<td>
													<div class="tb-left"><a href="centerAskedDetail?asked_idx=${myAsked.asked_idx }">${myAsked.asked_subject }</div>
												</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- .page-body -->
<!-- 					<div> -->
<!-- 						<ol class="paging"> -->
<!-- 							<li><strong>1</strong></li> -->
<!-- 							<li><a href="/shop/faq.html?page=2">2</a></li> -->
<!-- 							<li><a href="/shop/faq.html?page=3">3</a></li> -->
<!-- 							<li><a href="/shop/faq.html?page=4">4</a></li> -->
<!-- 							<li class="last"><a href="/shop/faq.html?page=4"><img -->
<!-- 									src="/images/d3/modern_simple/btn/btn_bmatch_paging_last.gif" -->
<!-- 									alt="끝" title="" /></a></li> -->
<!-- 						</ol> -->
<!-- 					</div> -->
				</div>
				<!-- #faqWrap -->
				
				<dl class="bbs-link bbs-link-btm animated">
					<dd>
						<a href="askedForm" class="CMbutton1" style="background-color: #0085f5; color: white;">글쓰기</a>
					</dd>
				</dl>
	
			</div>
			<!-- #contentWrap -->
		</div>
		
		<div class="qa_contents">
					<div class="qa_txt">
						<div class="csContent">
							<p class="csTitle">상담시간</p>
							<p class="time">평일 09:00 - 18:00</p>
							점심시간 12:00 - 13:00, 주말/공휴일 휴무
							<p
								style="margin-top: 13px; display: block; font-size: 0.9em; color: #999;">*상담시간
								이외에는 답변이 늦어질 수 있습니다.</p>
						</div>
						<div class="csContent">
							<p class="csTitle">안내 및 유의사항</p>
							<ul class="csCaution">
								<li><a href="customer_frequently_asked_questions.html">자주묻는질문</a>을 확인하면 답변을 빨리 받을 수 있습니다.</li>
								<li>접수는 24시간 가능하지만, 답변은 09시 - 18시 사이에 순차적으로 받을 수 있습니다.</li>
								<li>문의취소는 접수상태에서만 가능합니다.</li>
							</ul>
						</div>
					</div>
				</div>
	</div>
</div>


<!-- 풋터 시작 -->
<jsp:include page="../inc/footer.jsp" />
</html>