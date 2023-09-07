<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<c:import url="../temp/bootStrap.jsp"></c:import>

	<!-- Kakao Map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5744597ccc65933ecad3607daed47e&libraries=services"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
</head>
<body>
	
	<c:import url="../temp/header.jsp"></c:import>
	
	<section class="container mt-5">
	
		<h1 class="a mb-5 text-center">Add Page</h1>
		

		<!-- Kakao Map -->

		<!-- 검색 -->
		<div class="input-group mb-3">
			<input type="text" id="adrs" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button" id="btn2 button-addon2">검색</button>
		</div>

		<!-- 지도 -->
		<div id="map" class="mt-3" style="width:650px;height:650px;"></div>
		<div id="clickLatlng"></div>
		<p id="result"></p>

		
		
		<form action="./add" method="post" id="addFrm" enctype="multipart/form-data">
			
			<!-- 작성자 (숨김) -->
			<input type="hidden" name="id" value="${sessionScope.member.id}">
			
			<!-- 여행날짜 -->
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">여행날짜</span>
				<label for="tripDate" class="form-label"></label>
				<input type="date" name="tripDate" class="form-control" id="tripDate" placeholder="연도 / 월 / 일">
			</div>
			
			<!-- 위도/경도 (숨김) -->
			<input type="hidden" name="lat" id="lat">
			<input type="hidden" name="lng" id="lng">

			<!-- 제목 -->
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">제목</span>
				<input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요.">
			</div>

			<!-- 내용 -->
			<div class="input-group mb-3">
				<textarea class="form-control" name="contents" id="contents" aria-label="With textarea" rows="10"></textarea>
			</div>
			
			<!-- 글 공개여부 -->
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


			<button class="btn btn-primary" type="button" id="addBtn">등록</button>
			<button class="btn btn-primary" type="button" id="cancle">취소</button>
		
		</form>
	
	</section>
	
<script src="/resources/js/feed/feedFile.js"></script>
<script src="/resources/js/feed/feedAdd.js"></script>
<script src="/resources/js/feed/feedAddMap.js" defer></script>

</body>
</html>