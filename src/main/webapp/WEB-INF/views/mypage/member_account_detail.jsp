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



 <style type="text/css">
 
      div.container{
    }
 
      div.insert{
    }
 
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
/*     border-bottom: 1px solid black; */
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 900px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 25px;
    width: 80px;
    color: white;
    background-color: #2445f0;
    border-color: #2445f0;
    }
 
    .but2 {
    height: 27px;
    width: 120px;
    color: white;
    background-color: #2445f0;
    border-color: #2445f0;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: #2445f0;
    border: 2px solid #2445f0;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
    .but1:hover {
    background-color: #2445f0;
    color: black;
    border: 2px solid #2445f0;
    }
 
    .but2:hover {
    background-color: #2445f0;
    color: black;
    border: 2px solid #2445f0;
    }
 
    .but3:hover {
    background-color: #2445f0;
    color: white;
    border: 2px solid #2445f0;
    }
 
    .but4:hover {
    background-color: #2445f0;
    color: white;
    border: 2px solid #2445f0;
    }
    
    .num{
    color: red;
    }
 
 	.accButton button {
    padding: 0px 0.5rem;
    height: 1.5rem;
    border-radius: 12px;
    text-align: center;
    font-size: 13px;
    color: rgb(255, 80, 88);
    background-color: rgb(244, 244, 250);
    border: none;
    outline: none;
	}
	.accButton button.active{
    color: #fff;
    background: rgb(255, 80, 88);
 	}
  </style>
  
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>


	<!-- 중간 작업공간 시작 ============================================================== -->
	<h1>확인용</h1>
				  		

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