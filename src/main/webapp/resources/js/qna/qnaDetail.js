let qn = $("#up").attr("data-add-num");
let tp = 0;
let pageNum = 1;
getCommentList(qn, pageNum);
//add
$("#commentAdd").click(function () {
  let contents = $("#comment").val();
  $.ajax({
    type: "post",
    url: "commentAdd",
    data: {
      qnaNum: qn,
      contents: contents,
    },
    success: function (result) {
      if (result.trim() > 0) {
        alert("댓글등록완료");
        $("#commentList").html("");
        $("#comment").val("");
        pageNum = 1;
        getCommentList(qn, 1);
      }
    },
  });
});

//last Page
$("#more").on("click", "#moreButton", function () {
  if (pageNum == tp) {
    alert("마지막 페이지");
    return;
  }
  pageNum++;
  getCommentList(qn, pageNum);
});

//list
function getCommentList(qnaNum, page) {
  $.ajax({
    type: "get",
    url: "./commentList" /* "./commentList?qnaNum="+qnaNum+"&page"+page, */,
    data: {
      qnaNum: qnaNum,
      page: page,
    },
    success: function (result) {
      $("#commentList").append(result);
      tp = $("#totalPage").attr("data-totalPage");

      let button =
        '<button id="moreButton">더보기(' + pageNum + "/" + tp + ")</button>";

      $("#more").html(button);
    },
    error: function () {
      console.log("error");
    },
  });
}

$(document).ready(function () {
  $("#commentList").on("click", "#del", function () {
    var tr = $(this).closest(".delD");
    var commentNum = $("#del").attr("data-num-del");
    alert("댓글 삭제 완료");
    $.ajax({
      type: "post",
      url: "deleteComment",
      data: {
        commentNum: commentNum,
      },
      success: function (result) {
        tr.remove();
        location.reload();
      },
      error: function () {
        console.log("error");
      },
    });
  });
});

$("#commentList").on("click", ".updateBtn", function () {
  alert("수정버튼 클릭");
  let contents = $(this).parents().siblings("#updateDiv").text();
  console.log(contents);

  $(this)
    .parents()
    .siblings("#updateDiv")
    .html('<input type="text" id="contents"  value="' + contents + '">');
  $(this).attr("class", "updateBtn2 btn btn-outline-secondary");
});

$("#commentList").on("click", ".updateBtn2", function () {
  let contents = $(this)
    .parents()
    .siblings("#updateDiv")
    .children("#contents")
    .val();
  let commentNum = this.dataset.commentnum;
  $.ajax({
    type: "post",
    url: "commentUp",
    data: {
      commentNum: commentNum,
      contents: contents,
    },
    success: function (result) {
      let updatedContents = $("#commentList .updateBtn2")
        .siblings("#updateDiv")
        .children("#contents")
        .val();
      $("#commentList .updateBtn2")
        .siblings("#updateDiv")
        .text(updatedContents);
      $("#commentList .updateBtn2").attr(
        "class",
        "updateBtn btn btn-outline-secondary"
      );
      location.reload();
      getCommentList(qnaNum, page);
    },
    error: function () {
      console.log("error");
    },
  });
});
