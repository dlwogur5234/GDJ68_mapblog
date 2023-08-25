alert("네이버 ID 인증되었습니다. 추가 정보를 입력하여 회원가입을 완료해주세요");

const id = document.getElementById("id");
const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const birth = document.getElementById("birth");
const url = document.getElementById("url");
const nickName = document.getElementById("nickName");
const fr = document.getElementById("fr")
const btn = document.getElementById("btn")

let checkResults=[false,false,false,false,false,false.false];

// ID 중복 체크
id.addEventListener("blur", function(){

    const idResult = document.getElementById(id.id+"Result")
    fetch("../member/idCheck?id="+id.value, {method:"get"})
         .then((response)=>{return response.text()})
         .then((r)=>{
            if(r.trim()=='1'){
                if(id.value == "" || id.value.length>10){
                    idResult.innerHTML="ID는 필수이며 10글자 미만";
                    idResult.className="x";
                    checkResults[0]=false;
                    checkResults[1]=false;
                    
                }else {
                    idResult.innerHTML="사용 가능한 ID";
                    idResult.className="o";
                    checkResults[0]=true;
                    checkResults[1]=true;
                }
            }else {
                idResult.innerHTML="이미 사용 중인 ID";
                idResult.className="x";
                checkResults[0]=false;
                checkResults[1]=false;
            }
         })
});

// PW 체크
pw.addEventListener("blur", function(){
    const pwResult = document.getElementById(pw.id+"Result")
    if(pw.value.length>5 && pw.value.length<12){
        pwResult.className="o";
        pwResult.innerHTML="사용 가능한 비밀번호";
        checkResults[2]=true;
    }else {
        pwResult.innerHTML="비밀번호는 6글자 이상 12글자 미만";
        pwResult.className="x";
        checkResults[2]=false;
    }
})

pw.addEventListener("change", function(){
    pw2.value="";
    checkResults[3]=false;
    pw2Result.innerHTML="";
})

// PW 재확인 체크
pw2.addEventListener("keyup",function(){
    const pw2Result = document.getElementById("pw2Result")
    if(pw2.value==pw.value){
        pw2Result.className="o";
        pw2Result.innerHTML="일치O"
        checkResults[3]=true;
    }else {
        pw2Result.className="x";
        pw2Result.innerHTML="일치X"
        checkResults[3]=false;
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
    fetch("../member/urlCheck?url="+url.value, {method:"get"})
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

// 회원 가입 버튼
btn.addEventListener("click",function(){
    console.log(checkResults);
    let c = checkResults.includes(false);
    if(!c){
        alert("회원가입 완료. 등록하신 아이디로 로그인 또는 네이버 인증을 통해 로그인하시면 됩니다");
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

// 닉네임 중복 체크
nickName.addEventListener("blur", function(){

    const nickNameResult = document.getElementById(nickName.id+"Result")
    fetch("../member/nickNameCheck?nickName="+nickName.value, {method:"get"})
         .then((response)=>{return response.text()})
         .then((r)=>{
            if(r.trim()=='1'){
                if(nickName.value == "" || nickName.value.length>6){
                    nickNameResult.innerHTML="닉네임은 필수이며 최대 6글자";
                    nickNameResult.className="x";
                    checkResults[6]=false;
                    
                }else {
                    nickNameResult.innerHTML="사용 가능한 닉네임";
                    nickNameResult.className="o";
                    checkResults[6]=true;
                }
            }else {
                nickNameResult.innerHTML="이미 사용 중인 닉네임";
                nickNameResult.className="x";
                checkResults[6]=false;
            }
         })

});