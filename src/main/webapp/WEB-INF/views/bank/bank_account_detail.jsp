<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>관리자 계좌 상세 정보</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath }/resources/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
<style type="text/css">
.form-control{
	resize: none;
}
</style>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

		<!-- 네비게이션 헤더 시작 -->
		<header>
			<jsp:include page="../inc/admin_nav_header.jsp"></jsp:include>
		</header>
		<!-- 네비게이션 헤더 끝 -->

		<!-- 상단 헤더 시작 -->
        <header>
			<jsp:include page="../inc/admin_header.jsp"></jsp:include>
        </header>
		<!-- 상단 헤더 끝 -->


		<!-- 사이드바 시작 -->
		<header>
			<jsp:include page="../inc/admin_sidebar.jsp"></jsp:include>
		</header>
		<!-- 사이드바 끝 -->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>계좌 상세정보</h4>
                            <p class="mb-0">${user_name } 고객님의 계좌 상세정보</p>
                        </div>
                    </div>
                </div>
                <!-- form 시작 -->
                        <div class="card" style="width: 900px;margin: auto;">
                            <div class="card-header">
                                <h4 class="card-title">관리자</h4>
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
                                            <label class="col-sm-2 col-form-label">계좌번호</label>
                                            <div class="col-sm-10">
                                            	<input type="text" class="form-control" placeholder="${account_num_masked }" readonly="readonly">
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
                                            	<input type="text" class="form-control" placeholder="${admin.member_balance }원" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">출금가능금액</label>
                                            <div class="col-sm-10">
                                            	<input type="text" class="form-control" placeholder="${admin.member_balance }원" readonly="readonly">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
            	</div>
		<!-- form 끝 -->
		
				&nbsp;&nbsp;&nbsp;
<!--                 form 시작 -->
<!--                         <div class="card" style="width: 900px;margin: auto;"> -->
<!--                             <div class="card-header"> -->
<!--                                 <h4 class="card-title">송금정보</h4> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
<!--                                 <div class="basic-form"> -->
<!--                                     <form action="bank_withdraw" method="post"> -->
<%--                                     <input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> --%>
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">예금주명</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_name" placeholder="예금주명"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">은행코드</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_bank_code" placeholder="은행코드"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">계좌번호</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_account_num" placeholder="계좌번호"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">핀테크이용번호</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_fintech_use_num" placeholder="핀테크이용번호"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">송금할 금액</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="tran_amt" placeholder="송금할 금액"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                                 <button type="submit" class="btn btn-primary">송금(출금이체)</button> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </form> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--             	</div> -->
<!-- 		<!-- form 끝 --> -->
<!-- 				&nbsp;&nbsp;&nbsp; -->
<!--                 form 시작 -->
<!--                         <div class="card" style="width: 900px;margin: auto;"> -->
<!--                             <div class="card-header"> -->
<!--                                 <h4 class="card-title">입금 대상 정보</h4> -->
<!--                             </div> -->
<!--                             <div class="card-body"> -->
<!--                                 <div class="basic-form"> -->
<!--                                     <form action="bank_deposit" method="post"> -->
<%--                                     <input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }"> --%>
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">예금주명</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_name" placeholder="예금주명"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">은행코드</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_bank_code" placeholder="은행코드"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">계좌번호</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_account_num" placeholder="계좌번호"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">핀테크이용번호</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="recv_client_fintech_use_num" placeholder="핀테크이용번호"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <label class="col-sm-2 col-form-label">송금할 금액</label> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                             	<input type="text" class="form-control" name="tran_amt" placeholder="송금할 금액"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="form-group row"> -->
<!--                                             <div class="col-sm-10"> -->
<!--                                                 <button type="submit" class="btn btn-primary">송금(출금이체)</button> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </form> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--             	</div> -->
<!-- 		<!-- form 끝 --> -->
		
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- footer 시작 -->
		<footer>
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
		</footer>
		<!-- footer 끝 -->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="${pageContext.request.contextPath }/resources/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/custom.min.js"></script>
    

    <!-- Summernote -->
    <script src="${pageContext.request.contextPath }/resources/vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="${pageContext.request.contextPath }/resources/js/plugins-init/summernote-init.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js?after"></script>

	<!-- 계좌인증 -->
	<script type="text/javascript">
		$(function() {
			$("#btnAccountAuth").on("click", function() {
				let authWindow = window.open("about:blank", "authWindow", "width=500, height=700");
				authWindow.location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize"
					+ "?response_type=code"
					+ "&client_id=${client_id}"
					+ "&redirect_uri=http://localhost:8082/clever/callback" // 나중에 callback 주소 변경 요청
					+ "&scope=login inquiry transfer oob"
					+ "&state=12345678901234567890123456789012"
					+ "&auth_type=0";
				// 산업은행 - 222123456789 & 2팀 계좌인증 테스트 
			});
		});
	</script>
</body>

</html>



























































































