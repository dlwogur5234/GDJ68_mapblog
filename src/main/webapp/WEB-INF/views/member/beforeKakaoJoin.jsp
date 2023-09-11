<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/img/index/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="/resources/css/index/bootstrap.min.css">
            <link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
            <link rel="stylesheet" href="/resources/css/index/flaticon.css">
            <link rel="stylesheet" href="/resources/css/index/slicknav.css">
            <link rel="stylesheet" href="/resources/css/index/animate.min.css">
            <link rel="stylesheet" href="/resources/css/index/magnific-popup.css">
            <link rel="stylesheet" href="/resources/css/index/fontawesome-all.min.css">
            <link rel="stylesheet" href="/resources/css/index/themify-icons.css">
            <link rel="stylesheet" href="/resources/css/index/slick.css">
            <link rel="stylesheet" href="/resources/css/index/nice-select.css">
            <link rel="stylesheet" href="/resources/css/index/style.css">

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

            <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <style>
                .x {color: red;}
                .o {color: green;}
                .outer-div {
		  width : 100%;
		  height : 100%;
		}
				
		.inner-div {
		  width : 1000px;
		  height : 100%;
		  margin: auto;
		}
                
                * {
                font-family: 'Gothic A1', sans-serif;
                }

                .btn {
                    display: block;
                    margin: auto;
                }
        </style>
   </head>

   <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/resources/img/찐막.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

        <!-- Header Start -->

		<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>


        <!-- Header End -->

	<!-- Main start -->
    <main>
        <br><br><br>
        <div class="col-lg-12 text-center">
	        <h2 style="font-size:40px">정보 제공 동의 여부 확인 [카카오]</h2>
        </div>
<div class='outer-div'>
        <div class='inner-div'>
        <br><br><br>
    <form action="./join" method="get" id="fr">
        <input type="checkbox" id="a">
        <label for="a" style="font-size:20px; font-weight:bold;">필수 사항 모두 동의</label>
        <br><br><br>
        <textarea cols="120" rows="8">
Mapper 이용약관
            
여러분을 환영합니다.
Mapper  서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 Mapper  서비스의 이용과 관련하여 Mapper  서비스를 제공하는 Mapper와 이를 이용하는 Mapper  서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 Mapper  서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
회원으로 가입하시면 Mapper 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, Mapper는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 Mapper 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 Mapper 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 Mapper 서비스를 보다 편리하게 이용할 수 있습니다.
        </textarea><br>
        <input type="checkbox" class="cb" id="c1">
        <label for="c1">1번(필수)</label>
        <br><br><br>
        <textarea cols="120" rows="8">
개인정보 수집 및 이용
            
개인정보보호법에 따라 Mapper에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
회원가입 시점에 Mapper가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
            
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 본인확인 이메일주소, 휴대전화번호를, 선택항목으로 이름을 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.
            
- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
        </textarea><br>
        <input type="checkbox" class="cb" id="c2">
        <label for="c2">2번(필수)</label>
        <br><br><br>
        <textarea cols="120" rows="8">
 실명 인증된 이메일인증으로 가입
            
실명 인증된 이메일로 가입하시면 본인인증이 필요한 서비스를 가입 후 바로 이용하실 수 있어요.
        </textarea><br>
        <input type="checkbox" class="cb" id="c3">
        <label for="c3">3번(필수)</label>
        <br><br><br>
        <textarea cols="120" rows="8">
위치기반서비스 이용약관
            
위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 Mapper 위치기반 서비스를 이용할 수 있습니다.
            
제 1 조 (목적)
이 약관은 Mapper가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
            
제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
        </textarea><br>
        <input type="checkbox" class="cb" id="c4">
        <label for="c4">4번(필수)</label>
        <br><br><br>
        <textarea cols="120" rows="8">
이벤트・혜택 정보 수신
            
Mapper  서비스 및 제휴 이벤트・혜택 등의 정보를 휴대전화(전화 또는 문자), 이메일로 받을 수 있습니다. 일부 서비스(별개의 회원 체계 운영, Mapper 가입 후 추가 가입하는 서비스 등)의 경우, 수신에 대해 별도로 안내드리며 동의를 구합니다.
        </textarea><br>
        <input type="checkbox" id="agree1" name="agree1">
        <label for="c5">5번(선택)</label>
        <br><br><br>
        <textarea cols="120" rows="8">
프로필정보 추가 수집 동의
            
Mapper 는 개인정보를 안전하게 취급하는데 최선을 다합니다.
아래에 동의하시면 계정의 프로필정보를 Mapper 가 제공하는 Mapper 계정 기반의 서비스에서 편리하게 이용하실 수 있습니다.
        </textarea><br>
        <input type="checkbox" id="agree2" name="agree2">
        <label for="c6">6번(선택)</label>
    </form><br><br>
<div id="btn-div">
    <button id="btn" class="btn border-btn">회원 가입</button>
</div>
        </div>
</div><br>
<div></div>
    </main>

        <!-- Footer Start-->

		<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

        <!-- Footer End-->


	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="/resources/js/index/vendor/jquery-1.12.4.min.js"></script>
        <script src="/resources/js/index/popper.min.js"></script>
        <script src="/resources/js/index/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="/resources/js/index/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="/resources/js/index/owl.carousel.min.js"></script>
        <script src="/resources/js/index/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="/resources/js/index/wow.min.js"></script>
		<script src="/resources/js/index/animated.headline.js"></script>
        <script src="/resources/js/index/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="/resources/js/index/jquery.scrollUp.min.js"></script>
        <script src="/resources/js/index/jquery.nice-select.min.js"></script>
		<script src="/resources/js/index/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="/resources/js/index/contact.js"></script>
        <script src="/resources/js/index/jquery.form.js"></script>
        <script src="/resources/js/index/jquery.validate.min.js"></script>
        <script src="/resources/js/index/mail-script.js"></script>
        <script src="/resources/js/index/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="/resources/js/index/plugins.js"></script>
        <script src="/resources/js/index/main.js"></script>
        
        <script src="../resources/js/member/beforeKakaoJoin.js"></script>
    </body>
</html>