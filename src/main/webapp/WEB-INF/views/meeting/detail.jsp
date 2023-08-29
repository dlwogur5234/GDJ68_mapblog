<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	
		<div class="desc">${dto.id}</div>
		<div class="desc">${dto.contents }</div>
		<div class="desc">${dto.meetingDate }</div>
		<div class="desc">${personnel}/${dto.personnel }</div>
	
	<form action="./meetingJoin" method="post">
		<c:if test="${not empty sessionScope.member && sessionScope.member.id ne dto.id && result<1 && personnel<dto.personnel}">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<button type="submit" name="join" value="true" id="btn">참가신청</button>
		</c:if>
	</form>
	<form action="./meetingQuit" method="post">
		<c:if test="${result>=1 && member.id ne dto.id}">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<input type="hidden" name="id" value="${member.id}">
			<button type="submit" >모임나가기</button>
		</c:if>
	</form>
	</form>
		<form action="./update">
		<c:if test="${member.id eq dto.id }">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<input type="hidden" name="id" value="${member.id}">
			<button type="submit" >모임수정</button>
		</c:if>
	</form>
	<form action="./delete">
		<c:if test="${member.id eq dto.id }">
			<input type="hidden" name="meetingNum" value="${dto.meetingNum}">
			<input type="hidden" name="id" value="${member.id}">
			<button type="submit" >모임삭제</button>
		</c:if>

</body>
</html>