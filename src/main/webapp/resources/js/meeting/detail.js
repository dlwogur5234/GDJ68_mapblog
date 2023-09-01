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