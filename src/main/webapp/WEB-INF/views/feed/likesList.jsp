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
        <h1 class="a mb-5 text-center">Likes List</h1>
        <form action="" id="frm">
            <!-- feedNum hidden처리 -->
            <input type="hidden" id="feedNum" name="feedNum" value="${dto.feedNum}">
        </form>
    
        <!-- div.container start -->
        <div class="conatiner">
        
            <!-- div.row g-2 start -->
            <div class="row g-2">
                <div class="col-md-6 sideBar">
                    <div class="sideBar--wrap">
                        <div class="row row-cols-md-3 g-3">
                        <c:forEach var="feed" items="${getLikesList}" varStatus="i">
                            <div class="col">
                                <div class="card shadow-sm">
                                    <svg class="bd-placeholder-img card-img-top" width="80%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                        <!-- 제목 밑에 있는 회색부분 -->
                                        <rect width="100%" height="100%" fill="#55595c"></rect>
    
                                        <!-- 이미지 -->
                                        <a class="text-white link-offset-2 link-underline link-underline-opacity-0" href="./detail?feedNum=${feed.feedNum}">
                                            <image class="goDetail" href="/resources/img/99A85F3C5C0DC6AD29.jpeg" style="width:100%; height:200px;" />
                                            <text class="goDetail" id="title" x="5%" y="95%" fill="#eceeef" dy=".3em">${feed.title}</text>
                                        </a>
                                    </svg>
    
                                    <div class="card-body" style="position:relative; width:100%;">
                                        <small class="text-muted text-start" style="position:relative; float:left;">${feed.createDate}</small>
                                        <button type="button" id="likes" style="position:relative; float:right;" class="btn btn-sm btn-outline-secondary justify-content-end">♡ ${feed.likes}</button>
                                    </div>
    
                                    <div style="clear:both"></div>
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
    
            </div>
            <!-- div.row g-2 end -->
    
        </div>
        <!-- div.container end -->
    
    
        <!-- Pager -->
        <nav class="container" aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <c:if test="${pager.pre}">
                <li class="page-item"><a class="page-link" href="./list?page=${pager.startNum-1}">Previous</a></li>
            </c:if>
            <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                <li class="page-item move"><a class="page-link" href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
            </c:forEach>
            <c:if test="${pager.next}">
                <li class="page-item move"><a class="page-link" href="./list?page=${pager.lastNum+1}">Next</a></li>
            </c:if>
            </ul>
        </nav>
    
        <!-- 검색 Search -->
        <div class="d-inline-flex p-2 justify-content-center">
            <form class="input-group" action="./list" method="get">
                <select name="kind" class="form-select rounded" style="width:100px" aria-label="Default select example">
                    <option value="title">제목</option>
                    <option value="contents">내용</option>
                </select>
                <input type="text" name="search" class="form-control rounded me-2" style="width:280px" aria-label="Amount (to the nearest dollar)">
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </form>
        </div>
    
    
    <!-- 로그인 안 했을 시에 로그인 페이지로 보내줌 -->
    <c:if test="${sessionScope.member.id == null}">
        <script>
            alert("로그인 하신 후에 사용해주세요");
            location.href="../member/login"; 
        </script>
    </c:if>



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
        
    </body>
</html>