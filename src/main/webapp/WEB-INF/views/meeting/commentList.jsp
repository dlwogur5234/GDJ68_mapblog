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
	<div class="a" data-meetingNum="${d.meetingNum}">${d.id} ${d.contents}</div>
	<button class="butt" data-commentNum="${d.commentNum}" id="btn">삭제</button>
	</c:forEach>



</body>
</html>


	
