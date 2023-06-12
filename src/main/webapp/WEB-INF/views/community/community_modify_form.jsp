<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항 수정</title>
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
                            <h4>안녕하세요</h4>
                            <p class="mb-0">공지사항 등록 페이지</p>
                        </div>
                    </div>
                </div>
                <!-- form 시작 -->
                        <div class="card" style="width: 900px;margin: auto;">
                            <div class="card-header">
                                <h4 class="card-title">공지사항</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="noticeModifyPro.ad" method="post">
                                    <input type="hidden" name="notice_idx" value="${param.notice_idx }">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">제목</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="${notice.notice_title }" name="notice_title">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">내용</label>
                                            <div class="col-sm-10">
		 										<div class="form-group">
		                                            <textarea class="form-control" rows="4" id="comment" name="notice_content" placeholder="${notice.notice_content }"></textarea>
		                                        </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">등록하기</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
            	</div>
		<!-- form 끝 -->
		
		
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

</body>

</html>







































