<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 1:1문의 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_inquiry.css">
<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">
</head>
<body>
   <a id="skipNav" href="#main_content">본문 바로가기</a>
	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	<!-- main_content 영역 -->

    <header>
        <div>
            <div>
                <a href="customer_service.html">
                    <i class="bi bi-chevron-left"></i>
                </a>
            </div>
            <div>
                <a href="customer_contact.html">
                    문의하기
                </a>
            </div>
        </div>
    </header>

    <div id="wrapper">
        <div id="title">
            1:1 문의
        </div>

        <div id="content">
            <div>
                <img src="${pageContext.request.contextPath }/resources/images/customer_service/poster.png" alt="포스터">
                <p>
                    문의내역이 없습니다.
                </p>
            </div>
        </div>

        <hr>

        <div id="precautions">
            <p>
                유의사항
            </p>
            <div>
                <p>・ <a href="customer_frequently_asked_questions.html">자주묻는질문</a>을 확인하면 답변을 빨리 받을 수 있어요.</p>
                <p>・ 접수는 24시간 가능하지만,<br>
                    답변은 9시 - 18시 사이에 순차적으로 받을 수 있어요.</p>
                <p>・ 문의취소는 접수상태에서만 가능해요.</p>
            </div>
            <div>
                전화문의 
            </div>
        </div>
    </div>
	<!-- 풋터 시작 -->
	<jsp:include page="footer.jsp" />
</body>
</html>