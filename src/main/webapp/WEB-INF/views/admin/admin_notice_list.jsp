<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
    <!-- Datatable -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

</head>
<script type="text/javascript">
	function deleteNotice(notice_idx){
		if(confirm("삭제 하시겠습니까?")){
			alert("삭제 성공!");
			location.href = "noticeDelete.ad?notice_idx=" + notice_idx
			return true;
		} else {
			alert("삭제 실패!");
			return false;
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
                            <h4>안녕하세요</h4>
                            <span class="ml-1">공지사항 조회 페이지입니다.</span>
                        </div>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">공지사항 조회</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>글번호</th>
                                                <th>제목</th>
                                                <th>내용</th>
                                                <th>등록일</th>
                                                <th>조회수</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           	<c:forEach items="${adminNoticeList }" var="noticeList">
	                                            <tr>
	                                                <td>${noticeList.notice_idx }</td>
	                                                <td>${noticeList.notice_title }</td>
	                                                <td>${noticeList.notice_content }</td>
	                                                <td>${noticeList.notice_date }</td>
	                                                <td>${noticeList.notice_readcount }</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-primary" onclick="location.href='noticeModifyForm.ad?notice_idx=${noticeList.notice_idx}'">수정하기</button>
	                                                </td>
	                                                <td>
	                                                	<form action="noticeDelete.ad">
	                                                		<button type="button" class="btn btn-primary" onclick="deleteNotice('${noticeList.notice_idx}')">삭제하기</button>
	                                                	</form>
	                                                </td>
	                                            </tr>
                                           	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>글번호</th>
                                                <th>제목</th>
                                                <th>내용</th>
                                                <th>등록일</th>
                                                <th>조회수</th>
                                                <th></th>
                                                <th></th>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
        <!--**********************************
            Content body end
        ***********************************-->


		<!-- footer 끝 -->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    </div>
    
	<!-- footer 시작 -->
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
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