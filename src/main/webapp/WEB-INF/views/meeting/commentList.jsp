<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	

	
	<c:forEach items="${commentList}" var="d" varStatus="i">
	<div>
		<div class="idClass" id="id">${d.id} </div>
		<div class="a" data-meetingNum="${d.meetingNum}" id="updateDiv">${d.contents}</div>
		<button class="updateBtn" data-commentNum="${d.commentNum}" id="updateBtn">수정</button>
		<button class="butt" data-commentNum="${d.commentNum}" id="btn">삭제</button>
	</div>
	</c:forEach>



</body>
</html>


	
