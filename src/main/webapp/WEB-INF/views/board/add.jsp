<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<c:import url="../temp/bootStrap.jsp"></c:import>
	
</head>
<body>
	
	<c:import url="../temp/adminHeader.jsp"></c:import>
	
	<section class="container mt-5">
	
	
	<h1 class="a mb-5 text-center">Add Page</h1>
	
	
	<form action="./add" method="post" id="frm" enctype="multipart/form-data">
		
		
	
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">작성자</span>
			<input type="text" name="id" id="id" class="form-control">
		</div>
	
	
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">제목</span>
			<input type="text" name="title" id="title" class="form-control" placeholder="내용을 입력해주세요.">
		</div>
		
		
		<div class="input-group mb-3">
			<textarea class="form-control" name="contents" id="contents" aria-label="With textarea" rows="10"></textarea>
		</div>
		
		<!-- 아직 구현 X
		<div>
			<div class="form-check">
			  <input class="form-check-input" name="publics" type="radio" id="flexRadioDefault1" value="0" checked>
			  <label class="form-check-label" for="flexRadioDefault1">
			    전체공개
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" name="publics" type="radio" id="flexRadioDefault2" value="1">
			  <label class="form-check-label" for="flexRadioDefault2">
			    팔로워만
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" name="publics" type="radio" id="flexRadioDefault2" value="2">
			  <label class="form-check-label" for="flexRadioDefault2">
			    비공개
			  </label>
			</div>
		</div>
		 -->

		 <div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="btnradio1">전체공개</label>
		  
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			<label class="btn btn-outline-primary" for="btnradio2">팔로워만</label>
		  
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-primary" for="btnradio3">비공개</label>
		  </div>
		
		<!-- Upload file *************************************** -->
		<div class="mb-3">
		<div class="mb-1">
			<button type="button" class="btn btn-primary" id="add">File 추가</button>
		</div>

		<!-- 파일첨부 추가되는 영역 -->
		<div id="fileList" class="my-5"></div>


		<button class="btn btn-primary" type="button" id="btn">등록</button>
		<button class="btn btn-primary" type="submit">취소</button>
	 
	</form>
	
	</section>
	
<script src="../resources/js/feedFile.js"></script>
	
<script>
	const btn = document.getElementById("btn");
	const title = document.getElementById("title");
	const frm = document.getElementById("frm")

	btn.addEventListener("click", function(){
		console.log(title.value=="");
			console.log(title.value.length == 0);

			if(title.value=="") {
				alert("제목은 필수입니다.");
				title.focus();
			} else {
				frm.submit();
			}
	})
</script>

</body>
</html>