<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 고객센터 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_service_common.css">
<!-- 문의하기 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_contact.css">
<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!-- 화면 스크롤시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/customer_service/top_show_name.js"></script>

<!-- 이미지 추가 -->
<script src="${pageContext.request.contextPath }/resources/js/customer_service/customer_contact.js"></script>
<script>
        function close() {
            $('#click_choice').css('display', 'none');
            $('.sub_choice_click').css('display', 'none');
            $('#bg_color').css('display', 'none');
            $('html').css('overflowY', 'visible');
            $('body').css('overflowY', 'visible');
        }

        $(document).ready(function(){
            /* 유형 선택 박스 클릭시 메뉴들 표시, y스크롤 고정 */
            $('#choice > div').click(function () {
                $('#click_choice').css('display', 'block');
                $('#bg_color').css('display', 'block');
                $('html').css('overflowY', 'hidden');
                $('body').css('overflowY', 'hidden');
            });

            /* 배경 클릭시 닫힘  유형, 상세 유형 모두 포함 */
            $('#bg_color').click(function () {
                close();
            });
            
            /* 유형 선택시 배경꺼짐, Text 변경 및 서브 유형창 표시 */
            $('#click_choice > p').click(function () {
                document.querySelector("#choice > div > p").innerText = this.innerText;
                close();
                $('#sub_choice').css('display', 'block');
                
                /* 유형 변경 시 상세유형 리셋 */
                document.querySelector("#sub_choice > div > p").innerText = "상세 유형을 선택해주세요";
                $("#sub_choice > div > p").css("color", "#B2B2B2");

                $('#click_choice > p').css('color', '#CCC');
                $(this).css('color', '#D80C18');
                $('#choice > div > p').css('color', 'black');

                document.querySelector('#click_choice > p').addEventListener('mouseover', function() {
                    document.querySelector('#click_choice > p').setAttribute('class', 'hover');
                })
            });


            /* 상세 유형 선택시 배경꺼짐, Text 변경 */
            $('.sub_choice_click > p').click(function () {
                document.querySelector("#sub_choice > div > p").innerText = this.innerText;
                close();
                $('.sub_choice_click > p').css('color', '#CCC');
                $(this).css('color', '#D80C18');
                $('#sub_choice > div > p').css('color', 'black');

                document.querySelector('#click_choice > p').addEventListener('mouseover', function() {
                    document.querySelector('#click_choice > p').setAttribute('class', 'hover');
                })
            });

            /* 상세 유형 박스 클릭, y스크롤 고정 */
            /* 거래 신고 */

            function all_close() {
                $('.trade').css('display', 'none');
                $('.mem').css('display', 'none');
                $('.pay').css('display', 'none');
                $('.care').css('display', 'none');
                $('.shop').css('display', 'none');
                $('.sell').css('display', 'none');
                $('.etc').css('display', 'none');
                $('.error').css('display', 'none');
            }

            function y_hidden() {
                $('#bg_color').css('display', 'block');
                $('html').css('overflowY', 'hidden');
                $('body').css('overflowY', 'hidden');
            }

            $('#sub_choice > div').click(function () {
                if(document.querySelector("#choice > div > p").innerText == "거래신고") {
                    all_close();
                    $('.trade').css('display', 'block');
                    y_hidden();

                }else if(document.querySelector("#choice > div > p").innerText == "회원/계정") {
                    all_close();
                    $('.mem').css('display', 'block');
                    y_hidden();

                }else if(document.querySelector("#choice > div > p").innerText == "번개페이(안전결제)") {
                    all_close();
                    $('.pay').css('display', 'block');
                    y_hidden();

                }else if(document.querySelector("#choice > div > p").innerText == "번개케어") {
                    all_close();
                    $('.care').css('display', 'block');
                    y_hidden();
                    
                }else if(document.querySelector("#choice > div > p").innerText == "프로상점") {
                    all_close();
                    $('.shop').css('display', 'block');
                    y_hidden();
                    
                }else if(document.querySelector("#choice > div > p").innerText == "판매광고") {
                    all_close();
                    $('.sell').css('display', 'block');
                    y_hidden();
                    
                }else if(document.querySelector("#choice > div > p").innerText == "기타 서비스") {
                    all_close();
                    $('.etc').css('display', 'block');
                    y_hidden();
                    
                }else {
                    all_close();
                    $('.error').css('display', 'block');
                    y_hidden();
                }
            });
        });
    </script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="./inc/header.jsp" />
	</header>    <header>
        <div>
            <a href="customer_inquiry.html">
                <i class="bi bi-chevron-left"></i>
            </a>
            <div id="top_menu_name">
                1:1 문의하기
            </div>
            <div id="cancel">
                <a href="customer_inquiry.html">
                    취소
                </a>
            </div>
        </div>
    </header>

    <!-- wrapper 영역 -->
    <div id="wrapper">
        <div>
            <h1>1:1 문의하기</h1>
        </div>

        <form action="#" method="get" id="inquiry" name="inquiry">
            <div id="choice">
                <p>유형선택 <i class="bi bi-record-fill"></i></p>
                <div>
                    <p>유형을 선택해주세요 </p><i class="bi bi-chevron-down"></i>
                </div>
            </div>

            <div id="sub_choice">
                <p>상세유형 선택 <i class="bi bi-record-fill"></i></p>
                <div>
                    <p>상세 유형을 선택해주세요 </p><i class="bi bi-chevron-down"></i>
                </div>
            </div>
            
            <div id="inquiry_content">
                <p>문의내용 <i class="bi bi-record-fill"></i></p>
                <textarea placeholder="문의 내용을 자세히 입력해주세요."></textarea>
            </div>

            <div id="add_img">
                <p>사진첨부 (<span id="up_num">0</span>/3)</p>
                <p>사진을 첨부하면 정확한 답변을 받을 수 있어요.</p>
                <div class="container text-center">
                    <div class="row">
                        <div class="col image_box">
                            <div>
                                <input type="file" class="file img_file1" name="file1" accept="image/*" onchange="changeValue(this)">
                                <img src="${pageContext.request.contextPath }/resources/images/customer_service/plus.svg" alt="사진추가" class="img_upload upload1" >
                            </div>
                        </div>
                        <div class="col image_box">
                            <div>
                                <input type="file" class="file img_file2" name="file2" accept="image/*" onchange="changeValue(this)">
                                <img src="${pageContext.request.contextPath }/resources/images/customer_service/plus.svg" alt="사진추가" class="img_upload upload2">
                            </div>
                        </div>
                        <div class="col image_box">
                            <div>
                                <input type="file" class="file img_file3" name="file3" accept="image/*" onchange="changeValue(this)">
                                <img src="${pageContext.request.contextPath }/resources/images/customer_service/plus.svg" alt="사진추가" class="img_upload upload3">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="inquiry_btn">
                <button>
                    문의하기
                </button>
            </div>
        </form>
    </div>
    <!-- // wrapper 영역 -->

    <!-- 문의하기 유형 선택시 메뉴 -->
    <div id="bg_color" class="opacity-50"></div>
    <div id="click_choice">
        <p class="choice_trade" id="trade">거래신고</p>
        <p class="choice_member" id="mem">회원/계정</p>
        <p class="choice_pay" id="pay">번개페이(안전결제)</p>
        <p class="choice_care" id="care">번개케어</p>
        <p class="choice_shop" id="shop">프로상점</p>
        <p class="choice_sell" id="sell">판매광고</p>
        <p class="choice_etc" id="etc">기타 서비스</p>
        <p class="choice_error" id="error">오류/신고/제안</p>
    </div>

    <div class="sub_choice_click trade">
        <p>판매자신고(미발송)</p>
        <p>상태불량</p>
        <p>구매자신고(미입금)</p>
        <p>안전결제 허위매물</p>
    </div>
    <div class="sub_choice_click mem">
        <p>계정차단</p>
        <p>로그인/본인인증</p>
        <p>기타</p>
    </div>
    <div class="sub_choice_click pay">
        <p>정산일정</p>
        <p>취소/반품</p>
        <p>기타</p>
    </div>
    <div class="sub_choice_click care">
        <p>정품 검수(명품/스니커즈)</p>
        <p>기능 검수(스마트폰)</p>
        <p>추가 서비스(폴리싱/슈클린)</p>
    </div>
    <div class="sub_choice_click shop">
        <p>가입/해지</p>
        <p>판매제한(미전환)</p>
        <p>사업자정보 등록/변경</p>
        <p>프로상점 이용방법</p>
        <p>정산문의(수수료, 세금계산서)</p>
        <p>기타</p>
    </div>
    <div class="sub_choice_click sell">
        <p>광고 이용방법</p>
        <p>광고 심사</p>
        <p>광고포인트</p>
        <p>UP하기</p>
        <p>기타</p>
    </div>
    <div class="sub_choice_click etc">
        <p>내폰시세</p>
        <p>택배서비스</p>
        <p>클리닝 서비스(슈클린/프리미엄)</p>
        <p>폴리싱 서비스(시계/주얼리)</p>
        <p>프로모션</p>
        <p>기타</p>
    </div>
    <div class="sub_choice_click error">
        <p>장애신고</p>
        <p>기타신고</p>
        <p>서비스제안</p>
    </div>
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="./inc/footer.jsp" />
	</footer></body>
</html>