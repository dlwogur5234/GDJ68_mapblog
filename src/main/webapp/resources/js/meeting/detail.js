let ms = $('#meetingNum2').val();
let commentId = $('#commentId').val();
let commentContents = $('#commentContents').val();


$('#addComment').on('click',function(){
    $.ajax({
        type:"POST",
        url:"./addComment",
        data:{
            meetingNum:ms,
            id:commentId,
            contents:$('#commentContents').val()
        },
        success: function(){
            alert('작성 성공');
            $.ajax({
                type:"GET",
                url:"./getComment?meetingNum="+ms,
                    success: function(r){
                        $('#commentList').html(r);
                    }
                })	
        },
        error:function(){
            alert('댓글 작성 실패');
        }
    })
})


$(document).ready(function(){
	
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

  $('#btn3').on('click',function(){
    console.log("sdsds2");
  });

//   $('#commentList').on('click','#btn',function(){
//     console.log("sdsds3");
//   });

//   $('.butt').on('click',function(){
//     console.log("sdsds3");
//   });


    $('#commentList').on('click','.butt',function(){
        var commentNum2 = $(this).closest("div").data("commentNum")
        console.log(commentNum2);
        $.ajax({
            type:'get',
            url:'deleteComment',
            data:{
                commentNum:commentNum2
            },
            success:function(result){
               
            },
            error:function(){
                console.log('error');
            }
        })
    })


  