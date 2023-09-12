$("#contents").summernote({
  height: 400,
  callbacks: {
    onImageUpload: function (files) {
      alert("이미지 업로드");
      // 이미지를 서버로 전송하고 응답으로 이미지 경로와 파일명을 받아서 img 태그를 만들어서 src 속성에 이미지 경로를 넣는 코드

      let formData = new FormData();
      formData.append("files", files[0]);
      $.ajax({
        type: "post",
        url: "setContentsImg",
        data: formData,
        cache: false,
        enctype: "multipart/form-data",
        contentType: false,
        processData: false,
        success: function (result) {
          $("#contents").summernote("insertImage", result.trim());
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
