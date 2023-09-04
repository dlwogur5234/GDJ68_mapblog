<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<c:if test="${not empty sessionScope.updateResult}">
		<h2> 회원정보가 수정되었습니다. 다시 로그인해주세요.</h2>
	</c:if>
   <c:if test="${empty sessionScope.updateResult}">
	</c:if>
	<c:if test="${not empty sessionScope.loginFailed}">
		<h2> 회원 정보가 맞지 않습니다. 다시 시도해주세요.</h2>
	</c:if>
   <c:if test="${empty sessionScope.updateResult}">
	</c:if>

	<form action="./login" method="post">
		<div>
			<label>ID</label>
			<input type="text" name="id" placeholder="ID를 입력하세요" value="user02">
		</div>
		<div>
			<label>PW</label>
			<input type="password" name="pw" placeholder="PW를 입력하세요" value="12341234">
		</div>
		<input type="submit" value="로그인">
	</form>
	<button type="button" onclick="location.href='./find' ">아이디/비밀번호 찾기</button><br>
	<div id="naver_id_login"><a href="../naver/login">
	<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
	<div id="kakao_id_login"><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=9df9221dadf27f4338ac3350e1787ae9&redirect_uri=http://localhost:82/kakao/login">
	<img width="200" src="/resources/img/kakaoLogin.png"/></a></div>
</body>
</html>