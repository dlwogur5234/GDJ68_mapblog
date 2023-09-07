<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Mapper Admin Main Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- Custom fonts for this template-->
    <link
      href="/resources/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="/resources/css/admin/sb-admin-2.min.css" rel="stylesheet" />
   
    <c:import url="../../temp/bootStrap.jsp"></c:import>

    <style></style>
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
        <form
          action="./adminNotice/add"
          method="post"
          enctype="multipart/form-data"
        >
          <div class="input-group text-center">
            <span class="input-group-text" id="basic-addon2">제목</span
            ><input type="text" name="subject" />
          </div>
          <br />
          <div class="input-group text-center">
            <span class="input-group-text" id="basic-addon2">내용</span
            ><textarea
              class="input-group"
              rows=""
              cols=""
              name="contents"
              id="con"
            ></textarea>
          </div>
          <br />
          <div class="input-group text-center">
            <span class="input-group-text" id="basic-addon2">작성자</span
            ><input type="text" name="adminId" />
          </div>
          <br />

          <div>
            <button type="button" class="my btn btn-danger" id="fileBtn">
              File추가
            </button>
          </div>
          <div id="fileList" class="my-5"></div>

          <p>
            <!-- 	<select name="bookSale">
						<option value="1">판매가능</option>
						<option value="0" selected>판매중지</option>
					</select> -->
          </p>

          <button type="submit">등록</button>
        </form>
        <script src="/resources/js/fileAdd.js"></script>

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
    <script src="/resources/js/temp/summmerNote.js"></script>
  </body>
</html>
