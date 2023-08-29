<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.x {color: red;}
	.o {color: green;}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h1 class="my-4">프로필 사진 변경</h1>

    <form action="./updateImg" method="post" id="fr" enctype="multipart/form-data">
		<div>
			<label for="pic" class="form-label">변경할 사진</label><br>
			<input type="file" name="photo" class="form-control" id="pic">
		</div>
        <input type="hidden" name="id" value="${memberFile.id}">
        <input type="hidden" name="fileNum" value="${memberFile.fileNum}">
        <input type="hidden" name="fileName" value="${memberFile.fileName}">
        <input type="hidden" name="originalName" value="${memberFile.originalName}">
    </form><br>

    <div class="mb-3">
		<input type="button" class="btn btn-primary" id="btn" value="변경하기">
	</div>
	
	<script>
        const btn = document.getElementById("btn");
        const fr = document.getElementById("fr");
        const pic = document.getElementById("pic");
        let conf = false;

        pic.addEventListener('change', function(){
           conf = true;
        })

        btn.addEventListener('click', function(){
            if(conf){
                fr.submit();
            }else{
                alert("변경할 사진을 선택해주세요");
            }
        })
    </script>
</body>
</html>