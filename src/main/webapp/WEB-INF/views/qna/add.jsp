<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  </head>
  <body>
    <c:import url="../temp/header.jsp"></c:import>
    <h1>add Page</h1>
    <form action="./add" method="post" enctype="multipart/form-data">
      <div class="input-group text-center">
        <span class="input-group-text" id="basic-addon2">제목</span
        ><input type="text" name="qnaTitle" />
      </div>
      <br />
      <div class="input-group text-center">
        <span class="input-group-text" id="basic-addon2">내용</span
        ><textarea
          class="input-group"
          rows=""
          cols=""
          name="qnaContents"
          id="contents"
        ></textarea>
      </div>
      <br />
      <div class="input-group text-center">
        <input type="hidden" name="memberId" value="${member.id}" />
        <span class="input-group-text" id="basic-addon2">작성자</span>
        <input type="text" name="nickName" value="${member.nickName}" />
      </div>
      <br />

      <select name="privateContents">
        <option value="0">비밀글</option>
        <option value="1" selected>공개글</option>
      </select>

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
    <script src="/resources/js/temp/fileAdd.js"></script>
    <script>
      $("#contents").summernote({
        height: 400,
        callbacks: {
          onImageUpload: function (files) {
            alert("이미지 업로드");
            // 이미지를 server로 전송하고
            // 응답으로 이미지경로와 파일명을 받아서
            // img태그를 만들어서 src속성에 이미지 경로를 넣는 것

            let formData = new FormData(); // <form></form>
            formData.append("files", files[0]);
            // 위의 form태그에 <input type="file" name="files">를 append

            $.ajax({
              type: "post",
              url: "setContentsImg",
              data: formData,
              // 원래는 data 안에  {} 괄호를 사용해서 객체를 넣어주는데 이미 위에서
              // data를 formData 객체로 선언을 해줬기 때문에 formData만 쓴 것.
              enctype: "maltipart/form-data",
              cache: false, // multipart/form-data에서 필수
              contentType: false, // multipart/form-data에서 필수
              processData: false, // multipart/form-data에서 필수
              success: function (result) {
                $("#contents").summernote("insertImage", result.trim());
              },
              error: function () {
                console.log("error");
              },
            });
          },

          onMediaDelete: function (files) {
            let path = $(files[0]).attr("src"); // /resources/upload/feed/파일명

            $.ajax({
              type: "post",
              url: "./setContentsImgDelete",
              data: {
                path: path,
              },
              success: function (result) {
                console.log(result);
              },
              error: function () {
                console.log("error");
              },
            });
          },
        },
      });
    </script>
  </body>
</html>
