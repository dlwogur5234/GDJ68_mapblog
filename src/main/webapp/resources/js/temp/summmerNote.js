$("#con").summernote({
  height: 400,
  callbacks: {
    onImageUpload: function (files) {
      alert("이미지 업로드");
      //이미지를 server로 전송하고
      //응답으로 이미지경로와 파일명을 받아서
      //img 태그를 만들어서 src속성에 이미지경로는 넣는것
      let formData = new FormData(); //<form></form>
      formData.append("files", files[0]); //<input type='file' name='files'>
      $.ajax({
        type: "post",
        url: "setContentsImg",
        data: formData,
        cashe: false,
        enctype: "multipart/form-data",
        contentType: false,
        processData: false,
        success: function (result) {
          $("#con").summernote("insertImage", result.trim());
        },
        error: function () {
          console.log("error");
        },
      });
    },
    onMediaDelete: function (files) {
      let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명

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
