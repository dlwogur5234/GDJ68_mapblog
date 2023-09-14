
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>

        <c:import url="../temp/bootStrap.jsp"></c:import>
	
        <!-- Kakao Map -->
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d19d0bc22748e1c8a814e507a6e96ed2&libraries=services"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

            <style>
                
    
                ::-webkit-scrollbar,::-webkit-scrollbar-track {
                    border-radius: 0;
                    background: #eee;
                    width: 5px;
                    height: 5px
                }
                
                ::-webkit-scrollbar-thumb {
                    border-radius: 5px;
                    background-color: #999;
                }
                
                ::-webkit-scrollbar-thumb:hover {
                    cursor: pointer;
                    background-color: #000;
                }
                            html,body{background-color: #fff;}
                            .main-header{
                                background-color: #fff;
                            }
                            .hidden {
                    position: absolute!important;
                    text-indent: -99999px!important;
                    opacity: 0!important;
                    width: 0!important;
                    height: 0!important;
                    line-height: 0!important;
                    padding: 0!important;
                    margin: 0!important;
                    border: none!important;
                    overflow: hidden!important;
                    outline: 0!important;
                    box-shadow: none!important;
                    background: none!important;
                    clip: rect(0,0,0,0)!important;
                    justify-self: center!important;
                    align-self: center!important;
                            }
                            button {
                                border: none;
                                outline: 0;
                                font-size: inherit;
                                font-family: inherit;
                                color: inherit;
                                text-align: inherit;
                            }
        


            .carousel-inner img {
                width: 100%;
                height: 100%;
            }

            #custCarousel .carousel-indicators {
                position: static;
                margin-top:70px;
            }

            #custCarousel .carousel-indicators > li {
            width:100px;
            }

            #custCarousel .carousel-indicators li img {
                display: block;
                opacity: 0.5;
            }

            #custCarousel .carousel-indicators li.active img {
                opacity: 1;
            }

            #custCarousel .carousel-indicators li:hover img {
                opacity: 0.75;
            }

            .carousel-item img{

                width:80%;
            }
        </style>
   </head>

   <body>
    <!-- Preloader Start ${realPath } -->
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
		<p class="mb-5"></p>
		<section class="container">
		<div class="sliderArea mt-5">
			<div class="row">
				<div class="col-md-12">
					<div id="custCarousel" class="carousel slide" data-ride="carousel" align="center">
						<!-- slides -->
						<div class="carousel-inner">
						<c:forEach var="file" varStatus="status" items="${dto.dtos}">
							<div class="carousel-item ${status.index == 0 ? 'active' : '' }">
								<img src="/resources/upload/feed/${file.fileName}" alt="photos">
							</div>
						</c:forEach>
							<!--
							<div class="carousel-item active">
								<img src="https://i.imgur.com/weXVL8M.jpg" alt="Hills">
							</div>

							<div class="carousel-item">
								<img src="https://i.imgur.com/Rpxx6wU.jpg" alt="Hills">
							</div>

							<div class="carousel-item">
								<img src="https://i.imgur.com/83fandJ.jpg" alt="Hills">
							</div>

							<div class="carousel-item">
								<img src="https://i.imgur.com/JiQ9Ppv.jpg" alt="Hills">
							</div>
							-->
						</div>

						<!-- Left right -->
						<a class="carousel-control-prev" href="#custCarousel" style="    mix-blend-mode: exclusion;" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a>
						<a class="carousel-control-next" href="#custCarousel" style="    mix-blend-mode: exclusion;" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>

						<!-- Thumbnails -->
                        <style>
                            .carousel-item {
                                width: 100%;
                                padding-bottom: 56.26%;
                                position: relative;
                            }
                            .carousel-item img {
                                width: 100%;
                                height: 100%;
                                object-fit: cover;
                                position: absolute;left:0;top:0;
                            }
                            
                            section.container {
                                display: flex;
                                gap: 40px;
                                margin: 70px auto 0;
                            }
                            section.container,
                            section.container > * {overflow: hidden;}
                            @media screen and (min-width:1201px) {
                            .sliderArea {width:53%}
                            .writerArea {width:57%}
                                
                            }
                            @media screen and (max-width:1200px) {
                                section.container {
                                    flex-direction: column;
                                }
                                section.container > * {
                                    width: 100%;
                                }
                            }
                            .listThumb {
                                overflow: hidden;
                                scroll-snap-type: x mandatory;
                                white-space: nowrap;
                                overflow-x: auto;
                                height: fit-content;
                            }
                            .listThumb > li {
                                scroll-snap-align: start;
                                height: fit-content;
                                flex: none;
                            }
                            
                            .listThumb::-webkit-scrollbar,.listThumb::-webkit-scrollbar-track {
                                border-radius: 0;
                                background: #eee;
                                width: 5px;
                                height: 5px
                            }

                            .listThumb::-webkit-scrollbar-thumb {
                                border-radius: 5px;
                                background-color: #999;
                            }

                            .listThumb::-webkit-scrollbar-thumb:hover {
                                cursor: pointer;
                                background-color: #000;
                            }

                
                        
                        </style>
						<ol class="carousel-indicators list-inline listThumb">
						<c:forEach var="file" items="${dto.dtos}" varStatus="status">
							<li class="list-inline-item active">
								<a id="carousel-selector-${status.index}" class="${status.index == 0 ? 'selected' : ''}" data-slide-to="${status.index}" data-target="#custCarousel">
									<img src="/resources/upload/feed/${file.fileName}" class="img-fluid">
								</a>
							</li>
						</c:forEach>
							<!--
							<li class="list-inline-item active">
								<a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#custCarousel">
									<img src="https://i.imgur.com/weXVL8M.jpg" class="img-fluid">
								</a>
							</li>

							<li class="list-inline-item">
								<a id="carousel-selector-1" data-slide-to="1" data-target="#custCarousel">
									<img src="https://i.imgur.com/Rpxx6wU.jpg" class="img-fluid">
								</a>
							</li>

							<li class="list-inline-item">
								<a id="carousel-selector-2" data-slide-to="2" data-target="#custCarousel">
									<img src="https://i.imgur.com/83fandJ.jpg"  class="img-fluid">
								</a>
							</li>

							<li class="list-inline-item">
								<a id="carousel-selector-2" data-slide-to="3" data-target="#custCarousel">
									<img src="https://i.imgur.com/JiQ9Ppv.jpg"  class="img-fluid">
								</a>
							</li>
							-->
						</ol>
					</div>
				</div>
			</div>
		</div>




        <div class="writerArea">

		<form action="" id="frm">
			<!-- feedNum hidden처리 -->
			<input type="hidden" id="feedNum" name="feedNum" value="${dto.feedNum}">
		</form>
            
            <!-- publics hidden처리 -->
            <input type="hidden" name="publics" value="${dto.publics}">
    
            <input type="hidden" name="id" id="id" value="${dto.id}">
    
            <!-- 위도/경도 (숨김) -->
            <input type="hidden" name="lat" id="lat" value="${dto.lat}">
            <input type="hidden" name="lng" id="lng" value="${dto.lng}">
    
            <!-- url (숨김) -->
            <input type="hidden" name="url" id="url" value="${dto.url}">
    
    
            <p class="col-sm-8 text-start" style="padding: 0;">여행날짜 ${dto.tripDate}</p>
            <p class="display-4">${requestScope.dto.title}</p>
            
            <dl class="row mt-1" style="margin: 0;">
                <dd style="flex:none;padding: 0;" class="col-sm-2 text-start align-text-bottom mt-1">${dto.id}</dd>
                <dd style="flex:1;" class="col-sm-8 text-end text-body-tertiary">작성일 ${dto.createDate}</dd>
                <dd style="flex:none;padding: 0; white-space: nowrap;" class="col-sm-2 text-end">조회수 ${dto.hit}</dd>
            </dl>
    
    
            
        <div style="border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        margin-bottom: 30px;">
            <div class="card border-white mb-3">
                <pre class="card-body contents text-start" style="font-size:15px; height:300px;white-space: pre-wrap;">${dto.contents}</pre>
            </div>
    
            <!-- <div>
                <c:forEach items="${dto.dtos}" var="f">
                    <img alt="${f.originalName}" src="/resources/upload/feed/${f.fileName}" style="width:100px; height:100px;" />
                </c:forEach>
            </div> -->
        </div>
        <div style="display: flex;justify-content: flex-end;padding-bottom: 10px;">
            <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="likes" style="    padding: 10px 30px;display: flex;justify-content: center;width: fit-content !important;"> 좋아요 ${dto.likes} </button>
        </div>
        <div style="display: flex;justify-content: flex-end; gap: 10px;">

            
            <div style="display: flex; gap: 10px;">
                <c:if test="${sessionScope.member.id == dto.id}">
                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn c1" type="button" id="update" style="padding: 10px 30px;height: 40px;" data-url="update">수정</button>
                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn c1" type="button" id="delete" style="padding: 10px 30px;height: 40px;" data-url="delete">삭제</button>
                </c:if>
                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" style="padding: 10px 30px;height: 40px;" id="list">목록</button>
            </div>
    
        </div>
    
        <hr class="hr" />


        <form action="./addComment" method="post" id="frm2" style=" border:1px solid #aaa;background-color: #fff;">
            <input type="hidden" id="feedNum2" name="feedNum" value="${dto.feedNum}">
            <input type="hidden" id="commentId" name="id" value="${member.id}">
            <input type="hidden" id="nickName" name="nickName" value="${member.nickName}">
            <textarea  id="commentContents" style="width:100%; border:none; resize: none;background: none;height: 170px;padding: 20px;" placeholder="댓글내용을 입력해주세요." maxlength="300" onkeydown="
             $('.length').text($(this).val().length)
            "></textarea>
            <div style="display: flex; justify-content: space-between;align-items: center;border-top:1px solid #aaa;">
                <span style="margin-left:10px;">
                    <span class="length">0</span>
                    /300
                </span>
                <button type="button" class="button button-contactForm btn_1 boxed-btn" id="addComment" style="flex:none;width: fit-content !important;text-align: center;">댓글등록</button>
            </div>
        </form>
    
    
        <ul id="commentList"></ul>

        <style>
            #commentList {
                padding-bottom: 50px;
            }
            #commentList > * {
                border-bottom: 1px solid #aaa;
                padding: 20px;
                background: #f9f9f9;
            }
        </style>

        </div>
        </section>
    
    
        
        <script type="text/javascript">
    
            // 좋아요 관련 script
            $(document).on("click", "#likes", function() {
                if ("${sessionScope.member}") {
                    $.ajax({
                        async:false,
                        url:"./addLikes",
                        type:"post",
                        data:{"feedNum":$("#feedNum").val()},
                        dataType:"json",
                        success:function(data) {
                            $("#likes").text("좋아요 " + data.count);
    
                        },
                        error:function(xhr, status, res) {
                            console.log("오류 발생", xhr.responseText, status, res);
                        }
                    });
                } else {
                    alert("로그인이 필요한 서비스입니다.");
                    location.href="../../member/login"; 
                }
            });
    
    
            // 댓글 좋아요 관련 script
            // $(document).on("click", "#commentLikes", function() {
            // 	if ("${sessionScope.member}") {
            // 		$.ajax({
            // 			async:false,
            // 			url:"./addCommentLikes",
            // 			type:"post",
            // 			data:{"commentNum":$("#commentNum").val()},
            // 			dataType:"json",
            // 			success:function(data) {
            // 				$("#commentLikes").text("좋아요 " + data.count);
    
            // 			},
            // 			error:function(xhr, status, res) {
            // 				console.log("오류 발생", xhr.responseText, status, res);
            // 			}
            // 		});
            // 	} else {
            // 		alert("로그인이 필요한 서비스입니다.");
            // 		location.href="../../member/login"; 
            // 	}
            // });
    
            </script>

        <script src="/resources/js/feed/feedDelete.js"></script>
        <script src="/resources/js/feed/feedComment.js"></script>

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