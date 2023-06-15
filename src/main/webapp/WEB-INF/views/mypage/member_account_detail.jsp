<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 목록 조회</title>
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

</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>


	<!-- 중간 작업공간 시작 ============================================================== -->
	<div class="container text-center">
	<h1>　</h1>
	</div>
	
	
	 <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="">
                        <div class="container text-center">
                            <h4>계좌 상세정보</h4>
                            <p class="mb-0">${user_name } 고객님의 계좌 상세정보</p>
                        </div>
                    </div>
                </div>
                <div class="container text-center">
				<h1>　</h1>
				</div>
                <!-- form 시작 -->
                        <div class="card" style="width: 900px;margin: auto;">
                            <div class="card-header">
                                <h4 class="card-title">${account_num_masked } 계좌 정보</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="goodsRegisterPro.ad" method="post">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">은행명</label>
                                            <div class="col-sm-10">
                                            	<input type="text" class="form-control" placeholder="${account.bank_name }" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">상품명</label>
                                            <div class="col-sm-10">
                                            	<input type="text" class="form-control" placeholder="${account.product_name }" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">계좌잔액</label>
                                            <div class="col-sm-10">
                                            	<input type="text" class="form-control" placeholder="${member.member_balance }원" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">출금가능금액</label>
                                            <div class="col-sm-10">
                                            	<input type="text" class="form-control" placeholder="${member.member_balance }원" readonly="readonly">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
            	</div>
		<!-- form 끝 -->
		
				&nbsp;&nbsp;&nbsp;
            	</div>
				  		
	
	<div class="container text-center">
	<h1>　</h1>
	</div>





	<!-- 중간 작업공간 끝 ============================================================== -->
		
	<!-- 푸터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	<!-- js -->
	<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
		
</body>
</html>