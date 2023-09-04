
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <c:import url="../temp/bootStrap.jsp"></c:import>
    <title>Document</title>
  </head>
  <body>
    <!-- Button trigger modal -->
    <a
      
      data-bs-toggle="modal"
      data-bs-target="#exampleModalFollow"
    >
      팔로우 :${followCnt}
    </a>

    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModalFollow"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-scrollable .modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
          	<c:forEach items="${followList}" var="f">
      <div>${f.toUser} <button>삭제</button></div>
    </c:forEach>
    <%-- <nav aria-label="Page navigation example">
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
          </nav>--%>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Button trigger modal -->
<a
      
      data-bs-toggle="modal"
      data-bs-target="#exampleModalFollower"
    >
      팔로워 :${followerCnt}
    </a>

<!-- Modal -->
<div class="modal fade" id="exampleModalFollower" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <c:forEach items="${followerList}" var="f">
      <div>${f.fromUser} 
        <form action="deleteFollow" method="POST">
        <input type="hidden" name="fromUser" value="${followDel.fromUser}">
        <input type="hidden" name="toUser" value="${followDel.toUser}"> 
          <input type="hidden" name="followNum" value="${followDel.followNum}"> 
        <button type="submit" id="followButton">팔로우</button>
        </form>
      </div>
    </c:forEach>
    <%-- <nav aria-label="Page navigation example">
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
          </nav> --%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
