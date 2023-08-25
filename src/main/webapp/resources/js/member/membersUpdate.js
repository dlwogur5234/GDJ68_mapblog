const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const names = document.getElementById("name");
const email = document.getElementById("email");
const birth = document.getElementById("birth");
const fr = document.getElementById("fr");
const btn = document.getElementById("btn");

let checkResults=[false,false,false,false,false];

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

//------------------------------------------------------------------

// 이메일 인증
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
            checkResults[3]=true;
            emailResult.className="o";
            emailResult.innerHTML="이메일 인증 완료";
            alert("일치: 인증되었습니다");
		}else{
            checkResults[3]=false;
            alert("불일치: 다시 입력해주세요");
		}
	});
});