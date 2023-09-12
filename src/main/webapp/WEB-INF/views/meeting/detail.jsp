 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta charset="UTF-8">

</head>
<div>
	<c:import url="../temp/bootStrap.jsp"></c:import>
<div class="modal-header">
		<h5 class="modal-title">${dto.title}</h5>
		<button
		type="button"
		class="btn-close"
		id="closeBtn"
		data-bs-dismiss="modal"
		aria-label="Close"
		></button>
</div>
	<div class="modal-body">
	<div class="detailBox">
		<div style="display: none;" class="desc">${dto.id}</div>
		<div class="detail" style="text-align: right;">작성자 : ${dto.nickName}</div>
		<div class="detail" style="text-align: left;">${dto.contents }</div>
		<div>모임 장소 : ${dto.address}</div>
		<div class="detail">모임날짜 : ${dto.meetingDate }</div>
		<div class="detail">현/총인원 :${personnel}/${dto.personnel }</div>
		<!-- <div>참석자 명단</div> -->
		<c:forEach items="${meetingMemberList}" var="m" varStatus="i">
			<c:if test="${dto.nickName eq m.nickName}">
				<div>모임장 : ${m.nickName}</div>
			</c:if>
			<c:if test="${dto.nickName ne m.nickName}">
				<div>참석자 : ${m.nickName}</div>
			</c:if>
		</c:forEach>
	
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
	</form>

	<form action="./addComment" method="post" id="frm2">
		<input type="hidden" id="meetingNum2" name="meetingNum" value="${dto.meetingNum}">
		<input type="hidden" id="commentId" name="id" value="${member.id}">
		<input type="hidden" id="nickName" name="nickName" value="${member.nickName}">
		<input type="text" id="commentContents">
		<button type="button" id="addComment">댓글등록</button>
	</form>
	
	<div id="commentList"></div>
	
	
	<script src="../resources/js/meeting/detail.js"></script>

</div>

	 


