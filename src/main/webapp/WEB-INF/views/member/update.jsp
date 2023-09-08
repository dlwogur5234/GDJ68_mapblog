<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Travel HTML-5 Template </title>
		<style>
			.btn {
				display: block;
				margin: auto;
				position: relative; left: 45%;
			}
		</style>

		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
			<link rel="stylesheet" href="/resources/css/member/join.css" type="text/css" />
			<link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
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
			<h2 style="font-size:40px">회원 정보 변경</h2>
		</div>
	
		<div class='outer-div'>
			<div class='inner-div'>
		<br><br><br>
	
		<form action="./update" method="post" id="fr">
			<div class="mb-3">
			  <label for="pw" class="form-label"></label>
			  <input type="password" class="td" value="${member.pw}" name="pw" id="pw" placeholder="PW를 입력하세요">
			</div>
			<div id="pwResult" class="x">PASSWORD를 확인하세요(필수)</div><br>
			<div class="mb-3">
				<label for="pw2" class="form-label"></label>
				<input type="password" class="td" value="" name="pw2" id="pw2" placeholder="PW를 재입력하세요">
			</div>
			<div id="pw2Result" class="x">PASSWORD 일치 여부를 확인하세요(필수)</div><br>
			
			<div class="mb-3">
			  <label for="name" class="form-label"></label>
			  <input type="text" name="name" class="td" value="${member.name}" id="name" placeholder="Name을 입력하세요">
			</div>
			<div id="nameResult" class="x">이름을 확인하세요(필수)</div><br>
			
			<div class="mb-3">
			  <label for="phone" class="form-label"></label>
			  <input type="text" class="td" name="phone" value="${member.phone}" id="phone" placeholder="Phone#을 입력하세요">
			</div>
			<div class="o" id="phoneResult">폰번호는 필수 X</div><br>
			
			<div class="mb-3">
			  <label for="birth" class="form-label"></label>
			  <input type="date" id="birth" name="birth" value="${member.birth}">
			</div>
			<div id="birthResult" class="x">생일을 확인하세요(필수)</div><br>
			
			<div>
				<label id="pub">* 계정 공개 여부</label><br>
				<input type="radio" id="p1" name="publics" value="1">
				<label for="p1" id="p11">전체 공개</label>
				<input type="radio" id="p2" name="publics" value="0">
				<label for="p2" id="p21">전체 비공개</label><br>
			<div id="publicsResult" class="x">공개여부를 확인하세요(필수)</div>
			</div><br><br><br>
	
			<input type="hidden" name="url" value="${member.url}">
	
			<input type="button" class="btn btn-primary" id="btn" value="변경하기">
		</form>
			</div>
		</div><br>

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
        
		<script src="../resources/js/member/membersUpdate.js"></script>
    </body>
</html>