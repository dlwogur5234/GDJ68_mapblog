const updateBtn = document.getElementById("update");   // update.jsp에서의 등록버튼
const updateFrm = document.getElementById("updateFrm");   // update form
const cancle = document.getElementById("cancle");              // 취소 버튼
let feedNum = document.getElementById("feedNum").value;       // feedNum

updateBtn.addEventListener("click", function(){
    if(title.value == ""){
        alert("제목을 입력해주세요.");
        title.focus();
        return;
    }
    if(contents.value == ""){
        alert("내용을 입력해주세요.");
        contents.focus();
        return;
    }

    updateFrm.submit();
});


// 취소 버튼 (글 디테일로 돌아가기)
cancle.addEventListener("click", function(){
    feedNum = feedNum * 1;
    location.href = "./detail?feedNum=" + feedNum;
})

// 체크된 publics 값 가져오면서 숫자타입으로 변환
let value = $("input:radio[name=publics]:checked").val();
value = value*1;

// update.jsp에 publics 체크상태로 가져오기
$(document).ready(function(){
    let pv = document.getElementById("publicsValue").value;
    console.log(pv*1);

    if(pv == 0){
        $("#publics0").prop("checked", true);
    } else if (pv == 1) {
        $("#publics1").prop("checked", true);
    } else if (pv == 2) {
        $("#publics2").prop("checked", true);
    }

})