const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const names = document.getElementById("name");
const email = document.getElementById("email");
const birth = document.getElementById("birth");
const url = document.getElementById("url");
const fr = document.getElementById("fr");
const btn = document.getElementById("btn");

let checkResults=[false,false,false,false,false,false];

// PW 체크
pw.addEventListener("blur", function(){
    const pwResult = document.getElementById(pw.id+"Result")
    if(pw.value.length>5 && pw.value.length<12){
        pwResult.className="o";
        pwResult.innerHTML="사용 가능한 비밀번호";
        checkResults[0]=true;
    }else {
        pwResult.innerHTML="비밀번호는 6글자 이상 12글자 미만";
        pwResult.className="x";
        checkResults[0]=false;
    }
})

pw.addEventListener("change", function(){
    pw2.value="";
    checkResults[1]=false;
    pw2Result.innerHTML="";
})

// PW 재확인 체크
pw2.addEventListener("keyup",function(){
    const pw2Result = document.getElementById("pw2Result")
    if(pw2.value==pw.value){
        pw2Result.className="o";
        pw2Result.innerHTML="일치O"
        checkResults[1]=true;
    }else {
        pw2Result.className="x";
        pw2Result.innerHTML="일치X"
        checkResults[1]=false;
    }
});

// name 확인
names.addEventListener("blur", function(){
    let check = emptyCheck(names);
    const nameResult = document.getElementById("nameResult");
    nameResult.className="x";
    nameResult.innerHTML="이름 필수";
    checkResults[2]=false;

    if(!check){
        nameResult.className="o";
        nameResult.innerHTML="사용 가능한 이름";
        checkResults[2]=true;
    }
});

// email 체크
email.addEventListener("blur", function(){
    let check = emptyCheck(email);
    const nameResult = document.getElementById("emailResult");
    emailResult.className="x";
    emailResult.innerHTML="이메일 필수";
    checkResults[3]=false;

    if(!check){
        emailResult.className="o";
        emailResult.innerHTML="사용 가능한 이메일";
        checkResults[3]=true;
    }
});

// 생일 체크
birth.addEventListener("change",function(){
    let check = emptyCheck(birth);
    const birthResult = document.getElementById("birthResult");
    birthResult.className="x";
    birthResult.innerHTML="생일 필수";
    checkResults[4]=false;

    if(!check){
        birthResult.className="o";
        birthResult.innerHTML="OK";
        checkResults[4]=true;
    }
})

// url 체크
url.addEventListener("blur", function(){

    const urlResult = document.getElementById(url.id+"Result")
    fetch("urlCheck?url="+url.value, {method:"get"})
         .then((response)=>{return response.text()})
         .then((r)=>{
            if(r.trim()=='1'){
                if(url.value == "" || url.value.length>20){
                    urlResult.className="x";
                    urlResult.innerHTML="URL은 필수이며 20글자 미만";
                    checkResults[5]=false;
                    
                }else {
                    urlResult.className="o";
                    urlResult.innerHTML="사용 가능한 URL";
                    checkResults[5]=true;
                }
            }else {
                urlResult.className="x";
                urlResult.innerHTML="이미 사용 중인 URL";
                checkResults[5]=false;
            }
         })

});

// 변경하기 버튼
btn.addEventListener("click",function(){
    console.log(checkResults);
    let c = checkResults.includes(false);
    if(!c){
        fr.submit();
    }else {
        alert("필수 항목을 전부 입력하세요");
    }
})

//비어있는지 체크하는 함수
function emptyCheck(element){
    if(element.value==null || element.value.length==0){
        return true;
    }else {
        return false;
    }
}