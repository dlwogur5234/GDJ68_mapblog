
// let commentId = $('#commentId').val();
// let commentContents = $('#commentContents').val();


$('#addComment').on('click',function(){
    ms = $('#meetingNum2').val();
    commentId = $('#commentId').val();
    nickName2 = $('#nickName').val();
    $.ajax({
        type:"POST",
        url:"./addComment",
        data:{
            meetingNum:ms,
            id:commentId,
            nickName:nickName2,
            contents:$('#commentContents').val()
        },
        success: function(){
            alert('작성 성공');
            ms = $('#meetingNum2').val();
            $.ajax({
                type:"GET",
                url:"./getComment?meetingNum="+ms,
                    success: function(r){
                        $('#commentContents').val("")
                        $('#commentList').html(r);
                    }
                })	
        },
        error:function(){
            alert('댓글 작성 실패');
        }
    })
})

function getList(){
    ms = $('#meetingNum2').val();
    $.ajax({
        type:"GET",
        url:"./getComment?meetingNum="+ms,
            success: function(r){
                $('#commentList').html(r);
            }
        })	
};

$(document).ready(function(){
	ms = $('#meetingNum2').val();
	$.ajax({
            type:"GET",
            url:"./getComment?meetingNum="+ms,
            success: function(r){
                $('#commentList').html(r);
            }
        })	

});

// $('#commentList').on('click','#btn',function(){
//     console.log($('#commentList').attr('data-commentNum'));
//   });

//   $('#btn3').on('click',function(){
//     console.log("sdsds2");
//   });

//   $('#commentList').on('click','#btn',function(){
//     console.log("sdsds3");
//   });

//   $('.butt').on('click',function(){
//     console.log("sdsds3");
//   });


$('#commentList').on('click','.butt',function(){
    let result = confirm('정말 삭제하시겠습니까?')
    let commentNum = this.dataset.commentnum;   
    if(result){
        $.ajax({
            type:'get',
            url:'deleteComment',
            data:{
                commentNum:commentNum
            },
            success:function(result){
                getList();
            },
            error:function(){
                console.log('error');  
            } 
        })
    }
});


$('#commentList').on('click','.updateBtn',function(){
    let contents =   $(this).siblings('#updateDiv').text();
    console.log(contents);

    $(this).siblings('#updateDiv').html('<input type="text" id="contents" value="'+contents+'">');
    $(this).attr('class','updateBtn2');
    // $(this).siblings('#updateDiv').html("<input type='text' id='contents' value='" + contents + "'>");
})

$('#commentList').on('click','.updateBtn2',function(){
    let contents = $(this).siblings('#updateDiv').children('#contents').val();
    let commentNum = this.dataset.commentnum; 
    $.ajax({
        type:'post',
        url:'updateComment',
        data:{
            commentNum:commentNum,
            contents:contents
        },
        success:function(result){
            getList();
        },
        error:function(){
            console.log('error');  
        } 
    })
})


//대댓 add input 태그 
$('#commentList').on('click','.replyBtn',function(){
    let commentNum = this.dataset.commentnum;
    $(this).html('답글 등록'); 
    $(this).attr('class','replyBtn2');
    $(this).before('<input type="text" id="replyContents" data-commentNum="'+commentNum+'">');
})

//대댓 add ajax 호출 
$('#commentList').on('click','.replyBtn2',function(){
    let replyContents = $('#replyContents').val();
    let commentNum = this.dataset.commentnum;
    ms = $('#meetingNum2').val();
    commentId = $('#commentId').val();
    nickName2 = $('#nickName').val();
    $.ajax({
        type:'post',
        url:'replyCommentAdd',
        data:{
            meetingNum:ms,
            id:commentId,
            commentNum:commentNum,
            contents:replyContents,
            nickName:nickName2
        },
        success:function(){
            getList();
        },
        error:function(){
            console.log('error');
        }
    }) 
})


// 같은 버튼 다른 역할을 하게하기위한 함수 viewResult
 let viewResult = true; 
//대댓 리스트 보기
$('#commentList').on('click','#replyListBtnId',function(){
   
    if(viewResult){
            // button 에 담긴 data-commentNum 가져오기
            let commentNum = this.dataset.commentnum;
            // ajax 에서 this 요소가 달라 ajax 영역 밖에서 this를 thisElement 라는 변수에 담음
            let thisElement = $(this);
            //ajax 실행
            $.ajax({
                type:'get',
                url:'replyCommentList',
                data:{
                    cGroup:commentNum
                },
                success:function(r){
                    
                    //ajax 성공시 this 요소의 형제 노드 중 id 가 replyListDivId 를 찾아 그 하위 노드로 success r 값 추가
                    thisElement.siblings('#replyListDivId').append(r);
                    // viewResult 제어하기위해 false 값 입력
                    viewResult =!viewResult;
                },
                error:function(){
                    console.log('error')
                }
            })
    }else{
        //viewResult 가 false 일때 실행되는 영역
        $(this).siblings('#replyListDivId').empty();
        viewResult =!viewResult;
    }

})
