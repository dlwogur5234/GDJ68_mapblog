let count = 0;
let idx = 0;
$("#fileBtn").click(function () {
  if (count < 3) {
    let r = "<div>";
    r = r.concat('<div id="file' + idx + '">');
    r = r.concat('<label for="pic" class="form-label">사진첨부</label>');
    r = r.concat(
      '<input type="file" name="photos" class="form-control" id="pic" >'
    );
    r = r.concat('<span class="df" data-id="file' + idx + '">x</span>');
    r = r.concat("</div>");
    r = r.concat("</div>");
    $("#fileList").append(r);

    count++;
    idx++;
  } else {
    alert("파일은 3개까지만 가능합니다");
  }
});

$("#fileList").on("click", ".df", function () {
  $(this).parent().remove();
  count--;
});
