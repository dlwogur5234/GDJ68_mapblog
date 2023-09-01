<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <title>Insert title here</title>
  </head>
  <body>
    <c:import url="../temp/adminHeader.jsp"></c:import>
    <h1>add Page</h1>
    <form action="./add" method="post" enctype="multipart/form-data">
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
  </body>
</html>
