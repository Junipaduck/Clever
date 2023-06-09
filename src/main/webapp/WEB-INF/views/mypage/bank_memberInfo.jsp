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
	<div id="">
	
            <div class="container text-center">
			  <div class="row">
			    <div class="col"></div>
			    <div class="col"><!-- 그리드 중간부분 시작 -->
			    
<!-- 				     <header class="header" role="banner" > -->
<!-- 				        <div class="header_inner"> -->
<%-- 				            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px;"></a> --%>
<!-- 				        </div> -->
<!-- 				     </header> -->
		
					<h1>${userInfo.user_name } 고객님의 계좌 목록(사용자 일련번호 : ${userInfo.user_seq_no })</h1>
				      <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
					    <div class="insert">
					    
					    <table>
						    <c:forEach items="${userInfo.res_list }" var="account">
							    <tr>
							        <td class="col1">계좌별칭</td>
							        <td class="col2"><input type="text" value="${account.account_alias }" readonly="readonly"></td>
							    </tr>
							    <tr>
							        <td class="col1">계좌번호</td>
							        <td class="col2">
										<input type="text" value="${account.account_num_masked }" readonly="readonly">							        
									</td>
							    </tr>
							    <tr>
							        <td class="col1">은행명</td>
							        <td class="col2">
										<input type="text" value="${account.bank_name }(${account.bank_code_std })" readonly="readonly">							        
							        </td>
							    </tr>
							    <tr>
							        <td class="col1">예금주명</td>
							        <td class="col2">
										<input type="text" value="${account.account_holder_name }" readonly="readonly">							        
							        </td>
							    </tr>
							     <tr>
							        <td class="col1">계좌상태</td>
							        <td class="col2">
										<input type="text" value="" readonly="readonly">							        
							        </td>
							    </tr>
							    <tr>
							        <td class="col1">핀테크이용번호</td>
							        <td class="col2">
										<input type="text" value="${account.fintech_use_num }" readonly="readonly">							        
							        </td>
							    </tr>
						    </c:forEach>
					    </table>
					    
					  </div>
					  <div class="create">
					  		<form action="bank_accountDetail" method="post">
		  						<input type="hidden" name="access_token" value="${sessionScope.access_token }">
								<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
								<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
								<input type="hidden" name="user_name" value="${userInfo.user_name }">
					        	<input class="but4" type="submit" value="계좌상세정보">
					  		</form>
					  </div>
					  </div>
				  
				  
			   </div> <!-- 그리드 중간부분 끝 -->
		    <div class="col"></div>
		  </div>
		</div>
    </div>
				  		

	<!-- 중간 작업공간 끝 ============================================================== -->
	
	
	
	
	
	
	<!-- 푸터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	<!-- js -->
	<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
	
	<!-- select 중복값 제거를 위한 script 상단 스크립트에 줄 시 적용안됨 -->
	<script>
	var foundedinputs = [];
	$("select[name=member_interest] option").each(function() {
  		if($.inArray(this.value, foundedinputs) != -1) $(this).remove();
  		foundedinputs.push(this.value);
	});
	// 	$("#member_interest option[value='${member.member_interest }']").remove();
	</script>	
	
		<!-- 계좌인증 -->
	<script type="text/javascript">
		$(function() {
			$("#btnAccountAuth").on("click", function() {
				let authWindow = window.open("about:blank", "authWindow", "width=500, height=700");
				authWindow.location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize"
					+ "?response_type=code"
					+ "&client_id=${client_id}"
					+ "&redirect_uri=http://localhost:8082/clever/callback" // 나중에 callback 주소 변경 요청
					+ "&scope=login inquiry transfer oob"
					+ "&state=12345678901234567890123456789012"
					+ "&auth_type=0";
				// 산업은행 - 222123456789 & 2팀 계좌인증 테스트 
			});
		});
	</script>
</body>
</html>