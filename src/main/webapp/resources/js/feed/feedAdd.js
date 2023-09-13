
const addBtn = document.getElementById("addBtn");   // add.jsp에서의 등록버튼
const addFrm = document.getElementById("addFrm");   // add form
let title = document.getElementById("title");       // title
let contents = document.getElementById("contents"); // contents
let tripDate = document.getElementById("tripDate"); // tripDate


// 체크된 publics 값 가져오면서 숫자타입으로 변환
let value = $("input:radio[name=publics]:checked").val();
value = value*1;


// 함수
let feedNum;

function setFeedNum(feedNum) {
    feedNum = feedNum;
}


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
            cache:false,            // multipart/form-data에서 필수
            contentType : false,    // multipart/form-data에서 필수
            processData : false,    // multipart/form-data에서 필수
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


// 글 ADD
    addBtn.addEventListener("click", function(){
    

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
        if(tripDate.value == ""){
            alert("여행날짜를 입력해주세요.");
            // tripDate.focus();
            return;
        }
        
        // 폼에 입력한 데이터를 서버로 전송
        addFrm.submit();
    });


// 취소 버튼
$("#cancle").click(function(){
    location.href = "./list/" + $("#url").val();
})