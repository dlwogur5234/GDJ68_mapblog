const gd = document.getElementsByClassName("goDetail");
let feedNum = document.getElementById("feedNum").value *1;


$(".goDetail").click(function(){
    location.href = "./detail?feedNum=" + feedNum;
})

