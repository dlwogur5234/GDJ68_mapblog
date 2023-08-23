<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1b5744597ccc65933ecad3607daed47e"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	 <div id="map" style="width:1000px;height:800px;"></div>
    <div id="clickLatlng"></div>
    <p id="result"></p>

    <form class="mb-5 text-center form-control" action="./update" method="post" id="frm">
	    <input type="hidden" name=meetingNum value="${dto.meetingNum }">
	    <input type="hidden" name="id" value="${sessionScope.member.id }">
	    <input type="text" name="title" id="title" value="${dto.title }">
	    <textarea class="input-group" rows="" cols="" name="contents" id="contents" value="${dto.contents }"></textarea>
	    <input type="date" name="meetingDate" value="${dto.meetingDate }">
	    <input type="hidden" name="lat" id="lat" value="${dto.lat}">
	    <input type="hidden" name="lng" id="lng" value="${dto.lng}">
	
		<button id="btn" type="button">등록</button>

   	</form>

    <script src="../resources/js/meeting/update.js"></script>
    <script>
    
    const btn = document.getElementById("btn");
    const title = document.getElementById("title");
	const frm = document.getElementById("frm");
         $("#contents").summernote({
            height:400,
            callbacks:{
                onImageUpload:function(files){
                alert('이미지 업로드')
                //이미지를 server로 전송하고
                //응답으로 이미지경로와 파일명을 받아서
                //img 태그를 만들어서 src속성에 이미지경로는 넣는것
                let formData = new FormData();//<form></form>
                formData.append('files',files[0]);//<input type='file' name='files'>
                $.ajax({
                    type:'post',
                    url:'setContentsImg',
                    data:formData,
                    cashe: false,
                    enctype:'multipart/form-data',
                    contentType: false,
                    processData: false,
                    success:function(result){
                        $("#contents").summernote("insertImage",result.trim());
                    },
                    error:function(){
                        console.log('error');
                    }
                });
                },
				onMediaDelete:function(files){
					let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명
					$.ajax({
						type:'post',
						url:'./setContentsImgDelete',
						data:{
							path:path
						},
						success:function(result){
							console.log(result);
						},
						error:function(){
							console.log('error');
						}
					})
				}
            }
        }); 


		btn.addEventListener("click", function(){
			console.log(title.value=="");
			console.log(title.value.length == 0);
			if(title.value==""){
				alert('제목은 필수 입니다.');
				title.focus();
			}else {
				frm.submit();
			}
		});
    </script>
</body>
</html>