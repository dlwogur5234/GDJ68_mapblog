<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="./login" method="post">
		<div>
			<label>ID</label>
			<input type="text" name="id" placeholder="ID를 입력하세요" value="user31">
		</div>
		<div>
			<label>PW</label>
			<input type="password" name="pw" placeholder="PW를 입력하세요" value="12345">
		</div>
		<input type="submit" value="로그인">
	</form>
	<div id="naver_id_login"><a href="../naver/login">
	<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
</body>
</html>