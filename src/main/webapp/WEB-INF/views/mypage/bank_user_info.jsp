<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 바로구매</title>
<!-- 파비콘 -->
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
<!-- customer_center 외부 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/board_list.jo112.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/footer.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/header.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/unit_csboard_top2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/faq.css">
 
 <style type="text/css">
 .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    margin:auto;
    display: block;
 }
 
 .but4:hover {
    background-color: #2445f0;
    color: white;
    border: 2px solid #2445f0;
    }
 </style>
 </head>
<body>

	<div class="container text-center">
	<h1>　</h1>
	</div>
	<div class="container text-center">
	<h1>${userInfo.user_name } 고객님의 계좌 목록</h1> <!-- (사용자 일련번호 : ${userInfo.user_seq_no }) -->
	</div>
			
	<div class="bbs-table-list">
						<!-- 자주묻는 질문 시작 -->
						<div id="faqWrap">
							<div class="page-body">
								<div id="faqTable">
									<table >
										<thead>
											<tr>
												<th scope="col">
													<div class="tb-center">계좌 이름</div>
												</th>
												<th scope="col">
													<div class="tb-center">계좌번호</div>
												</th>
												<th scope="col">
													<div class="tb-center">은행명</div>
												</th>
												<th scope="col">
													<div class="tb-center">예금주 명</div>
												</th>
												<th scope="col">
													<div class="tb-center"></div>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${userInfo.res_list }" var="account">
												<tr uid="6">
													<td>
														<div class="tb-center"><input type="text" value="${account.account_alias }" readonly="readonly" style="text-align:center; border:none;"></div>
													</td>
													<td>
														<div class="tb-center"><input type="text" value="${account.account_num_masked }" readonly="readonly" style="text-align:center; border:none;">	</div>
													</td>
													<td>
														<div class="tb-center"><input type="text" value="${account.bank_name }(${account.bank_code_std })" readonly="readonly" style="text-align:center; border:none;"></div>
													</td>
													<td>
														<div class="tb-center"><input type="text" value="${account.account_holder_name }" readonly="readonly" style="text-align:center; border:none;">	</div>
													</td>
													<td>
														<form action="auction_bank_accountDetail" method="post">
														  	<input type="hidden" name="access_token" value="${sessionScope.access_token }">
															<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
															<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
															<input type="hidden" name="user_name" value="${userInfo.user_name }">
															<input type="hidden" name="auction_idx" value="${param.auction_idx }">
															<input type="hidden" name="auction_final_price" value="${param.auction_final_price }">
															<input class="but4" type="submit" value="계좌상세정보">
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
				</div>            
            
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>