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


// summernote		 
let markupStr = $('#summernote').summernote('code');

// summernote
$("#contents").summernote({
    height : 400,
    callbacks : {
    onImageUpload : function(files){
        alert('이미지 업로드');
        // 이미지를 server로 전송하고
        // 응답으로 이미지경로와 파일명을 받아서
        // img태그를 만들어서 src속성에 이미지 경로를 넣는 것

        let formData = new FormData();	// <form></form>
        formData.append("files", files[0]);
        // 위의 form태그에 <input type="file" name="files">를 append

        $.ajax({
            type : 'post',
            url : 'setContentsImg',
            data : formData,
            // 원래는 data 안에  {} 괄호를 사용해서 객체를 넣어주는데 이미 위에서
            // data를 formData 객체로 선언을 해줬기 때문에 formData만 쓴 것.
            enctype : 'maltipart/form-data',
            cache:false,
            contentType : false,
            processData : false,
            success : function(result){
                $("#contents").summernote('insertImage', result.trim());
            },
            error : function(){
                console.log("error");
            }
        })

    },

    onMediaDelete:function(files){
        let path = $(files[0]).attr("src");	// /resources/upload/feed/파일명

        $.ajax({
            type : 'post',
            url : './setContentsImgDelete',
            data : {
                path:path
            },
            success : function(result){
                console.log(result);
            },
            error : function(){
                console.log("error");
            }
        })		
    }
}
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

