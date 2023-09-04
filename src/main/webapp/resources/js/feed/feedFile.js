const fileList = document.getElementById("fileList");
const add = document.getElementById("add");
// const df = document.getElementsByClassName("df"); 
const deletes = document.getElementsByClassName("deletes");

let max = 10;
let count = 0;

if(deletes != null) {
    count = deletes.length;
}
let idx = 0;


// del 버튼 클릭하면 삭제하겠다
for(del of deletes){
    del.addEventListener("click", function(){
        let fileNum = this.getAttribute("data-delete-num");
        let check = confirm("정말로 삭제하시겠습니까?");

        if(check){
            fetch("./fileDelete?fileNum=" + fileNum, {method:"get"})
                .then((result)=>{return result.text()}) // result.text를 반환받겠다
                .then((r)=>{
                    //  console.log("삭제 결과", r) 
                    if(r.trim()=='1'){
                        $(this).parent().remove();
                        // this.remove();
                        count--;
                    }
                })
        }
    })
}


//삭제 확인
// $('.deleteCheck').click(function(){
//     let result = confirm('파일이 영구히 삭제됩니다.')
//     let ch = $(this);
//     if(result){
//         let imgNum = $(this).val();
//         $.ajax({
//             type:'POST',
//             url:'./imgDelete',
//             data:{
//                 imgNum: imgNum
//             },
//             success:function(response){
//                 if(response.trim() > 0) {
//                     alert('삭제되었습니다.')
//                     ch.parent().parent().remove();
//                     count--;
//                 } else {
//                     alert('삭제 실패<br>관리자에게 문의하세요.')
//                 }
//             },
//             error:function(){}
//         })
//     } else {
//         $(this).prop('checked', false)
//     }
// })

// add에 파일첨부 추가하기
$("#add").click(function(){

    if(count>=max){
        alert("최대 10개까지 추가할 수 있습니다.");
        return;
    }
    count++;    


  	let f = '<div class="input-group mb-3" id="file'+idx+'">';
    
    f = f + '<input type="file" name="photos" class="form-control" id="pic">';
    f = f + '<button type="button" class="btn btn-primary df"> X </button>';
    f = f + '</div>';
    idx++;

    $("#fileList").append(f);

})

// add에 파일첨부 메뉴 추가한거 지우기
$("#fileList").on("click", ".df", function(){
    $(this).parent().remove();
    count--;
})