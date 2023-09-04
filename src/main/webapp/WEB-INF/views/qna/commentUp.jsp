<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

    
    <div id="myModal" class="modal">
    <div class="modal-content">
        <h2>댓글 수정</h2>
    <!-- qnaNum, contents, id 값을 JSP로 전달하여 폼에 출력 -->
    <form id="editForm" method="post" action="commentUp">
    <input type="hidden" name="commentNum" id="commentNum" value="${commentNum}" />
    <input type="hidden" name="cotents" id="contents" value="${contents}" />
    <input type="hidden" name="id" id="id" value="${id}" />

    
        <textarea id="contents" name="contents">${contents}</textarea>
        <button type="submit" id="saveButton">저장</button>
    </form>
    </div>