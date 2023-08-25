<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.x {color: red;}
	.o {color: green;}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	
	<h1>네이버로 회원 가입</h1>
	

	<form action="../member/join" method="POST" id="fr" enctype="multipart/form-data">
		<div>
			<label>ID</label>
			<input type="text" id="id" name="id" placeholder="ID를 입력하세요">
		</div>
		<div id="idResult" class="x">ID를 확인하세요(필수)</div><br>
		<div>
			<label>PW</label>
			<input type="password" id="pw" name="pw" placeholder="PW를 입력하세요">
		</div>
		<div id="pwResult" class="x">PASSWORD를 확인하세요(필수)</div><br>
		<div>
			<label>PW 확인</label>
			<input type="password" id="pw2" placeholder="PW를 재입력하세요">
		</div>
		<div id="pw2Result" class="x">PASSWORD 일치 여부를 확인하세요(필수)</div><br>
		<div>
			<label>NAME</label>
			<input type="text" id="name" name="name" value="${naverMember.name}" readonly>
		</div><br>
		<div>
			<label>NICKNAME</label>
			<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요">
		</div>
		<div id="nickNameResult" class="x">닉네임을 확인하세요(필수) / 닉네임은 추후 변경할 수 없으니 신중하게 입력해주세요</div><br>
		<div>
			<label>EMAIL</label>
			<input type="text" id="email" name="email" value="${naverMember.email}" readonly>
		</div><br>
			<label>PHONE</label>
			<input type="text" id="phone" name="phone" placeholder="PHONE#을 입력하세요">
		</div>
		<div class="o">(폰번호는 필수 아님)</div><br>
		<div>
			<label>BIRTH</label>
			<input type="date" id="birth" name="birth" value="2023-07-23">
		</div>
		<div id="birthResult" class="x">생일을 확인하세요(필수)</div><br>
		<div>
			<label>PERSONAL URL</label>
			<input type="text" id="url" name="url" placeholder="사용할 URL을 입력하세요">
		</div>
		<div id="urlResult" class="x">URL을 확인하세요(필수) / URL은 추후 변경할 수 없으니 신중하게 입력해주세요</div><br>

		<div>
			<label for="pic" class="form-label">프로필 사진</label>
			<input type="file" name="photo" class="form-control" id="pic">
		</div>
	</form>
	
	<div class="mb-3">
		<input type="button" class="btn btn-primary" id="btn" value="회원가입"></button>
	</div>

	<script src="../resources/js/member/naverJoin.js"></script>
</body>
</html>