<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<label>EMAIL</label>
		<input type="text" id="email" name="email" placeholder="회원가입 시 등록한 EMAIL을 입력하세요"></div>
		<button type="button" id="emailBtn">이메일 인증</button>
		<input id="emailCheckNum" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
		<div id="emailResult" class="x">이메일 인증 필수 (인증버튼 클릭 후 약 10초 후 메일 도착)</div><br>
       
        <div class="mb-3">
            <input type="button" class="btn btn-primary" id="btn" value="아이디/비밀번호 얻기"></button>
        </div>

        <div id="result"></div>
    
<script src="../resources/js/member/memberFind.js"></script>
</body>
</html>