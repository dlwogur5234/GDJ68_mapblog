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


	
	<section class="container-sm">
	
	<!-- feedNum과 publics hidden처리 -->
	<form id="frm" action="">
		<input type="hidden" name="feedNum" value="${dto.feedNum}">
		<input type="hidden" name="publics" value="${dto.publics}">
	</form>
	
		<p class="col-sm-8 text-start">여행날짜 ${dto.tripDate}</p>
		<p class="display-4">${requestScope.dto.title}</p>
		
		<dl class="row mt-1">
			<dd class="col-sm-2 text-start align-text-bottom mt-1">${dto.id}</dd>
			<dd class="col-sm-8 text-end text-body-tertiary align-self-end">작성일 ${dto.createDate}</dd>
			<dd class="col-sm-2 text-end">조회수 ${dto.hit}</dd>
		</dl>
	
  	<hr class="hr" />

  	<div>
  	
  	<div class="card border-white mb-3">
  		<pre class="card-body contents text-start" style="font-size:15px; height:300px;">${dto.contents}</pre>
	</div>
	
	 <c:forEach items="${dto.fileDTOs}" var="f">
		<img alt="" src="/resources/upload/board/${f.fileName}">
	</c:forEach>
	
  	</div>

  	
	<div class="row mt-1">
		<p class="col-sm-11 text-end"></p>
		<button class="btn btn-primary col-sm-1 text-start" id="likes"> 좋아요 ${dto.likes} </button>
	</div>
		
		
	<hr class="hr" />
		
		


	<button class="btn btn-primary c1" data-url="update" id="update">수정</button>
	<button class="btn btn-danger c1" data-url="delete" id="del" data-delete-name="num" data-delete-num="${dto.feedNum}">삭제</button>
	<a class="btn btn-primary" href="./list">목록</a>

	
	</section>
	


</body>
</html>