<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clever - 중고상품 등록</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!--부트스트랩-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">

<!--CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_selling_form.css?after">

<!-- 상세페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goods_product_detail.css">

<!-- 햄버거 메뉴 호버시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/goods/goods_selling_form.js?after"></script>
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2");
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
body {
font-family: 'SUITE-Regular';
}
.eHGbgX {
    width: 1.5rem;
    height: 1.5rem;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 12px 12px;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTYuODQ4IDZsMy43NzYtMy43NzZhLjYuNiAwIDEgMC0uODQ4LS44NDhMNiA1LjE1IDIuMjI0IDEuMzc2YS42LjYgMCAwIDAtLjg0OC44NDhMNS4xNTIgNiAxLjM3NiA5Ljc3NWEuNi42IDAgMSAwIC44NDguODQ5TDYgNi44NDhsMy43NzYgMy43NzZhLjU5OC41OTggMCAwIDAgMS4wMjQtLjQyNS42LjYgMCAwIDAtLjE3Ni0uNDI0TDYuODQ4IDZ6IiBvcGFjaXR5PSIuNjQiLz4KPC9zdmc+Cg==);
    background-color: rgba(30, 29, 41, 0.32);
    border-radius: 50%;
    position: absolute;
    top: 0.5rem;
    right: 0.5rem;
}
.iiYIYa {
    width: 202px; 
    height: 202px; 
    border: 1px solid rgb(230, 229, 239); 
    margin-right: 1rem; 
    margin-bottom: 1rem; 
    list-style-type: none; 
    position: relative;
    display: flex;
    cursor: pointer;
}

.preview_wrap {
	display: flex;
	}
.goods_Scategory {
display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    overflow-y: auto;
}

</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>    <!--메인 컨텐츠-->
        <div id="main_content">
            
            
 <!-- 신고양식css 시작 --------------------------------------------------------------------------------->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu:wght@300&family=Gowun+Dodum&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<style type="text/css">
#div-top {
	margin: auto;
	margin-top: 100px;
	text-align: center;
	width: 500px;
    height: 50px;
}

#h1-1 {
	font-family: 'Noto Sans KR', sans-serif;
}

#div-top2 {
	margin: auto;
	margin-bottom: 15px;
	text-align: left;
	width: 500px;
    height: 80px;
}

.table {
  table-layout:fixed;
/*   width:100%; */
  text-align:left;
  width: 300px;
  height: 300px;
  margin: auto;
}
.table th { 
  background:#ccc;
}
.table td, .table th {
  padding:10px 20px;
  border-top:1px solid #ccc;
  word-break:break-all
}
.table--min {
  min-width:500px;
}

#table1 {
background: #1A374D;
color: #fff;
/* 아래 2줄은 테이블 둥근모서리 표현하는 코드 */
/* border-top-left-radius: 15px; */
/* border-top-right-radius: 15px; */
}

.form-control, .custom-select {
  border: 2px solid #e9ecef;
  font-size: 16px;
  height: 100px;
  width: 460px;
  margin-top: 20px;
    }
  .form-control:active, .form-control:focus, .custom-select:active, .custom-select:focus {
    -webkit-box-shadow: none;
    box-shadow: none; }
    
    
.btn {
  padding-top: 12px;
  padding-bottom: 12px;
  padding-left: 188px;
  padding-right: 188px;
  border-radius: 30px;
  font-size: 20px; }
  .btn:active, .btn:focus {
    outline: none;
    -webkit-box-shadow: none;
    box-shadow: none; }
  .btn.btn-primary {
   background: #ff9507;
   border-color: #ff9507;
	color: #fff;
    margin-top: 30px;
    margin-bottom: 200px;
   }
    .btn.btn-primary:hover {
     background: #1A374D;
	color: #fff; }
	

@media screen and (max-width:768px) {
  /*normal*/
  .table-box {
  overflow-x:auto;
  }
}
</style>
<!-- 신고양식 css끝 --------------------------------------------------------------------------------------->

</head>
<body>





<!-- 신고양식 html 시작 --------------------------------------------------------------------------------- -->
	<div id="div-top">
		<h2 id="h1-1">가게 신고하기</h2>
	</div>
	<div id="div-top2">
		<hr>
		작성자 ID |　${sessionScope.sId}<br>
		<hr>
			<small id="small" class="form-text text-muted">* 타당한 근거 없이 신고된 내용은 관리자 확인 후 반영되지 않을 수 있습니다. </small>
	</div>

  <div class="table-box">
  	<form action="productReportPro" name="productReportPro" method="POST" enctype="multipart/form-data">
  	<input type="hidden" name="product_idx" value="${param.product_idx}" />
		    <table class="table table--min" cellspacing="0" cellpadding="0">
		      <thead>
		      <tr>
		        <th style="width:10%; background-color: #ff9507;" id="table1">신고하는 사유를 선택해주세요. (택1 필수)</th>
		      </tr>
		      </thead>
		      <tbody>
		      <tr>
		        <td>
		        	<input type="radio" id="report_content1" value="뭐임" name="report_content"><label for="report_content1">　뭐임</label>
				</td>
		      </tr>
		      <tr>
		      	<td>
		       		<input type="radio" id="report_content2" value="불법, 음란, 선정성 등 부적절한 홍보 또는 광고" name="report_content"><label for="report_content2">　불법, 음란, 선정성 등 부적절한 홍보 또는 광고</label>
		      	</td>
		      </tr>
		      <tr>
		     	 <td>
		       		 <input type="radio" id="report_content3" value="관련없는 내용, 사진 게시" name="report_content"><label for="report_content3">　관련없는 내용, 사진 게시</label>
		     	 </td>
		      </tr>
		       <tr>
		       	<td>
		       	   <input type="radio" id="report_content4" value="가게 취지에 맞지 않는 내용44" name="report_content"><label for="report_content4">　가게 취지에 맞지 않는 내용44</label>
		       	</td>
		      </tr>
		       <tr>
		       	<td>
		       	   <input type="radio" id="report_content5" value="저작권 도용 의심(사진 등)" name="report_content"><label for="report_content5">　저작권 도용 의심(사진 등)</label>
		       	</td>
		      </tr>
		       <tr>
		       	<td>
		       	   <input type="radio" id="report_content6" value="개인정보 유출 위험" name="report_content"><label for="report_content6">　개인정보 유출 위험</label>
		       	</td>
		      </tr>
		       <tr>
		        <td>
<!-- 		           <input type="radio" id="report_content5" value="기타" name="report_content"><label for="report_content5">　기타 (신고사유를 증명할 파일을 첨부해주세요.)</label> -->
<!-- 		        	<textarea name="" class="form-control" id="message" name="report_content" cols="30" rows="5" placeholder="신고사유를 직접 작성해주세요."></textarea><br> -->
<!-- 		            <input type="file" name="file"> -->
		        	<button type="submit" class="btn btn-primary" style="background-color: #ff9507;">신고하기</button> <!-- 클릭 시 "신고접수가 완료되었습니다." 알림창 띄우고 홈으로 이동 -->
		        </td>
		      </tr>
		      </tbody>
		    </table>
		</form>
  </div>
 <!-- 신고양식 html 끝 --------------------------------------------------------------------------------->
 
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer></body>
</html>