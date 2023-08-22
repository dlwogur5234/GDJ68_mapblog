<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootStrap.jsp"></c:import>

<style type="text/css">
 a:link, a:visited {
     background-color: rgba(40,155,110);
     color: white;
     padding: 8px 30px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
     border-radius: 15px;
     font-size: 24px;
}
 a:hover, a:active {
     background-color: rgba(0,128,0);
}
.img{
	text-align: center;
}

.login{
	width: 1300px;
	text-align: right;
}
</style>

</head>
<body>

	<section class="container mt-5">
		<div class="img">
			<img alt="" src="/resources/img/logo3.png">
		</div>

		<div class="login">
			<a id="" href="/">Mapper로 이동</a>
		</div>
		
		<h1 class="my-4">Login Page</h1>
		
		<form action="admin/adminLogin" method="post">
			<div class="mb-3">
			  <label for="adminId" class="form-label">ID</label>
			  <input type="text" name="adminId" class="form-control" value="admin1" id="adminId" placeholder="ID를 입력하세요">
			</div>
			
			<div class="mb-3">
			  <label for="adminPw" class="form-label">PASSWORD</label>
			  <input type="password" name="adminPw" class="form-control" value="1" id="adminPw" placeholder="PW를 입력하세요">
			</div>
			
			<div class="mb-3">
				<button class="btn btn-primary">로그인</button>
			</div>
		
		</form>
		
		
	</section>

</body>
</html>