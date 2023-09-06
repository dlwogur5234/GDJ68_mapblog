
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