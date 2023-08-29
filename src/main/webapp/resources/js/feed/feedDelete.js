const del = document.getElementById("del");
const c1 = document.getElementsByClassName("c1");
const frm = document.getElementById("frm");


// let feedNum;

// function setFeedNum(feedNum){
//     feedNum=feedNum;
// }

for(c of c1) {
    c.addEventListener("click", function(){
        let url = this.getAttribute("data-url");

        if(url == "delete") {
            let result = confirm("정말로 삭제하시겠습니까?");

            if(!result) {
                return;
            }

            // url이 delete면 method 속성을 post로 바꾸도록
            frm.method = "post";
        }

        frm.action = url;
        frm.submit();
    })
}


// list (목록으로 돌아가기)
$("#list").click(function(){
    location.href = "./list";
})

// 취소 버튼
$("#cancle").click(function(){
    location.href = "./list";
})