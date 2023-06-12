<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>관리자페이지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">
    <link href="${pageContext.request.contextPath }/resources/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/vendor/chartist/css/chartist.min.css" rel="stylesheet">
    <!-- Datatable -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
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

		<!-- 바디 시작 -->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>안녕하세요</h4>
                            <p class="mb-0">관리자 페이지 입니다.</p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Layout</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Blank</a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-money text-success border-success"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">신고 카운트</div>
                                    <div class="stat-digit">${reportCount }</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-user text-primary border-primary"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">회원 수</div>
                                    <div class="stat-digit">${memberCount }</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-layout-grid2 text-pink border-pink"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">등록된 상품</div>
                                    <div class="stat-digit">${productCount }</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="stat-widget-one card-body">
                                <div class="stat-icon d-inline-block">
                                    <i class="ti-link text-danger border-danger"></i>
                                </div>
                                <div class="stat-content d-inline-block">
                                    <div class="stat-text">경매 수</div>
                                    <div class="stat-digit">${auctionCount }</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 차트 -->
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-lg-6 col-sm-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">상품 거래량</h4>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="barChart_1"></canvas>
                                    </div>
                                </div>
                            </div>
  							<div class="col-lg-6 col-sm-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">경매 거래량</h4>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="barChart_2"></canvas>
                                    </div>
                                </div>
                            </div>
                </div>

<!-- 도넛차트 -->
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-lg-6 col-sm-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">상품 카테고리별 분석</h4>
                                    </div>
                                    <div class="card-body">
    									<div id="piechart_3d" style="width: 700px; height: 500px;"></div>
									    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
									    <script type="text/javascript">
									      google.charts.load("current", {packages:["corechart"]});
									      google.charts.setOnLoadCallback(drawChart);
									      function drawChart() {
									        var data = google.visualization.arrayToDataTable([
									          ['상품카테고리', '상품카테고리'],
									          ["${productList[0].product_Lcategory}", ${productList[0].count}],
									          ["${productList[2].product_Lcategory}", ${productList[2].count}],
									          ["${productList[3].product_Lcategory}", ${productList[3].count}],
									          ["${productList[4].product_Lcategory}", ${productList[4].count}],
									          ["${productList[5].product_Lcategory}", ${productList[5].count}],
									          ["${productList[6].product_Lcategory}", ${productList[6].count}],
									        ]);
									
									        var options = {
									          title: '중고 상품 카테고리별 등록 수',
									          is3D: true,
									        };
									
									        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
									        chart.draw(data, options);
									      }
									    </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                 </div>

				<!-- 최근 신고 접수 내역 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">최근 문의 접수 내역</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>글번호</th>
                                                <th>작성자</th>
                                                <th>제목</th>
                                                <th>내용</th>
                                                <th>답변현황</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           	<c:forEach items="${askList }" var="askList">
	                                            <tr>
	                                                <td>${askList.asked_idx }</td>
	                                                <td>${askList.member_id }</td>
	                                                <td>${askList.asked_subject }</td>
	                                                <td>${askList.asked_content }</td>
	                                                <td>${askList.asked_status }</td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${askList.asked_status eq 'N' }">
			                                                	<button type="button" class="btn btn-primary" onclick="location.href='askedAnsForm?asked_idx=${askList.asked_idx}'">답변하기</button>
	                                                		</c:when>
	                                                		<c:otherwise>
			                                                	<button type="button" class="btn btn-primary" onclick="location.href='centerAskedDetail?asked_idx=${askList.asked_idx}'">답변확인하기</button>
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                            </tr>
                                           	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>글번호</th>
                                                <th>작성자</th>
                                                <th>제목</th>
                                                <th>내용</th>
                                                <th>답변현황</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-xl-4 col-xxl-6 col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">최근 입금 내역</h4>
                            </div>
                            <div class="card-body">
                                <div class="widget-timeline">
                                    <ul class="timeline">
                                        <li>
                                            <div class="timeline-badge primary"></div>
                                            <a class="timeline-panel text-muted" href="#">
                                                <span>10 minutes ago</span>
                                                <h6 class="m-t-5">000님 5000원 충전</h6>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-xxl-6 col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">음 여긴 뭐하지</h4>
                            </div>
                            <div class="card-body">
                                <div class="recent-comment m-t-15">
                                    <div class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object mr-3" src="${pageContext.request.contextPath }/resources/images/avatar/4.png" alt="..."></a>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading text-primary">양선정</h4>
                                            <p>배고파요</p>
                                            <p class="comment-date">10분전</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">처리해야할 일</h4>
                            </div>
                            <div class="card-body px-0">
                                <div class="todo-list">
                                    <div class="tdl-holder">
                                        <div class="tdl-content widget-todo2 mr-4">
                                            <ul id="todo_list">
                                                <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#'
                                                            class="ti-trash"></a></label></li>
                                                <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a
                                                            href='#' class="ti-trash"></a></label></li>
                                                <li><label><input type="checkbox"><i></i><span>Don't give up the
                                                            fight.</span><a href='#' class="ti-trash"></a></label></li>
                                                <li><label><input type="checkbox" checked><i></i><span>Do something
                                                            else</span><a href='#' class="ti-trash"></a></label></li>
                                                <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a
                                                            href='#' class="ti-trash"></a></label></li>
                                                <li><label><input type="checkbox"><i></i><span>Don't give up the
                                                            fight.</span><a href='#' class="ti-trash"></a></label></li>
                                            </ul>
                                        </div>
                                        <div class="px-4">
                                            <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-12 col-xxl-6 col-lg-6 col-md-12">
 
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="year-calendar"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">All Expense</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table student-data-table m-t-20">
                                        <thead>
                                            <tr>
                                                <th>Expense Type</th>
                                                <th>Amount</th>
                                                <th>Status</th>
                                                <th>Email</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>

                                                <td>
                                                    Salary
                                                </td>
                                                <td>
                                                    $2000
                                                </td>
                                                <td>
                                                    <span class="badge badge-primary">Paid</span>
                                                </td>
                                                <td>
                                                    edumin@gmail.com
                                                </td>
                                                <td>
                                                    10/05/2017
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    Salary
                                                </td>
                                                <td>
                                                    $2000
                                                </td>
                                                <td>
                                                    <span class="badge badge-warning">Pending</span>
                                                </td>
                                                <td>
                                                    edumin@gmail.com
                                                </td>
                                                <td>
                                                    10/05/2017
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    Salary
                                                </td>
                                                <td>
                                                    $2000
                                                </td>
                                                <td>
                                                    <span class="badge badge-primary">Paid</span>
                                                </td>
                                                <td>
                                                    edumin@gmail.com
                                                </td>
                                                <td>
                                                    10/05/2017
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    Salary
                                                </td>
                                                <td>
                                                    $2000
                                                </td>
                                                <td>
                                                    <span class="badge badge-danger">Due</span>
                                                </td>
                                                <td>
                                                    edumin@gmail.com
                                                </td>
                                                <td>
                                                    10/05/2017
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    Salary
                                                </td>
                                                <td>
                                                    $2000
                                                </td>
                                                <td>
                                                    <span class="badge badge-primary">Paid</span>
                                                </td>
                                                <td>
                                                    edumin@gmail.com
                                                </td>
                                                <td>
                                                    10/05/2017
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- 바디 시작 -->


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

    <script src="${pageContext.request.contextPath }/resources/vendor/chartist/js/chartist.min.js"></script>

    <script src="${pageContext.request.contextPath }/resources/vendor/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/pg-calendar/js/pignose.calendar.min.js"></script>


    <script src="${pageContext.request.contextPath }/resources/js/dashboard/dashboard-2.js"></script>
    <!-- Circle progress -->
    
    <!-- Chartjs -->
    <script src="${pageContext.request.contextPath }/resources/vendor/chart.js/Chart.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/plugins-init/chartjs-init.js"></script>
    
    <!-- Datatable -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/plugins-init/datatables.init.js"></script>
    
    <!-- Chart Morris plugin files -->
    <script src="${pageContext.request.contextPath }/resources/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/morris/morris.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/plugins-init/morris-init.js"></script>



</body>

</html>