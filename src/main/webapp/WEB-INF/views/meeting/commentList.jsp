<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <title>Insert title here</title>
  <style>


  </style>
  </head>
  <body>
  <c:forEach items="${commentList}" var="d" varStatus="i">
    <c:import url="../temp/bootStrap.jsp"></c:import>
  <!--<div class="idClass" id="id">${d.id} </div> -->
<ul style="margin-top: 15px;">
  <li style="text-align: left;" id="nickName">${d.nickName} &nbsp; ${d.commentDate}</li>
  <li style="text-align: left;" class="a" data-meetingNum="${d.meetingNum}" id="updateDiv"
  > &nbsp;&nbsp;${d.contents}
  </li>
  <c:if test="${member.id eq d.id}"> <button class="updateBtn btn btn-outline-secondary" data-commentNum="${d.commentNum}" id="updateBtn" > 수정 </button> <button class="butt btn btn-outline-danger" data-commentNum="${d.commentNum}" id="btn"> 삭제 </button>
  </c:if>

  <c:if test="${d.cGroup > 0}"> 
	<li class="replyListDiv" id="replyListDivId"></li> 
	<button class="replyListBtn btn btn-outline-secondary" id="replyListBtnId" data-commentNum="${d.commentNum}" >답글 ${d.cGroup}개 </button>
  </c:if>
  <button class="replyBtn btn btn-outline-secondary"  data-commentNum="${d.commentNum}" id="replyBtn"
  > 답글달기
  </button>
  
  
</ul>
</c:forEach>
  </body>
</html>
