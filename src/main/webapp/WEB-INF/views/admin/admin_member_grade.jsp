<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>회원 등급 관리</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
    <!-- Datatable -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

</head>
<script type="text/javascript">
	function upgradeGrade(member_idx, count, member_id, account_auth){
		if(account_auth == 'Y'){
			confirm(member_id + "회원의 계좌 인증 여부 : " + account_auth + "(계좌 인증 완료) 입니다. 등급을 올리시겠습니까?");
			location.href = "memberGradeUpdate.ad?member_id=" + member_id
		} else {
			alert("등업 기준 미충족! " + member_id + "회원은 계좌 미인증 상태입니다! 확인해주세요.");
		}
	}
</script>
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
        <div class="content-body" style="color: black;">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>회원 등급 관리</h4>
                            <span class="ml-1"></span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">회원관리</a></li>
                            <li class="breadcrumb-item active"><a href="adminMember.ad">회원목록</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">전체 회원목록</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>회원번호</th>
                                                <th>이름</th>
                                                <th>아이디</th>
                                                <th>적립금</th>
                                                <th>가입일</th>
                                                <th>등급</th>
                                                <th>상품판매량</th>
                                                <th>계좌인증여부</th>
                                                <th>등업</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${countList }" var="countList">
	                                            <tr>
	                                                <td>${countList.member_idx }</td>
	                                                <td>${countList.member_name }</td>
	                                                <td>${countList.member_id }</td>
	                                                <td>${countList.member_point }</td>
	                                                <td>${countList.member_date }</td>
	                                                <td>${countList.member_rank }</td>
	                                                <td>${countList.count }</td>
	                                                <td>${countList.account_auth }</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-primary" onclick="upgradeGrade('${countList.member_idx}', '${countList.count }', '${countList.member_id }', '${countList.account_auth }')">등업하기</button>
	                                                </td>
	                                            </tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>회원번호</th>
                                                <th>이름</th>
                                                <th>아이디</th>
                                                <th>적립금</th>
                                                <th>가입일</th>
                                                <th>등급</th>
                                                <th>상품판매량</th>
                                                <th>계좌인증여부</th>
                                                <th>등업</th>
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