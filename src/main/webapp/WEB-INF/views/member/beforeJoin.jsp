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
	
	<h1>회원 가입에 필요한 정보 제공 동의 여부 확인</h1>

    <input type="checkbox" id="a">
    <label for="all">필수 사항 모두 동의</label>
    <br>
    <input type="checkbox" id="c1">
    <label for="c1">1번(필수)</label>
    <br>
    <input type="checkbox" id="c2">
    <label for="c2">2번(필수)</label>
    <br>
    <input type="checkbox" id="c3">
    <label for="c3">3번(필수)</label>
    <br>
    <input type="checkbox" id="c4">
    <label for="c4">4번(선택)</label>
    

    <button id="btn">동의 후 회원가입</button>
</body>
<script src="../resources/js/member/beforeJoin.js"></script>
</html>