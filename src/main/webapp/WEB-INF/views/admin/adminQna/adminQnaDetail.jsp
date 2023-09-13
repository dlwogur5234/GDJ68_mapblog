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

<style>

</style>

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

				<div class="mb-3">		
					<textarea  name="contents" class="form-control" id="comment"></textarea>
					<button id="commentAdd">댓글등록</button>
				</div>

			<div>
				<table id="commentList" class="table table-success table-striped">
					
				</table>
				
					<div id="more">
		
					</div>
	
			</div>
		</div>
	
	
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
  
  
  
  
  
  
  
  
  
	<script src="/resources/js/qna/qnaDetail.js"></script>
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