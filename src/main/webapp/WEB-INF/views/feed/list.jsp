<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Kakao Map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5744597ccc65933ecad3607daed47e&libraries=services"></script>

	<c:import url="../temp/bootStrap.jsp"></c:import>
	
</head>
<script>
	function addFollow(){
		$.ajax({
			url: '/feed/follow/add',
			type: 'post',
			data: {
				nowUrl: location.href
			}, 
			success: function(){
				alert("팔로우 추가 성공")
			}
		})
	}
	
	function deleteFollow(){
		$.ajax({
			url: '/feed/follow/deleteFollow',
			type: 'post',
			data: {
				nowUrl: location.href
			},
			success: function(){
				alert("팔로우 취소 성송")
			}
		})
	}
	
</script>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div>
	<h1 class="a mb-5 text-center">Feed List</h1>
	
	<div id="followList"></div> 
	<button type="button" onclick="addFollow()">팔로우</button>
	
	
	<button type="button" onclick="deleteFollow()">삭제</button>
	
	</div>

	<!-- div.container start -->
	<div class="conatiner">

		<!-- div.row g-2 start -->	
		<div class="row g-2">
			<!-- kakao map -->
			<div class="container col-md-6">
				<input type="text" id="adrs"><button id="btn2" type="button">검색</button>
				<div id="map" style="width:900px;height:700px;float:left;border: solid 1px;margin-right: 300px;"></div>
				<c:forEach items="${list}" var="d" varStatus="i">
					<div class="a" data-meetingNum="${d.feedNum}" data-contents="${d.contents}" data-title="${d.title}" data-lat="${d.lat}" data-lng="${d.lng}" id="${i.index}"></div>
					</c:forEach>
				<div id="address"></div>
			</div>



				<div class="col-md-6 sideBar">
					<div class="sideBar--wrap">
						<div class="row row-cols-md-3 g-3">
							<c:forEach items="${list}" var="f" varStatus="i">

								<!-- feedNum hidden처리 -->
								<input type="hidden" id="feedNum" name="feedNum" value="${f.feedNum}">

								<!-- 위도/경도 (숨김) -->
								<input type="hidden" name="lat" id="lat" value="${f.lat}">
								<input type="hidden" name="lng" id="lng" value="${f.lng}">

								<div class="col">
									<div class="card shadow-sm">
										<svg class="bd-placeholder-img card-img-top" width="80%" height="225" xmlns="http://www.w3.org/2000/svg"
											role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">

											<!-- 제목 밑에 있는 회색부분 -->
											<rect width="100%" height="100%" fill="#55595c"></rect>

											<!-- 이미지 -->
											<a class="text-white link-offset-2 link-underline link-underline-opacity-0" href="../detail?feedNum=${f.feedNum}">
											<image class="img" href="/resources/img/99A85F3C5C0DC6AD29.jpeg" style="width:100%; height:200px;" />
											<text id="title" x="5%" y="95%" fill="#eceeef" dy=".3em">${f.title}</text>
											</a>

										</svg>

										<div class="card-body" style="position:relative; width:100%;">
										<small class="text-muted text-start" style="position:relative; float:left;">${f.createDate}</small>
										<button type="button" id="likes" style="position:relative; float:right;" class="btn btn-sm btn-outline-secondary justify-content-end">♡ ${f.likes}</button>
										<button type="button" id="findMarker" style="position:relative; float:right;" class="btn btn-sm btn-outline-secondary justify-content-end">지도보기</button>
										</div>

										<div style="clear:both"></div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				


		</div>
		<!-- div.row g-2 end -->

	</div>
	<!-- div.container end -->

	<!-- 전체 페이지 수 -->
	<input type="hidden" name="totalPage" id="totalPage" value="${pager.totalPage}">

	<!-- Loading Spinner -->
	<!-- <div class="spinner-border text-primary" role="status">
		<span class="visually-hidden">Loading...</span>
	</div> -->


	<!-- Pager -->
	<!-- <nav class="container" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pager.pre}">
				<li class="page-item"><a class="page-link" href="./list?page=${pager.startNum-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li class="page-item move"><a class="page-link" href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.next}">
			<li class="page-item move"><a class="page-link" href="./list?page=${pager.lastNum+1}">Next</a></li>
			</c:if>
		</ul>
	</nav> -->


	<!-- 글쓰기 버튼 -->
	<c:if test="${not empty member}">
		<a class="btn btn-primary" href="./add">글쓰기</a>
	</c:if>

	<!-- 검색 Search -->
	<div class="d-inline-flex p-2 justify-content-center">
		<form class="input-group" action="./list" method="get">
			<select name="kind" class="form-select rounded" style="width:100px" aria-label="Default select example">
				<option value="title">제목</option>
				<option value="contents">내용</option>
			</select>
			<input type="text" name="search" class="form-control rounded me-2" style="width:280px" aria-label="Amount (to the nearest dollar)">
			<div class="col-auto">
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>


	<!-- 로그인 안 했을 시에 로그인 페이지로 보내줌 -->
	<c:if test="${sessionScope.member.id == null}">
		<script>
			alert("로그인 하신 후에 사용해주세요");
			location.href="../member/login"; 
			</script>
	</c:if>
	
	
	<script src="/resources/js/feed/feedMapList.js" defer></script>
	<script src="/resources/js/follow/followList.js"></script>



</body>
</html>