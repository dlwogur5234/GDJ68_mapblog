<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	

	
	<c:forEach items="${commentList}" var="d" varStatus="i">
	<div class="a">${d.id}</div>
	<div class="a">${d.contents}</div>
	</c:forEach>
	

</body>
</html>


	
