<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.x {color: red;}
	.o {color: blue;}
</style>
</head>
<body>
	<h1 class="my-4">회원 정보 변경</h1>
	
	<form action="./update" method="post" id="fr">
		<div class="mb-3">
		  <label for="pw" class="form-label">PASSWORD</label>
		  <input type="password" value="${member.pw}" name="pw" class="form-control" id="pw" placeholder="PW를 입력하세요">
		</div>
		<div id="pwResult" class="x">PASSWORD를 확인하세요(필수)</div>
		<div class="mb-3">
			<label for="pw2" class="form-label">PASSWORD 재확인</label>
			<input type="password" value="" name="pw2" class="form-control" id="pw2" placeholder="PW를 재입력하세요">
		</div>
		<div id="pw2Result" class="x">PASSWORD 일치 여부를 확인하세요(필수)</div>
		
		<div class="mb-3">
		  <label for="name" class="form-label">Name</label>
		  <input type="text" name="name" value="${member.name}" class="form-control" id="name" placeholder="Name을 입력하세요">
		</div>
		<div id="nameResult" class="x">이름을 확인하세요(필수)</div>
		
		<div class="mb-3">
		  <label for="nickName" class="form-label">NickName</label>
		  <input type="text" name="nickName" value="${member.nickName}" class="form-control" id="nickName" placeholder="NickName을 입력하세요">
		</div>
		<div class="o">(닉네임은 필수 아님)</div>
		
		<div class="mb-3">
		  <label for="email" class="form-label">Email</label>
		  <input type="email" name="email" value="${member.email}" class="form-control" id="email" placeholder="Email를 입력하세요">
		</div>
		<div id="emailResult" class="x">이메일을 확인하세요(필수)</div>
		
		<div class="mb-3">
		  <label for="phone" class="form-label">Phone</label>
		  <input type="text" name="phone" value="${member.phone}" class="form-control" id="phone" placeholder="Phone#을 입력하세요">
		</div>
		<div class="o">(폰번호는 필수 아님)</div>
		
		<div class="mb-3">
		  <label for="birth" class="form-label">Birth</label>
		  <input type="date" name="birth" value="${member.birth}" class="form-control" id="birth">
		</div>
		<div id="birthResult" class="x">생일을 확인하세요(필수)</div>
		
		<div class="mb-3">
		  <label for="url" class="form-label">URL</label>
		  <input type="text" name="url" class="form-control" value="${member.url}" id="url">
		</div>
		<div id="urlResult" class="x">URL을 확인하세요(필수)</div>
		
		<input type="button" id="btn" value="변경하기"></button>
	</form>
	
	<script src="../resources/js/membersUpdate.js"></script>
</body>
</html>