<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <title>Insert title here</title>
  </head>
  <body>
    <c:forEach items="${replyList}" var="r" varStatus="i">
      <ul>
        <li id="nickName" style="text-align: left">
          └ &nbsp;${r.nickName} ${r.commentDate}
        </li>
        <li
          class="rere"
          data-replyNum="${r.replyNum}"
          id="replyUpdateContentsDiv"
          style="text-align: left"
        >
          <span style="padding: 0 15px"></span>${r.contents}
        </li>
        <c:if test="${member.id eq r.id}">
          <button
            class="replyUpdateBtn btn btn-outline-secondary"
            data-replyNum="${r.replyNum}"
            data-replyContents="${r.contents}"
            id="replyUpdateBtn"
          >
            수정
          </button>
          <button
            class="replyDeleteBtn btn btn-outline-danger"
            data-replyNum="${r.replyNum}"
            data-commentNum="${r.commentNum}"
            id="replyDeleteBtn"
          >
            삭제
          </button>
        </c:if>
      </ul>
    </c:forEach>
  </body>
</html>
