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
			<span class="input-group-text" id="basic-addon1">여행날짜</span>
			<label for="tripDate" class="form-label"></label>
			<input type="date" name="tripDate" class="form-control" id="tripDate" placeholder="연도 / 월 / 일">
		</div>
		
	
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
		
		<div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" value="0" class="btn-check publics" name="publics" id="publics1" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="publics1">전체공개</label>
		  
			<input type="radio" value="1" class="btn-check publics" name="publics" id="publics2" autocomplete="off">
			<label class="btn btn-outline-primary" for="publics2">팔로워만</label>
		  
			<input type="radio" value="2" class="btn-check publics" name="publics" id="publics3" autocomplete="off">
			<label class="btn btn-outline-primary" for="publics3">비공개</label>
		</div>
		
		<!-- Upload file *************************************** -->
		<div class="mb-1">
			<button type="button" class="btn btn-primary" id="add">File 추가</button>
		</div>

		<!-- 파일첨부 추가되는 영역 -->
		<div id="fileList" class="my-5"></div>


		<button class="btn btn-primary" type="button" id="btn">등록</button>
		<button class="btn btn-primary" type="button" id="cancle">취소</button>
	 
	</form>
	
	</section>
	
<script src="/resources/js/feedFile.js"></script>
<script src="/resources/js/feedAdd.js"></script>

</body>
</html>