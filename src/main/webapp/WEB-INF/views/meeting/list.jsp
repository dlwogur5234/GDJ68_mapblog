<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${list}" var="d" varStatus="i">
	<div class="a" data-lat="${d.lat }" data-lng="${d.lng }" id="${i.index}"></div>
	</c:forEach>
	
	
</body>
</html>