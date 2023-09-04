<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${comment}" var="com" varStatus="i">
	<c:choose>
		<c:when test="${i.first}">
			<tr id="totalPage" data-totalPage="${pager.totalPage}">
		</c:when>
		<c:otherwise>
			<tr>
		</c:otherwise>
		
		
	</c:choose>
		
		<td id="updateDiv">${com.contents}</td>
		<td>${com.adminId}</td>
		<td>${com.id}</td>
		<td>${com.commentDate}</td>
		<c:if test="${com.id eq member.id}">
		<td data-num-del="${com.commentNum}" id="del">x</td>
		<td>
       	<form action="commentUp" method="post">
        <button class="updateBtn" data-commentnum="${com.commentNum}" type="submit">수정</button>
        </form>
   		</div></td>
		</c:if>
		
		
		
	</tr>

</div>
</c:forEach>

<script>
 
</script>

