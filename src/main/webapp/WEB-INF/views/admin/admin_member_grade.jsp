<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>회원 목록 조회</title>
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

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>전체 회원 목록 조회</h4>
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
                                                <th>등급 레벨</th>
                                                <th>등급 이름</th>
                                                <th>등급 이미지</th>
<!--                                                 <th>연락처</th> -->
<!--                                                 <th>주소</th> -->
<!--                                                 <th>생년월일(성별)</th> -->
<!--                                                 <th>이메일</th> -->
<!--                                                 <th>관심분야</th> -->
<!--                                                 <th>등급</th> -->
<!--                                                 <th>포인트</th> -->
<!--                                                 <th>가입일</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${memberGradeList }" var="memberGradeList">
	                                            <tr>
	                                                <td>${memberGradeList.grade_idx }</td>
	                                                <td>${memberGradeList.grade_name }</td>
	                                                <td></td>
	                                                <td>
	                                                	<button type="button" class="btn btn-primary" onclick="">수정하기</button>
	                                                </td>
	                                                <td>
	                                                	<form action="gradeDelete.ad">
	                                                		<button type="button" class="btn btn-primary" onclick="">삭제하기</button>
	                                                	</form>
	                                                </td>
<%-- 	                                                <td>${memberList.member_id }</td> --%>
<%-- 	                                                <td>${memberList.member_phone }</td> --%>
<%-- 	                                                <td>${memberList.member_address }</td> --%>
<%-- 	                                                <td>${memberList.member_birth }</td> --%>
<%-- 	                                                <td>${memberList.member_email }</td> --%>
<%-- 	                                                <td>${memberList.member_interest }</td> --%>
<%-- 	                                                <td>${memberList.member_rank }</td> --%>
<%-- 	                                                <td>${memberList.member_point }</td> --%>
<%-- 	                                                <td>${memberList.member_date }</td> --%>
	                                            </tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <div>
                                    <button type="button" class="btn btn-primary" onclick="admin">등급 생성</button>
                                    </div>
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