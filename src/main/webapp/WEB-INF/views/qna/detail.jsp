
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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


	<h1>detail</h1>

	
	<table class="table table-dark table-hover">
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			
			
		</thead>
		<tbody>
				<tr>
					<td data-add-num="${dto.qnaNum}" id="up">${dto.qnaNum}</td>
					<td>${dto.qnaTitle}</td>
					<td>${dto.nickName}</td>
					<td>${dto.qnaDate}</td>
				</tr>
				</tbody>
			</table>
				<table class="table table-dark table-hover">
				  <tr>
				   		<th>내용</th>
				  </tr>
				  <tr>
				    <td>${dto.qnaContents}</td>
				    <td>${memberId}</td>
				  </tr>
				</table>
				
				 	<c:forEach items="${dto.fileDTOs}" var="f">	
						<img src="../resources/upload/qna/${f.fileName}">
					</c:forEach> 
		
	
	<c:choose>
    <c:when test="${dto.memberId eq member.id or not empty adminMember}">
        <a href="./update?qnaNum=${dto.qnaNum}" >수정</a>
    

        <form action="./delete?qnaNum=${dto.qnaNum}" method="post">
            <button type="submit">삭제</button>
        </form>
 
    </c:when>
</c:choose>
	

	<%-- <button id="update" data-url="update" class="c1">수정</button>
	<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}" class="c1">삭제</button> --%>


	<div>
		<c:if test="${not empty member}">
			<div class="mb-3">		
				<textarea  name="contents" class="form-control" id="comment"></textarea>
				<button id="commentAdd">댓글등록</button>
			</div>
		</c:if>
		<div>
			<table id="commentList" class="table table-success table-striped">
				
			</table>
			
				<div id="more">
	
				</div>

		</div>
	</div>


    </main>

        <!-- Footer Start-->

		<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

        <!-- Footer End-->


	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>
		<script src="/resources/js/qna/qnaDetail.js"></script>
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