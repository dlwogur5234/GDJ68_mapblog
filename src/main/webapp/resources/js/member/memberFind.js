const email = document.getElementById("email");
const result = document.getElementById("result");

checkResults=false;

email.addEventListener('change', function(){

    checkResults=false;
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
            checkResults=true;
            emailResult.className="o";
            emailResult.innerHTML="이메일 인증 완료";
            alert("일치: 인증되었습니다");
		}else{
            checkResults=false;
            alert("불일치: 다시 입력해주세요");
		}
	});
});

// 아이디/비밀번호 얻기 버튼
btn.addEventListener("click",function(){
    console.log(checkResults);
    if(checkResults){
        const emailForFind = $('#email').val(); // 이메일 주소값 얻어오기
        const url2 = '/member/findIdPw?email='+emailForFind
    
        $.ajax({
            type : 'GET',
            url : url2,
            success : function (data) {
                code = data.trim();
                result.innerHTML = "<h2>"+code+"</h2>";
            }			
        });
    }else {
        alert("이메일 인증 완료 후 눌러주세요");
    }
})



