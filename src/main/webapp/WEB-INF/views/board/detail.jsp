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
	
	<form id="frm" action="">
		<input type="hidden" name="feedNum" value="${dto.feedNum}">
	</form>
	
	<p>${dto.id}</p>
	<p>${requestScope.dto.title}</p>
	
  	<hr class="hr" />

  	<div>
  	
  	<div class="card border-white mb-3">
  		<pre class="card-body contents text-start" style="font-size:15px; height:300px;">${dto.contents}</pre>
	</div>
	
	 <c:forEach items="${dto.fileDTOs}" var="f">
		<img alt="" src="/resources/upload/board/${f.fileName}">
	</c:forEach>
	
  	</div>


	<hr class="hr" />
  	
	<dl class="row mt-1">
	 	<dd class="col-sm-3 text-start">${dto.createDate}</dd>
	 	<dd class="col-sm-3">${dto.tripDate}</dd>
	 	<dd class="col-sm-2 text-start">조회수 ${dto.hit}</dd>
	 	<dd class="col-sm-2 text-start">좋아요 ${dto.likes}</dd>
	 	<dd class="col-sm-2 text-end">공개여부 ${dto.publics}</dd>
	 </dl>
	 
  	
  	
  	



	<button class="btn btn-primary c1" data-url="update" id="update">수정</button>
	<button class="btn btn-danger c1" data-url="delete" id="del" data-delete-name="num" data-delete-num="${dto.feedNum}">삭제</button>
	<a class="btn btn-primary" href="./list">목록</a>


	<script src="../resources/js/delete.js"></script>
	
	</section>
	


</body>
</html>