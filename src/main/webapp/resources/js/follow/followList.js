let page = 1;

$.ajax({
  type: "GET",
  url: "/feed/follow/list",
  data: {
    page: page,
    nowUrl: location.href,
  },
  success: function (response) {

    $("#followList").html(response.trim());
    
  },
  error: function () {
    console.log("error");
  },
});

