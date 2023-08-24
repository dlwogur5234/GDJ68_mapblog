<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin User List Page</title>
	<c:import url="../../temp/bootStrap.jsp"></c:import>

</head>
<body>
	
	<c:import url="../../temp/adminHeader.jsp"></c:import>
	<section class="container mt-5">
		<h1 class="mb-4 text-center">User List</h1>
	
		
		<table class="table table-dark table-hover">
			<thead>
				<th>ID</th><th>이름</th><th>닉네임</th><th>E-mail</th><th>연락처</th><th>생년월일</th><th>개인URL</th><th>가입날짜</th>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="d" varStatus="i">
				<tr>
					<td><a class="link-underline link-underline-opacity-0 text-white" href="./userDetail?id=${d.id}">${d.id}</a></td>
					<td>${d.name}</td>
					<td>${d.nickName}</td>
					<td>${d.email}</td>
					<td>${d.phone}</td>
					<td>${d.birth}</td>
					<td>${d.url}</td>
					<td>${d.createDate}</td>
				</tr>			
				</c:forEach>
		
			</tbody>
		
		</table>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  	
		    <li class="page-item ${pager.pre?'':'disabled'}" >
		      <a class="page-link" href="./userList?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./userList?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
		    </c:forEach>
		    <c:if test="${pager.next}">
		    <li class="page-item" >
		      <a class="page-link" href="./userList?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    
		    </c:if>
		  </ul>
		</nav>
		
		<div class="input-group mb-3">
		 <form action="./userList" method="get">
			  <select name="kind" class="form-select" aria-label="Default select example">
				  <option value="id">ID</option>
				  <option value="name">Name</option>
			  </select>
			  <input type="text" name="search" class="form-control" aria-label="Amount (to the nearest dollar)">
			   <div class="col-auto">
			    <button type="submit" class="btn btn-primary">검색</button>
			  </div>
		  </form>
		</div>
		
		
		<a class="btn btn-danger" href="./add">상품등록</a>
	
	</section>
	
	
<%-- 	
	<c:forEach begin="1" end="10" step="2" var="num">
		<h1>${num}</h1>
	</c:forEach>
	 --%>
	<script type="text/javascript" src="../resources/js/bookList.js"></script>
</body>
</html>