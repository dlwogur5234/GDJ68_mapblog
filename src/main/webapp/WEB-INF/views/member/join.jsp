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
	
	<h1>회원 가입</h1>
	
	<form action="./join" method="POST" id="fr" enctype="multipart/form-data">
		<input type="hidden" name="agree1" value="${agree.agree1}">
		<input type="hidden" name="agree2" value="${agree.agree2}">
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
			<input type="text" id="name" name="name" placeholder="NAME을 입력하세요">
		</div>
		<div id="nameResult" class="x">이름을 확인하세요(필수)</div><br>
		<div>
			<label>NICKNAME</label>
			<input type="text" id="nickName" name="nickName" placeholder="NICKNAME을 입력하세요">
		<div id="nickNameResult" class="x">닉네임을 확인하세요(필수) / 닉네임은 추후 변경할 수 없으니 신중하게 입력해주세요</div><br>
		</div>
		<div>
			<label>EMAIL</label>
			<input type="text" id="email" name="email" placeholder="EMAIL을 입력하세요">
		</div>
		<button type="button" id="emailBtn">이메일 인증</button>
		<input id="emailCheckNum" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
		<div id="emailResult" class="x">이메일 인증 필수 (인증버튼 클릭 후 약 10초 후 메일 도착)</div><br>
		<div>
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
				<label>계정 공개 여부</label><br>
			<input type="radio" id="p1" name="publics" value="1">
			<label for="p1">전체 공개</label>
			<input type="radio" id="p2" name="publics" value="0">
			<label for="p2">전체 비공개</label><br>
			<div id="publicsResult" class="x">공개여부를 확인하세요(필수)</div>
		</div><br>
		<div>
			<label for="pic" class="form-label">프로필 사진</label>
			<input type="file" name="photo" class="form-control" id="pic">
		</div>
	</form>
	
	<div class="mb-3">
		<input type="button" class="btn btn-primary" id="btn" value="회원가입">
	</div>

	<script src="../resources/js/member/members.js"></script>
</body>
</html>