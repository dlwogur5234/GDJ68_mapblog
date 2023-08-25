
let page = 1;

      $.ajax({
        type: "GET",
        url: "../follow/list",
        data: {
          page: page,
        },
        success: function (response) {
          $("#followList").html(response.trim());
        },
        error: function () {
          console.log("error");
        },
      });