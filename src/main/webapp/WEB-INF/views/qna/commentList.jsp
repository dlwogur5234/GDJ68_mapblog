<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <style>
	.float {
		float: left;
	}
	#dleD {
		content: '';
		display: block;
		clear: both;
	}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<c:forEach items="${comment}" var="com" varStatus="i">
	<c:choose>
		<c:when test="${i.first}">
			<div class="delD" id="totalPage" data-totalPage="${pager.totalPage}">
		</c:when>
		<c:otherwise>
			<div class="dleD">
		</c:otherwise>
		
		
	</c:choose>
	
		<div  style="width: 50px; height: 50px"><img class="float" style="width: 100%; height: 100%" alt="" src="../resources/upload/member/${memberFile.fileName}"></div>
		
		<div class="float" id="updateDiv">${com.contents}</div>
		<div class="float">${com.nickName}</div>
		<div class="float">${com.commentDate}</div>
		<c:if test="${com.id eq member.id}">
		<button data-num-del="${com.commentNum}" id="del">x</button>
		
        <button class="updateBtn" data-commentnum="${com.commentNum}">수정</button>

   		
		</c:if>
		
		
		
	</tr>

</div>
</c:forEach>





