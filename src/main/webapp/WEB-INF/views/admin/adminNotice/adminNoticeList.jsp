<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mapper Admin Main Page</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
<c:import url="../../temp/bootStrap.jsp"></c:import>

</head>
<body id="page-top">
	

    <!-- Page Wrapper -->
    <div id="wrapper">

	<!-- sidebar 불러오기 -->
	<c:import url="/WEB-INF/views/admin/adminTemp/sidebar.jsp"></c:import>


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->


                <!-- Topbar -->
                <nav>

                    <c:import url="../../temp/adminHeader.jsp"></c:import>

                </nav>
                <!-- End of Topbar -->


			<!-- 페이지별 내용 -->
	<main id="mainHeight">
	    <div class="slider-area ">
	            <!-- Mobile Menu -->
	            <div class="single-slider slider-height2 d-flex align-items-center" id="margin2" data-background="/resources/img/index/hero/about.jpg" style="background-image: url(&quot;assets/img/hero/contact_hero.jpg&quot;);">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-xl-12">
	                            <div class="hero-cap text-center">
	                                <h3 class="titleStyle">공지사항</h3>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	    <table class="table table-striped" id="tableSize">
	       
	            <thead>
	                <th>번호</th>
	                <th>제목</th>
	                <th>일자</th>
	            </thead>
	            <tbody>
	                <c:forEach items="${list}" var="n">
	                	<tr>
	                        <td>${n.noticeNum}</td>
		                        
		                        	<td><a href="./detail?noticeNum=${n.noticeNum}">${n.subject}</a></td>
		                        
	                        <td>${n.noticeDate}</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	            
	            
	        
	            
	
	    </table>

	          <a class="btn btn-outline-secondary BtnPosition" href="./add">공지추가</a>

	    <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center" id="page">
			    <li class="page-item ${pager.pre?'':'disabled'}">
			      <a class="page-link" href="./list?page=${pager.page-1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  
			    <c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./list?page=${i}">${i}</a></li>
			    </c:forEach>
			
			    <li class="page-item ${pager.next?'':'disabled'}">
			      <a class="page-link" href="./list?page=${pager.page+1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			
			  </ul>
			</nav>


    </main>
			<!-- 페이지별 내용 끝 -->



            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; GDJ68 Mapper 2023</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>




    <!-- Logout Modal-->
  
  
  
  
  
  
  
  
  

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/admin/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/admin/demo/chart-area-demo.js"></script>
    <script src="/resources/js/admin/demo/chart-pie-demo.js"></script>

</body>

</html>