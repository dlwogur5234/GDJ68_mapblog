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

		<td>${com.contents}</td>
		<td>${com.adminId}</td>
		<td>${com.id}</td>
		<td>${com.commentDate}</td>
		<c:if test="${comment.id eq member.id}">
		<td data-num-del="${com.commentNum}" id="del">x</td>
		</c:if>
	</tr>
</c:forEach>

