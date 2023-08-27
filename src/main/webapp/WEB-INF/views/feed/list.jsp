<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d19d0bc22748e1c8a814e507a6e96ed2"></script>
	<c:import url="../temp/bootStrap.jsp"></c:import>
	
</head>
<body>
	
	<c:import url="../temp/header.jsp"></c:import>

	<h1 class="a mb-5 text-center">Feed List</h1>


	<!-- 지도 담을 영역 -->
	<div id="map" style="width:600px;height:600px;"></div>

	<div>
        <input type="text" id="searchMap">
        <button id="searchMapBtn">검색</button>
    </div>

    <div id="address"></div>

<!-- 	
	<div class="photoList">
		<div class="title_area">
			<h4><strong class="blind">리스트</strong></h4>
		</div>

		<ul>
			<c:forEach items="${requestScope.list}" var="f" varStatus="i">
				<li>
					<p class="thumb">
						<a href="">
							<img src="#" alt="">
						</a>
					</p>
					<a href="#"><strong>${f.title}</strong></a>
					<p class="createDate">${f.createDate}</p>
				</li>

			</c:forEach>
		</ul>

	</div>
	 -->



	

	<table class="table table-striped-columns table-hover mt-5">
	
	  <thead class="table table-dark text-center">
	    <tr>
	      <th>글번호</th>
	      <th>작성자</th>
	      <th>제목</th>
	      <th>작성날짜</th>
	      <th>여행날짜</th>
	      <th>조회수</th>
	      <th>좋아요</th>
	    </tr>
	  </thead>
	  
	  <tbody>
		<c:forEach items="${requestScope.list}" var="f" varStatus="i">	    
			<tr>
				<td class="text-center">${f.feedNum}</td>
				<td>${f.id}</td>
				<td><a class="td text-black link-offset-2 link-underline link-underline-opacity-0" href="./detail?feedNum=${f.feedNum}">
				${f.title}</a></td>
				<td>${f.createDate}</td>
				<td>${f.tripDate}</td>
				<td>${f.hit}</td>
				<td>${f.likes}</td>
			</tr>
		</c:forEach>
	  </tbody>
	</table>


	
	<!-- Pager -->
	<nav class="container" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pager.pre}">
				<li class="page-item"><a class="page-link" href="./list?page=${pager.startNum-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li class="page-item move"><a class="page-link" href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
			<!--                                                             ▲ &kind=${param.kind}&search=${param.search}있던 자리 -->
			</c:forEach>
			<c:if test="${pager.next}">
			<li class="page-item move"><a class="page-link" href="./list?page=${pager.lastNum+1}">Next</a></li>
			</c:if>
		</ul>
	</nav>
	

	<!-- 글쓰기 버튼 -->
	<a class="btn btn-primary" href="./add">글쓰기</a>
	

	<!-- 검색 Search -->
<!-- 	
	<div class="d-inline-flex p-2 justify-content-center">
		<form class="input-group" id="frm" action="./list" method="get" value="${pager.search}">
		
			<input type="hidden" value="${pager.page}" name="page" id="page">
			
			<select name="kind" id="k" class="form-select rounded" data-kind="${pager.kind}" style="width:100px" aria-label="Default select example">
				<option class="kind" value="title">제목</option>
				<option class="kind" value="id">작성자</option>
				<option class="kind" value="contents">내용</option>
			</select>
			
			<input type="text" data-kind="${pager.search}" name="search" class="form-control rounded me-2" style="width:280px" aria-label="Amount (to the nearest dollar)">
			
			<div class="col-auto">
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div> -->

	
	
	<div class="d-inline-flex p-2 justify-content-center">
	 <form class="input-group" action="./list" method="get">
		  <select name="kind" class="form-select rounded" style="width:100px" aria-label="Default select example">
			  <option value="title">제목</option>
			  <option value="id">작성자</option>
			  <option value="contents">내용</option>
		  </select>
		  <input type="text" name="search" class="form-control rounded me-2" style="width:280px" aria-label="Amount (to the nearest dollar)">
		   <div class="col-auto">
		    <button type="submit" class="btn btn-primary">검색</button>
		  </div>
	  </form>
	</div>


	<script src="/resources/js/kakao.js"></script>


</body>
</html>