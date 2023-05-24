<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클레버 - 회원가입</title>
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

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>

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
    
/*     p{ */
/*     font-size: 0.7em; */
/*     } */
 
/*     .g{ */
/*     font-size: 0.7em; */
/*     } */
 
/*     .c{ */
/*     font-size: 0.7em; */
/*     } */
 
/*     .a{ */
/*     font-size: 0.7em; */
/*     } */
    
    .num{
    color: red;
    }
 
  </style>
  
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
	
<!-- 주소 API 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("member_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("member_address").value = data.address; // 주소 넣기
                document.querySelector("input[name=member_address2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>	
	
	<!-- 중간 작업공간 시작 ============================================================== -->
	<div id="">
	
            <div class="container text-center">
			  <div class="row">
			    <div class="col"></div>
			    <div class="col"><!-- 그리드 중간부분 시작 -->
			    
				     <header class="header" role="banner" >
				        <div class="header_inner">
				            <a href="./"><img src="${pageContext.request.contextPath }/resources/images/CleverLogo2.png" width="250px;" height="80px;" style="margin-top: 50px;"></a>
				        </div>
				     </header>
		
	
					<form method="post" action="joinPro.me">
				      <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
					    <div class="insert">
					    
					    <table>
						    <tr>
						        <td class="col1">이름</td>
						        <td class="col2"><input type="text" id="member_name" name="member_name"  maxlength="5"></td>
						    </tr>
						    <tr>
						        <td class="col1">아이디</td>
						        <td class="col2">
						            <input type="text" id="member_id" name="member_id" maxlength="10">
						        </td>
						    </tr>
						    <tr>
						        <td class="col1">비밀번호</td>
						        <td class="col2">
						            <input type="password" id="member_passwd" name="member_passwd" maxlength="16">
						            <p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
						            10 ~ 16자리</span>로 입력이 가능합니다.</p>
						        </td>
						    </tr>
						    <tr>
						        <td class="col1">비밀번호 확인</td>
						        <td class="col2"><input type="password" id="member_passwd2" name="member_passwd2" maxlength="16"></td>
						    </tr>
						    <tr>
						        <td class="col1">이메일</td>
						        <td class="col2">
						            <input type="text" name="member_email">
						            <span class="a">@</span>
						            <input type="text" name="member_email2">
						            <select name="mailslc">
						                <option value="self" selected>직접입력</option>
						                <option value="naver">naver.com</option>
						                <option value="gm">gmail.com</option>
						                <option value="da">daum.com</option>
						                <option value="yah">yahoo.com</option>
						            </select>
						            <input class='but1' type="button" value="이메일인증" id="mail-Check-Btn">
						        </td>
						    </tr>
						     <tr>
						        <td class="col1">연락처</td>
						        <td class="col2">
							        <input type="text" id="member_phone" name="member_phone">
							        <input class='but1' type="button" value="인증하기" onclick="location.href='authPhone.ad'">
						        </td>
						    </tr>
						    <tr>
						        <td class="col1">생년월일</td>
						        <td class="col2">
						        	<input type="text" id="member_birth" name="member_birth"> <span class="a"> - </span><input type="text" id="member_birth2" name="member_birth2" style="width: 30px;">
							        <p>※생년월일은 <span class="num">주민번호 앞 6자리 - 주민번호 뒤 1자리</span>로 입력해주세요.</p>
						        </td>
						    </tr>
						    <tr>
						        <td class="col1">주소</td>
						        <td class="col2"><input type="text" id="member_address" name="member_address" placeholder="도로명주소 검색"><span class="a"> & </span><input type="text" id="member_address2" name="member_address2" placeholder="상세주소"></td>
						    </tr>
						    <tr>
						        <td class="col1">관심카테고리</td>
						        <td class="col2"><select name="member_interest" id="member_interest">
						            <option value="slc1" selected>선택</option>
						            <option value="의류/잡화">의류/잡화</option>
						            <option value="디지털/가전">디지털/가전</option>
						            <option value="도서/티켓/문구">도서/티켓/문구</option>
						            <option value="뷰티/미용">뷰티/미용</option>
						            <option value="식품">식품</option>
						            <option value="반려동물용품">반려동물용품</option>
						            <option value="기타">기타</option>
						        </select>
						    </tr>
					    </table>
					    
					  </div>
					 
					  <div class="create">
					        <input class="but4" type="submit" value="회원가입">
					  </div>
					  </div>
				  </form>
				  
				  
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
</body>
</html>