<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<h1>add Page</h1>
	<form  action="./add" method="post">
		<div class="input-group text-center"><span class="input-group-text" id="basic-addon2">제목</span><input  type="text" name="qnaTitle"></div><br>
		<div class="input-group text-center"><span class="input-group-text" id="basic-addon2">내용</span><textarea class="input-group" rows="" cols="" name="qnaContents"></textarea></div><br>
		<div class="input-group text-center"><span class="input-group-text" id="basic-addon2">작성자</span><input  type="text" name="memberId"></div><br>
		
			<!-- <div>
				<button type="button" class="my btn btn-danger" id="fileBtn">File추가</button>
			</div>
			<div id="fileList" class="my-5"></div> -->
			<input type="file" name="photos">사진첨부
			<input type="file" name="photos">사진첨부
		
		<p>
	<!-- 	<select name="bookSale">
			<option value="1">판매가능</option>
			<option value="0" selected>판매중지</option>
		</select> -->
		</p>
		
		<button type="submit">등록</button>

	</form>
</body>
</html>