<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   	<c:import url="../temp/bootStrap.jsp"></c:import>
    <title>QnaList</title>
</head>

<body>
		<c:import url="../temp/header.jsp"></c:import>
	
    <table>
       
            <thead>
                <th>번호</th>
                <th>제목</th>
                <th>일자</th>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="n">
                	<tr>
                        <td>${n.noticeNum}</td>
	                        
	                        	<td><a href="./detail?noticeNum=${n.noticeNum}">${n.subject}</a></td>
	                        
                        <td>${n.noticeDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
            
            

    </table>
    <nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item ${pager.pre?'':'disabled'}">
		      <a class="page-link" href="./list?page=${pager.page-1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  
		    <c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./list?page=${i}">${i}</a></li>
		    </c:forEach>
		
		    <li class="page-item ${pager.next?'':'disabled'}">
		      <a class="page-link" href="./list?page=${pager.page+1}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		
		  </ul>
		</nav>
       		<a class="btn btn-outline-secondary" href="./add" >공지추가</a>
</body>
</html>