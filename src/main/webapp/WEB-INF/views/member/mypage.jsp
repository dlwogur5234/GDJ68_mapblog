<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<style>
			* {
			font-family: 'Gothic A1', sans-serif;
			}
			#table {
				position: relative; left: 15%; 
			}
			.inf {
				position: relative; left: 28.5%;
			}
			.buttons{
				display: block;
				text-align: center;
			}
			.f6{
				display: block;
				text-align: center;
			}
			.f3{
				display: block;
				text-align: center; 
			}
			#tableForPic{
				position: relative; left: 5.5%;
			}
			#fr2{
				display: block;
				text-align: center;
			}
		</style>

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
			<link rel="stylesheet" href="/resources/css/member/join.css" type="text/css" />
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
			<h2 style="font-size:40px">MY PAGE</h2>
		</div>
	
		<div class='outer-div'>
			<div class='inner-div'>
		<br><br><br>

			<h5 class="inf">ID</h5>
			<input style="text-align: center;" type="text" class="td" value="${member.id}" name="id" id="id" readonly><br><br>
			<h5 class="inf">PW</h5>
			<input style="text-align: center;" type="text" name="name" class="td" value="${member.name}" id="name" readonly><br><br>
			<h5 class="inf">NICKNAME</h5>
			<input style="text-align: center;" type="text" name="nickName" class="td" value="${member.nickName}" id="nickName" readonly><br><br>
			<h5 class="inf">E-MAIL</h5>
			<input style="text-align: center;" type="text" name="email" class="td" value="${member.email}" id="email" readonly><br><br>
			<h5 class="inf">PHONE#</h5>
			<input style="text-align: center;" type="text" class="td" name="phone" value="${member.phone}" id="phone" readonly><br><br>
			<h5 class="inf">BIRTHDAY</h5>
			<input style="text-align: center;" type="text" class="td" id="birth" name="birth" value="${member.birth}" readonly><br><br>
			<h5 class="inf">PERSONAL URL</h5>
			<input style="text-align: center;" type="text" class="td" id="url" name="url" value="http://localhost:82/feed/list/${member.url}" readonly><br><br>
			<h5 class="inf">PUBLICS</h5>
			<c:if test="${member.publics eq 1}">
				<input style="text-align: center;" type="text" class="td" id="publics" name="publics" value="공개 계정" readonly><br><br>
		   </c:if>
			<c:if test="${member.publics eq 0}">
				<input style="text-align: center;" type="text" class="td" id="publics" name="publics" value="비공개 계정" readonly><br><br>
		   </c:if><br><br>

		   	<table border="0" id="tableForPic">
				<tr>
					<td width="900" height="600">
						<div style="display: block; margin-left: auto; margin-right:auto;" class="picture">
							<c:if test="${not empty sessionScope.memberFile}">
								<img style="display: block; margin-left: auto; margin-right:auto;" alt="" src="../resources/upload/member/${memberFile.fileName}">
							</c:if>
							<c:if test="${empty sessionScope.memberFile}">
								<img style="display: block; margin-left: auto; margin-right:auto;" alt="" src="../resources/img/기본프사.png">
							</c:if>
						</div>
					</td>
				</tr>
			</table>

			</div><br><br><br>
			</div>
			<br>
		
		<form action="./update" id="fr6" class="f6">
			<input class="btn btn-primary f6" type="button" id="ic2" value="기본정보 수정">
		</form><br>
		
		<form action="./updateImg" id="fr3" class="f3">
			<input class="btn btn-primary f3" type="button" id="ic" value="프로필사진 변경">
		</form><br><br><br><br>
		
		<div class="buttons">
			<input type="button" class="btn btn-primary" id="searchMember" value="좋아요 누른 게시물" onclick="window.open('http://localhost:82/feed/likesList', '좋아요 누른 게시물', 'width=800, height=600')"><br><br>
			<input type="button" class="btn btn-primary" id="myQnaList" value="내가 쓴 QnA 보기" onclick="window.open('http://localhost:82/qna/myQnaList', '내가 쓴 QnA 보기', 'width=800, height=600')"><br><br>
			<input type="button" class="btn btn-primary" id="searchIgnore" value="차단한 회원 조회" onclick="window.open('http://localhost:82/member/searchIgnore', '차단한 회원 검색', 'width=500, height=700')"><br>
		</div><br><br>
		
		<form action="./delete" id="fr2">
			<input class="btn btn-primary" type="button" id="dm" value="회원 탈퇴">
		</form>
			</div>
		</div>

    </main><br>

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
        
		<script>
			const dm = document.getElementById("dm")
			const ic = document.getElementById("ic")
			const ic2 = document.getElementById("ic2")
			const fr2 = document.getElementById("fr2")
			const fr3 = document.getElementById("fr3")
			const fr4 = document.getElementById("fr4")
			const fr6 = document.getElementById("fr6")
			const searchMember = document.getElementById("searchMember")
	
			dm.addEventListener('click', function(){
				if (confirm("회원 탈퇴하시겠습니까?")) {
					fr2.submit();
				}
			})
	
			ic.addEventListener('click', function(){
				fr3.submit();
			})

			ic2.addEventListener('click', function(){
				fr6.submit();
			})
	
			// searchMember.addEventListener('click', function(){
			// 	fr4.submit();
			// })
		</script>
    </body>
</html>