<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내상점 제재내역</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 내상점 제재내역 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_sanctions_details.css">
<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">
</head>
<body>
	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	<div id="wrapper">
        <div id="title">
            내상점 제재내역
        </div>

        <div id="sub_title">
            상점명은<br>
            <span>정상운영</span>되고있어요
        </div>

        <div id="content">
            <div>
                <img src="${pageContext.request.contextPath }/resources/images/customer_service/poster.png" alt="포스터">
                <p>멋지네요!</p>
                <p>
                    내상점은 제재 내역이 없어요.
                </p>
            </div>
        </div>

        <hr>

        <div id="precautions">
            <p>
                유의사항
            </p>
            <div>
                <p>・ 번개장터에서는 <span>3</span>아웃 정책을 실시하고 있어요. 자세한 운영정책을 확인하세요. <span><a href="customer_operational_policy.html">번개장터 운영정책</a></span></p>
                <p>・ 운영정책 위반이 확인되면 사전 안내 없이 서비스 사용이 한시적 또는 영구적으로 제한될 수 있어요.</p>
                <p>・ 영구차단의 경우, 문제해결이 되어야 해제가 가능해요.</p>
            </div>
            <div>
                <a href="customer_contact.html">1:1 문의</a><span>|</span> 전화문의 
            </div>
        </div>
    </div>
	<!-- 풋터 시작 -->
	<jsp:include page="footer.jsp" />
</body>
</html>