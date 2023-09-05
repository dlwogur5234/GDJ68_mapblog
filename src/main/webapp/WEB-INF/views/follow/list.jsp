
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
    <style>
    	.margin{
    		margin: 10px 5px;
    		text-align: center;
    	}
    	.modalfloat{
    		float: left;
    	}
      #followList{
        float: left;
      }
      a{
      	display: block;
      	text-decoration: none;
      	color: black;
      }
    </style>
  </head>
  <body>
    <!-- Button trigger modal -->
    <a
      class="modalfloat"
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
      <div class="margin"><a href="/feed/list/${member.url}">${f.toUser}</a> 
    	 <form action="addFollow" method="POST">
        <input type="hidden" name="fromUser" value="${followDel.fromUser}">
        <input type="hidden" name="toUser" value="${followDel.toUser}"> 
          <input type="hidden" name="followNum" value="${followDel.followNum}"> 
        <button type="submit" id="followButton" class="Btn">삭제</button>
        </form>
      </div>
    </c:forEach>
    
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
      class="modalfloat"
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
      <div class="margin">${f.fromUser} 
        <form action="deleteFollow" method="POST">
        <input type="hidden" name="fromUser" value="${followDel.fromUser}">
        <input type="hidden" name="toUser" value="${followDel.toUser}"> 
          <input type="hidden" name="followNum" value="${followDel.followNum}"> 
        <button type="submit" id="followButton" class="Btn">팔로우</button>
        </form>
      </div>
    </c:forEach>

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
