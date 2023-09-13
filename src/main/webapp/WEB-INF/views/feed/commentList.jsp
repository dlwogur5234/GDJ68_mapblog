<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${commentList}" var="d" varStatus="i">
		<li>
			<!--<div class="idClass" id="id">${d.id} </div> -->
		
			<strong style="display: inline-block" id="nickName">${d.nickName}</strong>
			<div style="display: inline-block; white-space: pre-wrap; width: 100%;" class="a" data-meetingNum="${d.feedNum}" id="updateDiv"
			> ${d.contents}
			</div>
			<div style="display: flex;justify-content: space-between;">
				<div>
					<c:if test="${d.cGroup > 0}"> 
					<div class="replyListDiv" id="replyListDivId"></div> 
					<!-- <button class="replyListBtn" id="replyListBtnId" data-commentNum="${d.commentNum}" >답글 ${d.cGroup}개 </button> -->
					</c:if>
					<button class="replyBtn" data-commentNum="${d.commentNum}" id="replyBtn"
					> 답글달기
					</button>
				</div>
				<div>
					<c:if test="${member.id eq d.id}"> <button class="updateBtn" data-commentNum="${d.commentNum}" id="updateBtn" > 수정 </button> <button class="butt" data-commentNum="${d.commentNum}" id="btn"> 삭제 </button>
					</c:if>
				</div>
			</div>
		</li>
		</c:forEach>

</body>
</html>
