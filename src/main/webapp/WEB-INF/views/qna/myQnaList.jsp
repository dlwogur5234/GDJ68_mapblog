<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>


    <table>
      <thead>
        <th>번호</th>
        <th>제목</th>
        <th>일자</th>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="q">
          <tr>
            <td>${q.qnaNum}</td>

            <td><a href="../qna/detail?qnaNum=${q.qnaNum}">${q.qnaTitle}</a></td>

            <td>${q.qnaDate}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item ${pager.pre?'':'disabled'}">
          <a
            class="page-link"
            href="../qna/myQnaList?page=${pager.page-1}"
            aria-label="Previous"
          >
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>

        <c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
          <li class="page-item">
            <a class="page-link" href="#" data-num="${i}">${i}</a>
          </li>
        </c:forEach>

        <li class="page-item ${pager.next?'':'disabled'}">
          <a
            class="page-link"
            href="#" data-num="${pager.page+1}"
            aria-label="Next"
          >
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
    <%-- <nav>
      <c:if test="${not empty member}">
        <a class="btn btn-outline-secondary" href="./add">공지추가</a>
      </c:if>
    </nav> --%>

