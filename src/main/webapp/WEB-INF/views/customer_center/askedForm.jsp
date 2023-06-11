<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>클레버 - 1:1 문의작성</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/market_my_store.css">

<!-- customer_center 외부 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/board_list.jo112.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/footer.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/header.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/unit_csboard_top2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_center/faq.css">

<!-- 웹에디터 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css"/>


</head>
<body>
<!-- 헤더 시작 -->
<header>
	<jsp:include page="../inc/header.jsp" />
</header>


<div id="contentWrapper">
	<div id="main_content">
		<div style="display: flex; justify-content: space-between; margin: 183px 0 0 0; align-items: center">
			<div class="log-tit animated con-tit">
				<p>1 : 1 문의 작성하기</p>
			</div>
		</div>
		<form action="askedFormPro" method="post">
			<div class="asked_title_area">
				<div class="asked_title" style="position: relative;">
				<input type="text" name="asked_subject" id="asked_subject" placeholder="제목을 입력해주세요." style="width: 700px; height: 3rem; padding: 0px 1rem; border: 1px solid rgb(195, 194, 204); margin-bottom: 20px;">
				</div>
			</div>
			<textarea id="summernote" name="editordata"></textarea>
			<div class="btn_submit_area">
		        <div class="inner_submit" >
		            <input type="submit" value="문의하기" style="height: 3.5rem; width: 10rem; color: rgb(255, 255, 255); font-size: 20px; border: none; background: rgb(255, 80, 88); position: relative; margin-top: 20px; margin-left: 426px;">
		        </div>
	    	</div>
		</form>
		
		
		<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height: 300,                 // 에디터 높이
				width: 1000,
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '문의 내용을 작성해주세요.'	//placeholder 설정
			});
			
		// 	// 서머노트에 text 쓰기
		// 	$('#summernote').summernote('insertText', '');
		
		
		// 	// 서머노트 쓰기 비활성화
		// 	$('#summernote').summernote('disable');
		
		// 	// 서머노트 쓰기 활성화
		// 	$('#summernote').summernote('enable');
		
		
		// 	// 서머노트 리셋
		// 	$('#summernote').summernote('reset');
		
		
		// 	// 마지막으로 한 행동 취소 ( 뒤로가기 )
		// 	$('#summernote').summernote('undo');
		// 	// 앞으로가기
		// 	$('#summernote').summernote('redo');
		});
		</script>
	</div>
</div>


<script src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>

</body>
</html>