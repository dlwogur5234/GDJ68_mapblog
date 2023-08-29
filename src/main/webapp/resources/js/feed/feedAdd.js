const btn = document.getElementById("btn");         // add.jsp에서의 등록버튼
const title = document.getElementById("title");     // title
const frm = document.getElementById("frm")
const update = document.getElementById("update")    // detail.jsp에서의 수정버튼


// publics 값 숫자타입으로
let value = $("input:radio[name=publics]:checked").val();
value = value*1;



// 글 ADD
btn.addEventListener("click", function(){
    console.log(title.value=="");
        console.log(title.value.length == 0);

        if(title.value=="") {
            alert("제목은 필수입니다.");
            title.focus();
        } else {
            frm.submit();
        }
})


// 취소
$("#cancle").click(function(){
    location.href = "./list";
})


