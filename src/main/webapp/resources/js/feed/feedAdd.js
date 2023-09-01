
const addBtn = document.getElementById("addBtn");   // add.jsp에서의 등록버튼
const addFrm = document.getElementById("addFrm");   // add form
let title = document.getElementById("title");       // title
let contents = document.getElementById("contents"); // contents
let tripDate = document.getElementById("tripDate"); // tripDate


// 체크된 publics 값 가져오면서 숫자타입으로 변환
let value = $("input:radio[name=publics]:checked").val();
value = value*1;


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


// 취소
$("#cancle").click(function(){
    location.href = "./list";
})


