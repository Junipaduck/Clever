<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>경매 등록 승인 페이지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
    <!-- Datatable -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">

</head>
<script type="text/javascript">
function Auth(auction_idx) {
	
	if(confirm("경매 상품 등록을 승인 하시겠습니까?")) {
		alert("승인 성공");
		location.href = "auctionAuthPro.ad?auction_idx=" + auction_idx
		return true;
	} else {
		alert("승인 실패");
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
                            <span class="ml-1">경매 현황 조회 페이지입니다.</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Table</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Datatable</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">경매 목록</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>경매번호</th>
                                                <th>아이디</th>
                                                <th>상품명</th>
                                                <th>상품설명</th>
                                                <th>상품사진</th>
                                                <th>경매 시작일</th>
                                                <th>경매 종료일</th>
                                                <th>경매 상태</th>
                                                <th>즉시구매가</th>
                                                <th>관리자 승인 여부</th>
                                                <th>등록 승인 하기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           	<c:forEach items="${auctionAuthList }" var="auctionAuthList">
	                                            <tr>
	                                                <td>${auctionAuthList.auction_idx }</td>
	                                                <td>${auctionAuthList.member_id }</td>
	                                                <td>${auctionAuthList.auction_title }</td>
	                                                <td>${auctionAuthList.auction_content }</td>
	                                                <td>
	                                                	<c:forEach items="${fileList }" var="file">
<%-- 								                        <c:set var="length" value="${fn:length(file.file_name) }" /> --%>
<%-- 														<c:set var="index" value="${fn:indexOf(file.file_name, '_') }" /> --%>
<%-- 														<c:set var="file_name" value="${fn:substring(file.file_name, index + 1, length) }" /> --%>
								                            <c:if test="${file.file_num eq auctionAuthList.auction_idx }">
									                            <div class="goods_image">
	                                								<img src="${pageContext.request.contextPath }/resources/fileUpload${file.file_path}/${file.file_name}" width="194" height="194" alt="상품 이미지">
									                            </div>
								                            </c:if>
								                        </c:forEach>
	                                                </td>
	                                                <td>${auctionAuthList.auction_start }</td>
	                                                <td>${auctionAuthList.auction_end }</td>
	                                                <td>${auctionAuthList.auction_status }</td>
	                                                <td>${auctionList.immediately_price }</td>
	                                                <td>${auctionAuthList.auction_auth_status }</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-primary" onclick="Auth('${auctionAuthList.auction_idx}')">승인하기</button>
	                                                </td>	
	                                            </tr>
                                           	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>경매번호</th>
                                                <th>아이디</th>
                                                <th>상품명</th>
                                                <th>상품설명</th>
                                                <th>상품사진</th>
                                                <th>경매 시작일</th>
                                                <th>경매 종료일</th>
                                                <th>경매 상태</th>
                                                <th>즉시구매가</th>
                                                <th>관리자 승인 여부</th>
                                                <th>등록 승인 하기</th>
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