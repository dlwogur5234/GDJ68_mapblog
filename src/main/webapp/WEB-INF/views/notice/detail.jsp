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
	<c:if test="${empty adminMember}">
		<c:import url="../temp/header.jsp"></c:import>
	</c:if>
	<c:if test="${not empty adminMember}">
		<c:import url="../temp/adminHeader.jsp"></c:import>
	</c:if>
	
	<h1>detail</h1>

	<!-- Getter, Setter 의 이름 : 메서드에서 get을 제외하고 첫번째글자를 소문자로 바꾼것 -->
	
	<table class="table table-dark table-hover">
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			
			
		</thead>
		<tbody>
				<tr>
					<td>${dto.noticeNum}</td>
					<td>${dto.subject}</td>
					<td>${dto.adminId}</td>
					<td>${dto.noticeDate}</td>
				</tr>
				</tbody>
			</table>
				<table class="table table-dark table-hover">
				  <tr>
				   		<th>내용</th>
				  </tr>
				  <tr>
				    <td>${dto.contents}</td>
				  </tr>
				</table>
				
				 	<c:forEach items="${dto.fileDTOs}" var="f">	
						<img src="../resources/upload/notice/${f.fileName}">
					</c:forEach> 
		
	
	<c:if test="${not empty adminMember}">
	 <a href="./update?noticeNum=${dto.noticeNum}">수정</a>
	<form action="./delete?noticeNum=${dto.noticeNum}" method="post"> 
	<button type="submit">삭제</button> 
	</form>
	</c:if>
	
	
	
	<%-- <button id="update" data-url="update" class="c1">수정</button>
	<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}" class="c1">삭제</button> --%>


<%-- 	<c:if test="${dto.bookSale eq 1}">
		<h1> 판매중 </h1>
	</c:if>
	<c:if test="${dto.bookSale eq 0 }">
		<h1> 판매종료</h1>
	</c:if> --%>
</body>
</html>