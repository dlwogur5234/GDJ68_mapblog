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
			<section class="container mt-5">
				<h1 class="mb-4 text-center">User List</h1>
			
				
				<table class="table table-striped" id="tableSize">
					<thead>
						<th>ID</th><th>이름</th><th>닉네임</th><th>E-mail</th><th>연락처</th><th>생년월일</th><th>개인URL</th><th>가입날짜</th>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="d" varStatus="i">
						<tr>
							<td><a class="link-underline link-underline-opacity-0 text-white" style="text-decoration: none; color: black !important;" href="./userDetail?id=${d.id}">${d.id}</a></td>
							<td>${d.name}</td>
							<td>${d.nickName}</td>
							<td>${d.email}</td>
							<td>${d.phone}</td>
							<td>${d.birth}</td>
							<td>${d.url}</td>
							<td>${d.createDate}</td>
						</tr>			
						</c:forEach>
				
					</tbody>
				
				</table>
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				  	
				    <li class="page-item ${pager.pre?'':'disabled'}" >
				      <a class="page-link" href="./userList?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    
				    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				    <li class="page-item"><a class="page-link" href="./userList?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
				    </c:forEach>
				    <c:if test="${pager.next}">
				    <li class="page-item" >
				      <a class="page-link" href="./userList?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    
				    </c:if>
				  </ul>
				</nav>
				
				<div class="input-group mb-3">
				 <form action="./userList" method="get">
					  <select name="kind" class="form-select" aria-label="Default select example">
						  <option value="name">Name</option>
						  <option value="Id">Id</option>
					  </select>
					  <input type="text" name="search" class="form-control" aria-label="Amount (to the nearest dollar)">
					   <div class="col-auto">
					    <button type="submit" class="btn btn-primary">검색</button>
					  </div>
				  </form>
				</div>
				
		
			</section>
			



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

