
let page = 1;

$('#myQnaList').on("click",".page-link",function(event){
					let page = $(this).attr('data-num');
					getList(page);
				})

getList(1);
function getList(page){
$.ajax({
  type: "GET",
  url: "../qna/myQnaList",
  data: {
    page: page,
  },
  success: function (response) {
    $("#myQnaList").html(response.trim());
  },
  error: function () {
    console.log("error");
  },
});
}
