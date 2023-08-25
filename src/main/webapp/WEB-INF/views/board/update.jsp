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
	
	
	<h1 class="a mb-5 text-center">Update Page</h1>
	
	
	<form action="./update" method="post" id="frm" enctype="multipart/form-data">
		
		
		<!-- feedNum hidden 처리 -->
		<input type="hidden" name="feedNum" value="${dto.feedNum}">


		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">여행날짜</span>
			<label for="tripDate" class="form-label"></label>
			<input type="date" name="tripDate" class="form-control" id="updateTripDate" value="${tripDate}">
		</div>
		

		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">작성자</span>
			<input type="text" name="id" id="id" class="form-control" value="${dto.id}">
		</div>
	
	
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">제목</span>
			<input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요." value="${dto.title}">
		</div>
		
		
		<div class="input-group mb-3">
			<textarea class="form-control" name="contents" id="contents" aria-label="With textarea" rows="10">${dto.contents}</textarea>
		</div>
		
		<div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" value="0" class="btn-check publics" name="publics" id="btnradio1" autocomplete="off">
			<label class="btn btn-outline-primary" for="btnradio1">전체공개</label>
		  
			<input type="radio" value="1" class="btn-check publics" name="publics" id="btnradio2" autocomplete="off">
			<label class="btn btn-outline-primary" for="btnradio2">팔로워만</label>
		  
			<input type="radio" value="2" class="btn-check publics" name="publics" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline-primary" for="btnradio3">비공개</label>
		</div>
		
		<!-- Upload file *************************************** -->
		<div class="mb-1">
			<button type="button" class="btn btn-primary" id="add">File 추가</button>
		</div>

		<!-- 파일첨부 추가되는 영역 -->
		<div id="fileList" class="my-5">
		</div>

		<!-- 첨부되어있는 파일 -->
		<div>		
			<c:forEach items="${dto.fileDTOs}" var="f">
				<!-- <div class="input-group mb-3">
					<label for="pic" class="form-label"></label><br>
					<input type="file" value="${f.originalName}" name="photos" class="form-control" id="pic" placeholder="제목을 입력해주세요.">
				</div> -->

				<div class="alert alert-primary" role="alert">
					${f.originalName}
					<button type="button" class="btn btn-primary deletes" data-delete-num="${f.fileNum}"> X </button>
				</div>
			</c:forEach>
		</div>

		<button class="btn btn-primary c1" data-url="update" id="update" data-delete-name="feedNum" data-delete-num="${dto.feedNum}">등록</button>
		<button class="btn btn-primary" type="button" id="cancle">취소</button>
	 
	</form>
	
	</section>
	
<script src="/resources/js/feedFile.js"></script>
<script src="/resources/js/feedDelete.js"></script>

</body>
</html>