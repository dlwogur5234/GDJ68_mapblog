// let commentId = $('#commentId').val();
// let commentContents = $('#commentContents').val();

$("#addComment").on("click", function () {
  ms = $("#meetingNum2").val();
  commentId = $("#commentId").val();
  nickName2 = $("#nickName").val();
  if ($("#commentContents").val().trim() == "") {
    alert("내용을 입력해 주세요.");
  } else {
    $.ajax({
      type: "POST",
      url: "./addComment",
      data: {
        meetingNum: ms,
        id: commentId,
        nickName: nickName2,
        contents: $("#commentContents").val(),
      },
      success: function () {
        alert("작성 성공");
        ms = $("#meetingNum2").val();
        $.ajax({
          type: "GET",
          url: "./getComment?meetingNum=" + ms,
          success: function (r) {
            $("#commentContents").val("");
            $("#commentList").html(r);
          },
        });
      },
      error: function () {
        alert("댓글 작성 실패");
      },
    });
  }
});

function getList() {
  ms = $("#meetingNum2").val();
  $.ajax({
    type: "GET",
    url: "./getComment?meetingNum=" + ms,
    success: function (r) {
      $("#commentList").html(r);
    },
  });
}

$(document).ready(function () {
  ms = $("#meetingNum2").val();
  $.ajax({
    type: "GET",
    url: "./getComment?meetingNum=" + ms,
    success: function (r) {
      $("#commentList").html(r);
    },
  });
});

// $('#commentList').on('click','#btn',function(){
//     console.log($('#commentList').attr('data-commentNum'));
//   });

//   $('#btn3').on('click',function(){
//     console.log("sdsds2");
//   });

//   $('#commentList').on('click','#btn',function(){
//     console.log("sdsds3");
//   });

//   $('.butt').on('click',function(){
//     console.log("sdsds3");
//   });

//댓글 삭제
$("#commentList").on("click", ".butt", function () {
  let result = confirm("정말 삭제하시겠습니까?");
  let commentNum = this.dataset.commentnum;
  if (result) {
    $.ajax({
      type: "get",
      url: "deleteComment",
      data: {
        commentNum: commentNum,
      },
      success: function (result) {
        getList();
      },
      error: function () {
        console.log("error");
      },
    });
  }
});

//댓글 Update 이벤트
$("#commentList").on("click", ".updateBtn", function () {
  let contents = $(this).siblings("#updateDiv").text();
  console.log(contents);

  $(this)
    .siblings("#updateDiv")
    .html(
      '<input type="text" id="contents"  style="border-radius: 11px; margin-right: 6px value="' +
        contents +
        '">'
    );
  $(this).attr("class", "updateBtn2 btn btn-outline-secondary");
  // $(this).siblings('#updateDiv').html("<input type='text' id='contents' value='" + contents + "'>");
});

//댓글 Update 완료 이벤트
$("#commentList").on("click", ".updateBtn2", function () {
  let contents = $(this).siblings("#updateDiv").children("#contents").val();
  let commentNum = this.dataset.commentnum;
  if (contents.trim() == "") {
    alert("내용을 입력해 주세요.");
  } else {
    $.ajax({
      type: "post",
      url: "updateComment",
      data: {
        commentNum: commentNum,
        contents: contents,
      },
      success: function (result) {
        getList();
      },
      error: function () {
        console.log("error");
      },
    });
  }
});

//대댓 add input 태그
$("#commentList").on("click", ".replyBtn", function () {
  let commentNum = this.dataset.commentnum;
  $(this).html("답글 등록");
  $(this).attr("class", "replyBtn2 btn btn-outline-secondary");
  $(this).before(
    '<input type="text" id="replyContents" style="border-radius: 11px; margin-right: 6px" data-commentNum="' +
      commentNum +
      '">'
  );
});

//대댓 add ajax 호출
$("#commentList").on("click", ".replyBtn2", function () {
  let replyContents = $("#replyContents").val();
  let commentNum = this.dataset.commentnum;
  ms = $("#meetingNum2").val();
  commentId = $("#commentId").val();
  nickName2 = $("#nickName").val();
  if (replyContents.trim() == "") {
    alert("내용을 입력해 주세요");
  } else {
    $.ajax({
      type: "post",
      url: "replyCommentAdd",
      data: {
        meetingNum: ms,
        id: commentId,
        commentNum: commentNum,
        contents: replyContents,
        nickName: nickName2,
      },
      success: function () {
        getList();
      },
      error: function () {
        console.log("error");
      },
    });
  }
});

var viewResult = true;

//대댓 리스트 보기
$("#commentList").on("click", "#replyListBtnId", function () {
  $(this).attr("id", "replyListBtnId2");
  // button 에 담긴 data-commentNum 가져오기
  let commentNum = this.dataset.commentnum;
  // ajax 에서 this 요소가 달라 ajax 영역 밖에서 this를 thisElement 라는 변수에 담음
  let thisElement = $(this);
  //ajax 실행
  $.ajax({
    type: "get",
    url: "replyCommentList",
    data: {
      commentNum: commentNum,
    },
    success: function (r) {
      //ajax 성공시 this 요소의 형제 노드 중 id 가 replyListDivId 를 찾아 그 하위 노드로 success r 값 추가
      thisElement.siblings("#replyListDivId").empty();
      thisElement.siblings("#replyListDivId").append(r);
    },
    error: function () {
      console.log("error");
    },
  });
});

//대댓 리스트 숨기기
$("#commentList").on("click", "#replyListBtnId2", function () {
  $(this).siblings("#replyListDivId").empty();
  $(this).attr("id", "replyListBtnId");
});

//대댓 Update 이벤트
$("#commentList").on("click", ".replyUpdateBtn", function () {
  alert("대댓 이벤트 확인");
  let contents = $(this).siblings("#replyUpdateContentsDiv").text();
  console.log(contents);
  $(this)
    .siblings("#replyUpdateContentsDiv")
    .html('<input type="text" id="contents" value="' + contents + '">');
  $(this).attr("class", "replyUpdateBtn2 btn btn-outline-secondary");
  $(this)
    .siblings("#replyUpdateContentsDiv")
    .html("<input type='text' id='contents' value='" + trim(contents) + "'>");
});

//대댓 Update Ajax 호출
$("#commentList").on("click", ".replyUpdateBtn2", function () {
  let contents = $(this)
    .siblings("#replyUpdateContentsDiv")
    .children("#contents")
    .val();
  console.log("컨텐츠 대댓", contents);
  let replyNum = this.dataset.replynum;
  console.log(replyNum);
  if (contents.trim() == "") {
    alert("내용을 입력해 주세요.");
  } else {
    $.ajax({
      type: "post",
      url: "replyCommentUpdate",
      data: {
        replyNum: replyNum,
        contents: contents,
      },
      success: function (result) {
        getList();
      },
      error: function () {
        console.log("error");
      },
    });
  }
});

$("#commentList").on("click", ".replyDeleteBtn", function () {
  let result = confirm("정말 삭제하시겠습니까?");
  let replyNum = this.dataset.replynum;
  let commentNum = this.dataset.commentnum;
  if (result) {
    $.ajax({
      type: "get",
      url: "replyCommentDelete",
      data: {
        replyNum: replyNum,
        commentNum: commentNum,
      },
      success: function (result) {
        getList();
      },
      error: function () {
        console.log("error");
      },
    });
  }
});
