// // 댓글 관련 script

//     let fn = document.getElementById("feedNum");
//     let pageNum = 1;
//     let tp=0;

//     $("#commentAdd").click(function(){
//         let contents = $("#comment").val();
//         $.ajax({
//             type : 'post',
//             url : 'commentAdd',
//             data : {
//                 // 앞의 이름은 파라미터 이름이기 때문에 
//                 // DTO의 변수명과 똑같이 해주기
//                 feedNum : fn,
//                 commentContents : contents
//             },
//             success : function(result){
//                 if(result.trim()>0){
//                     alert("댓글등록 완료");
//                     $("#commentList").empty();
//                     $("#comment").val("");
//                     pageNum=1;
//                     getCommentList(fn, 1);
//                 }
//             }
//         })
//     })

//     $("#more").on("click","#moreButton", function(){

//         if(pageNum>=tp){
//             alert('마지막 페이지');
//             return;
//         }

//         pageNum++;
//         getCommentList(fn, pageNum);
//     })

//     getCommentList(fn, pageNum);

//     function getCommentList(feedNum, page){
//         $.ajax({
//             type : "get",
//             url : "./commentList",
//             data : {
//                 feedNum:feedNum,
//                 page:page
//             },
//             success : function(result){
//                 console.log(result)
//                 $("#commentList").append(result);
//                 tp = $("#totalPage").attr("data-totalPage");
//                 let button = '<button id="moreButton">더보기('+ pageNum +'/' + tp +')</button>'
//                 $("#more").html(button);
//             },
//             error : function(){
//                 alert("관리자에게 문의해주세요.");
//             }
//         })
//     }



/* ------------------------------------------------------------------------------------------ */

