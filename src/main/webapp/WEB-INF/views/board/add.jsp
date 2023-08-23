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

	<section class="container mt-5">
	
	
	<h1 class="a mb-5 text-center">Add Page</h1>
	
	
	<form action="./add" method="post" enctype="multipart/form-data">
		
		
	
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">작성자</span>
			<input type="text" id="id" name="id" class="form-control" placeholder="작성자를 입력해주세요.">
		</div>
	
	
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">제목</span>
			<input type="text" id="title" name="title" class="form-control" placeholder="내용을 입력해주세요.">
		</div>
		
		
		<div>CONTENTS</div>
		<div class="input-group mb-3">
			<textarea class="form-control" id="contents" name="contents" aria-label="With textarea" rows="10"></textarea>
		</div>
		
		<!-- 
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



		
		
		
		<!-- Upload file *************************************** -->

		<div class="container mt-4"> 사진첨부
			<div class="input-group mb-3">
				<label for="pic" class="form-label"></label><br>
				<input type="file" name="photos" class="form-control" id="pic">
			</div>
		</div>

		
		<button class="btn btn-primary btn-sm" type="submit">등록</button>
		<button class="btn btn-primary btn-sm" type="submit">취소</button>
	 
	</form>
	
	</section>
	
	

</body>
</html>