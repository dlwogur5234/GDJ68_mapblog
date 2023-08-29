const btn = document.getElementById("btn");
const c1 = document.getElementById("c1");
const c2 = document.getElementById("c2");
const c3 = document.getElementById("c3");
const a = document.getElementById("a");

btn.addEventListener("click", function(){
   
    if(c1.checked && c2.checked && c3.checked){
        window.location.href = "./join";
    }else{
        alert("필수 동의 사항에 대해 모두 동의해주세요.");
    }
})


a.addEventListener("click", function(){
    if(a.checked==true){
        c1.checked=true;
        c2.checked=true;
        c3.checked=true;
    }else{
        c1.checked=false;
        c2.checked=false;
        c3.checked=false;
    }
})