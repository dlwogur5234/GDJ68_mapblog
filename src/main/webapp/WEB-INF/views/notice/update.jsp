<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<form action="./update" method="post">
<table class="table table-dark table-hover">
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
		</thead>
		<tbody>
				<tr>
					<td><input type="hidden" name="noticeNum" value="${dto.noticeNum }">${dto.noticeNum}</td>
					<td><input type="text" name="subject" value="${dto.subject}"></td>
					<td>${dto.adminId}</td>
					
					
				</tr>
		</tbody>
		</table>
				<table class="table table-dark table-hover">
				  <tr>
				   		<th>내용</th>
				  </tr>
				  <tr>
				    <td><textarea rows="" cols="" name="contents" id="contents">${dto.contents}</textarea></td>
				  </tr>
				</table>
				<button type="submit">수정</button>
				</form>
</body>
</html>