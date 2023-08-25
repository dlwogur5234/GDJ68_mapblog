<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin User Detail Page</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="../../temp/adminHeader.jsp"></c:import>
	
	<h1>User Detail Page</h1>
	<h2>${requestScope.dto.id} 님의 상세정보</h2>
	
</body>
</html>