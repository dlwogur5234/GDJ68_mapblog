<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="../../temp/adminHeader.jsp"></c:import>
	<section class="container mt-5">	
		<h1 class="my-4">Admin Join Page</h1>
		
		<form action="./adminJoin" method="post" enctype="multipart/form-data" id="frm">
			<div class="mb-3">
			  <label for="adminId" class="form-label">ID</label>
			  <input type="text" name="adminId" class="form-control" id="adminId" placeholder="ID를 입력하세요">
			  <div id="adminIdResult"></div>
			</div>
	
			<div class="mb-3">
				<label for="adminPw" class="form-label">PASSWORD</label>
				<input type="password" name="adminPw" class="form-control" id="adminPw2" placeholder="PW를 입력하세요">
				<div id="adminPwResult"></div>
			  </div>	
			
			<div class="mb-3">
			  <label for="adminName" class="form-label">Name</label>
			  <input type="text" name="adminName" class="form-control" id="adminName" placeholder="Name을 입력하세요">
			  <div id="adminNameResult"></div>
			</div>
			
			<div class="mb-3">
			  <label for="adminGrade" class="form-label">Grade</label>
			  <input type="text" name="adminGrade" class="form-control" id="adminGrade">
			  <div id="adminGradeResult"></div>
			</div>
			
			<div class="mb-3">
				<button type="submit" class="btn btn-primary" id="btn">관리자계정생성</button>
			</div>
		
		</form>
	</section>

</body>
</html>