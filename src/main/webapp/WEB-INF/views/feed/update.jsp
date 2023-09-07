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
	
		<h1 class="a mb-5 text-center">Update Page</h1>

		<!-- Kakao Map -->
		<input type="text" id="adrs"><button id="btn2" type="button">검색</button>
		<div id="map" style="width:650px;height:650px;"></div>
		<div id="clickLatlng"></div>
		<p id="result"></p>
			

		<form action="./update" method="post" id="updateFrm" enctype="multipart/form-data">
			
			
			<!-- feedNum (숨김) -->
			<input type="hidden" name="feedNum" id="feedNum" value="${dto.feedNum}">
			<!-- 작성자 (숨김) -->
			<input type="hidden" name="id" value="${sessionScope.member.id}">

			<!-- 여행날짜 -->
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">여행날짜</span>
				<label for="tripDate" class="form-label"></label>
				<input type="date" name="tripDate" class="form-control" id="updateTripDate" value="${dto.tripDate}">
			</div>

			<!-- 위도/경도 (숨김) -->
			<input type="hidden" name="lat" id="lat" value="${dto.lat}">
			<input type="hidden" name="lng" id="lng" value="${dto.lng}">
			
			<!-- 제목 -->
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">제목</span>
				<input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요." value="${dto.title}">
			</div>
			
			<!-- 내용 -->
			<div class="input-group mb-3">
				<textarea class="form-control" name="contents" id="contents" aria-label="With textarea" rows="10" value="${dto.contents}">${dto.contents}</textarea>
			</div>


			<!-- publics 값 가져오기 (숨김) -->
			<input type="hidden" id="publicsValue" name="publicsValue" value="${dto.publics}">
			
			<!-- publics -->
			<div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" value="0" class="btn-check publics" name="publics" id="publics0" autocomplete="off">
				<label class="btn btn-outline-primary" for="publics0">전체공개</label>
			
				<input type="radio" value="1" class="btn-check publics" name="publics" id="publics1" autocomplete="off">
				<label class="btn btn-outline-primary" for="publics1">팔로워만</label>
			
				<input type="radio" value="2" class="btn-check publics" name="publics" id="publics2" autocomplete="off">
				<label class="btn btn-outline-primary" for="publics2">비공개</label>
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
				<c:forEach items="${dto.dtos}" var="f">
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

			<button class="btn btn-primary c1" type="submit" id="update" data-url="update">등록</button>
			<button class="btn btn-primary c1" type="button" id="cancle">취소</button>
		
		</form>
	
	</section>
	
<script src="/resources/js/feed/feedFile.js"></script>
<script src="/resources/js/feed/feedUpdate.js"></script>
<script src="/resources/js/feed/feedUpdateMap.js" defer></script>



<script type="text/javascript">
	// $("#contents").summernote('code');
</script>

</body>
</html>