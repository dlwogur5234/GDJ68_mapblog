$(document).ready(function () {
  $("#followButton").click(function () {
    $.ajax({
      type: "post",
      url: "deleteFollow",
      data: {},
      success: function (data) {
        location.reload();
      },
    });
  });
});
