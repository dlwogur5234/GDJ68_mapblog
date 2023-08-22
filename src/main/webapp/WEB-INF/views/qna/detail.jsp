<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

<table class="table table-dark table-hover">
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			
			
		</thead>
		<tbody>
				<tr>
					<td>${dto.qnaNum}</td>
					<td>${dto.qnaTitle}</td>
					<td>${dto.memberId}</td>
					<td>${dto.qnaDate}</td>
					
					
					
					
					
				</tr>
				</tbody>
			</table>
				<table class="table table-dark table-hover">
				  <tr>
				   		<th>내용</th>
				  </tr>
				  <tr>
				    <td>${dto.qnaContents}</td>
				  </tr>
				  
				  <tr>
				  	<td>
						<c:forEach items="${dto.fileDTOs}" var="f">
							<img src="../resources/upload/qna/${f.fileName}">
						</c:forEach>
					</td>
				  </tr>
				</table>
				<a href="./update?qnaNum=${dto.qnaNum}">수정</a>
				<form action="./delete?qnaNum=${dto.qnaNum}" method="post">
				<button type="submit">삭제</button>
				</form>
</body>
</html>