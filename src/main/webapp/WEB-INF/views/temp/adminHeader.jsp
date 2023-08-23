<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<nav>
		      	<ul class="nav">
		      		<c:if test="${not empty adminMember}">
		      			<li>
		      				<p>
		      					${adminMember.adminGrade} ${adminMember.adminName}님 환영합니다.
		      				</p>
		      			</li>
		      		</c:if>
		      	</ul>
			</nav>
<header>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="">
	    	<img alt="Bootstrap" width="100" height="60" src="/resources/img/logo3-1.png">
	    </a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Link</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Dropdown
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">Action</a></li>
	            <li><a class="dropdown-item" href="#">Another action</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
	        </li>
	      </ul>
	      
	      	<nav>
		      	<ul class="nav">
		      		<c:if test="${not empty adminMember}">
			      		<li class="nav-item text-white me-3"><a href="/admin/adminLogout">로그아웃</a></li>
			      		<li class="nav-item text-white me-3"><a href="">mypage</a></li>
		      		</c:if>
		      	</ul>
			</nav>
	      
	      
	    </div>
	  </div>
	</nav>

</header>
