<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>follow</title>
  </head>
  <body>
  
  	
    <h1>follow페이지</h1>
	
    <div>팔로우 :${followCnt}</div>
    <c:forEach items="${followList}" var="f">
      <div>${f.toUser} <button>삭제</button></div>
    </c:forEach>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item ${pager.pre?'':'disabled'}">
          <a
            class="page-link"
            href="./list?page=${pager.page-1}"
            aria-label="Previous"
          >
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>

        <c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
          <li class="page-item">
            <a class="page-link" href="./list?page=${i}">${i}</a>
          </li>
        </c:forEach>

        <li class="page-item ${pager.next?'':'disabled'}">
          <a
            class="page-link"
            href="./list?page=${pager.page+1}"
            aria-label="Next"
          >
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>

    <div>팔로워 :${followerCnt}</div>
    <c:forEach items="${followerList}" var="f">
      <div>${f.fromUser} <button>팔로우</button></div>
    </c:forEach>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item ${pager.pre?'':'disabled'}">
          <a
            class="page-link"
            href="./list?page=${pager.page-1}"
            aria-label="Previous"
          >
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>

        <c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
          <li class="page-item">
            <a class="page-link" href="./list?page=${i}">${i}</a>
          </li>
        </c:forEach>

        <li class="page-item ${pager.next?'':'disabled'}">
          <a
            class="page-link"
            href="./list?page=${pager.page+1}"
            aria-label="Next"
          >
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </body>
</html>
