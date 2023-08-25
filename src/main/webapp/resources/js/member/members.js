const id = document.getElementById("id");
const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const names = document.getElementById("name");
const email = document.getElementById("email");
const birth = document.getElementById("birth");
const btn = document.getElementById("btn");
const fr = document.getElementById("fr");
const url = document.getElementById("url");
const nickName = document.getElementById("nickName");



let checkResults=[false,false,false,false,false,false,false,false,false];

// ID 중복 체크
id.addEventListener("blur", function(){

    const idResult = document.getElementById(id.id+"Result")
    fetch("idCheck?id="+id.value, {method:"get"})
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

// name 확인
names.addEventListener("blur", function(){
    let check = emptyCheck(names);
    const nameResult = document.getElementById("nameResult");
    nameResult.className="x";
    nameResult.innerHTML="이름 필수";
    checkResults[4]=false;

    if(!check){
        nameResult.className="o";
        nameResult.innerHTML="사용 가능한 이름";
        checkResults[4]=true;
    }
});

// 생일 체크
birth.addEventListener("change",function(){
    let check = emptyCheck(birth);
    const birthResult = document.getElementById("birthResult");
    birthResult.className="x";
    birthResult.innerHTML="생일 필수";
    checkResults[6]=false;

    if(!check){
        birthResult.className="o";
        birthResult.innerHTML="OK";
        checkResults[6]=true;
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
                    checkResults[7]=false;
                    
                }else {
                    urlResult.className="o";
                    urlResult.innerHTML="사용 가능한 URL";
                    checkResults[7]=true;
                }
            }else {
                urlResult.className="x";
                urlResult.innerHTML="이미 사용 중인 URL";
                checkResults[7]=false;
            }
         })

});

// 회원 가입 버튼
btn.addEventListener("click",function(){
    console.log(checkResults);
    let c = checkResults.includes(false);
    if(!c){
        alert("회원가입 완료. 로그인해주세요");
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

//----------------------------------------------------------

// 이메일 인증
email.addEventListener('change', function(){
    checkResults[5]=false;
    emailResult.className="x";
    emailResult.innerHTML="이메일 인증 필수 (인증버튼 클릭 후 약 10초 후 메일 도착)";
})

let code;

$('#emailBtn').click(function() {

    const email = $('#email').val(); // 이메일 주소값 얻어오기
    const checkInput = $('#emailCheckNum') // 인증번호 입력하는곳
    const url1 = '/member/emailCheck?email='+email

    $.ajax({
        type : 'GET',
        url : url1,
        success : function (data) {
            checkInput.attr('disabled', false);
            code = data.trim();
            alert('인증번호가 전송되었습니다.')     
        }			
    });

$('#emailCheckNum').blur(function () {
	const inputCode = $(this).val();
	console.log(code);

		if(inputCode === code){
            checkResults[5]=true;
            emailResult.className="o";
            emailResult.innerHTML="이메일 인증 완료";
            alert("일치: 인증되었습니다");
		}else{
            checkResults[5]=false;
            alert("불일치: 다시 입력해주세요");
		}
	});
});

// 닉네임 중복 체크
nickName.addEventListener("blur", function(){

    const nickNameResult = document.getElementById(nickName.id+"Result")
    fetch("nickNameCheck?nickName="+nickName.value, {method:"get"})
         .then((response)=>{return response.text()})
         .then((r)=>{
            if(r.trim()=='1'){
                if(nickName.value == "" || nickName.value.length>6){
                    nickNameResult.innerHTML="닉네임은 필수이며 최대 6글자";
                    nickNameResult.className="x";
                    checkResults[8]=false;
                    
                }else {
                    nickNameResult.innerHTML="사용 가능한 닉네임";
                    nickNameResult.className="o";
                    checkResults[8]=true;
                }
            }else {
                nickNameResult.innerHTML="이미 사용 중인 닉네임";
                nickNameResult.className="x";
                checkResults[8]=false;
            }
         })

});