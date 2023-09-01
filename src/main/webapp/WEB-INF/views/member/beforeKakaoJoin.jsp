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
	
	<h1>(카카오)회원 가입에 필요한 정보 제공 동의 여부 확인</h1>
    <form action="./join" method="get" id="fr">
        <input type="checkbox" id="a">
        <label for="all">필수 사항 모두 동의</label>
        <br>
        <input type="checkbox" class="cb" id="c1">
        <label for="c1">1번(필수)</label>
        <br>
        <input type="checkbox" class="cb" id="c2">
        <label for="c2">2번(필수)</label>
        <br>
        <input type="checkbox" class="cb" id="c3">
        <label for="c3">3번(필수)</label>
        <br>
        <input type="checkbox" class="cb" id="c4">
        <label for="c4">4번(필수)</label>
        <br>
        <input type="checkbox" id="agree1" name="agree1">
        <label for="c5">5번(선택)</label>
        <br>
        <input type="checkbox" id="agree2" name="agree2">
        <label for="c6">6번(선택)</label>
    </form>

    <button id="btn">동의 후 회원가입</button>
</body>
<script src="../resources/js/member/beforeKakaoJoin.js"></script>
</html>