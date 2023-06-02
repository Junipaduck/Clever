<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>계좌 목록 조회</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
    <!-- Datatable -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

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

		<c:choose>
			<c:when test="${empty sessionScope.sId }">
				<script type="text/javascript">
					alert("로그인 후 사용 가능합니다.");
					location.href = "./";
				</script>
			</c:when>
			<c:when test="${empty sessionScope.access_token }">
				<script type="text/javascript">
					alert("계좌인증 후 사용 가능합니다.");
					location.href = "adminInfo.ad";
				</script>
			</c:when>
		</c:choose>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>클레버 계좌 조회</h4>
                            <span class="ml-1">${userInfo.user_name } 고객님의 계좌 목록(사용자 일련번호 : ${userInfo.user_seq_no })</span>
                        </div>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">${userInfo.user_name } 고객님의 계좌 목록(사용자 일련번호 : ${userInfo.user_seq_no })</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>계좌별칭</th>
                                                <th>계좌번호</th>
                                                <th>은행명</th>
                                                <th>예금주명</th>
                                                <th>계좌상태</th>
                                                <th>핀테크이용번호</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${userInfo.res_list }" var="account">
	                                            <tr>
	                                                <td>${account.account_alias }</td>
	                                                <td>${account.account_num_masked }</td>
	                                                <td>${account.bank_name }(${account.bank_code_std })</td>
	                                                <td>${account.account_holder_name }</td>
	                                                <td>공백</td>
	                                                <td>${account.fintech_use_num }</td>
	                                                <td>
										                <form action="bank_accountDetail" method="post">
															<input type="hidden" name="access_token" value="${sessionScope.access_token }">
															<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
															<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
															<input type="hidden" name="user_name" value="${userInfo.user_name }">
															<button type="submit" class="btn btn-primary">상세조회</button>
<!-- 															<input type="submit" value="상세조회"> -->
														</form>
	                                                </td>
	                                            </tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>계좌별칭</th>
                                                <th>계좌번호</th>
                                                <th>은행명</th>
                                                <th>예금주명</th>
                                                <th>계좌상태</th>
                                                <th>핀테크이용번호</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
        <!--**********************************
            Content body end
        ***********************************-->


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
    


    <!-- Datatable -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/plugins-init/datatables.init.js"></script>

</body>

</html>