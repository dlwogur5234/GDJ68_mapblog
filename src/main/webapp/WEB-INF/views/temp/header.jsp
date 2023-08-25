<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/header.css" />

<header>
  <div>
    <a href="/" class="logoBox"
      ><div class="logo"><img src="/resources/img/찐막.png" alt="" /></div
    ></a>

    <ul class="member">
      <li class="login"><a href="../member/login">로그인</a></li>
      <li class="signup"><a href="../member/join">회원가입</a></li>
    </ul>
  </div>
  <nav class="navi">
    <ul>
      <li><a href="#">홈</a></li>
      <li><a href="#">메뉴</a></li>
      <li><a href="/follow/list">follow</a></li>
      <li>
        <a href="#">소식</a>
        <ul>
          <li><a href="/notice/list">공지사항</a></li>
          <li><a href="/qna/list">QNA</a></li>
        </ul>
      </li>
    </ul>
  </nav>
</header>
