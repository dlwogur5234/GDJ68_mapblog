<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/resources/css/index.css" />
    <title>home</title>
  </head>
  <body>
    <header>
      <div>
        <a href="#"><div class="logo">로고자리</div></a>

        <ul class="member">
          <li class="login"><a href="#">로그인</a></li>
          <li class="signup"><a href="#">회원가입</a></li>
        </ul>
      </div>
      <nav class="navi">
        <ul>
          <li><a href="">홈</a></li>
          <li><a href="">메뉴</a></li>
          <li><a href="">메뉴</a></li>
          <li><a href="">메뉴</a></li>
        </ul>
      </nav>
    </header>
    <article class="notice" id="slider">
      <div class="slides">
        <a href="#"
          ><img src="/resources/img/slidebanner1.png" alt="" class="imgslide"
        /></a>
        <a href="#"
          ><img src="/resources/img/slidebanner2.png" alt="" class="imgslide"
        /></a>
        <a href="#"
          ><img src="/resources/img/slidebanner3.png" alt="" class="imgslide"
        /></a>
      </div>

      <div class="slider-controls">
        <button onclick="prevSlide()">&#8249;</button>
        <button onclick="nextSlide()">&#8250;</button>
      </div>
    </article>
    <section>
      <article class="hot">
        <h2>실시간 핫한 블로그</h2>
        <div class="hots">
          <div>
            <a href="#">
              <h3>제목1</h3>
              <div><img src="/resources/img/images.jpeg" alt="" /></div>
            </a>
          </div>
          <div>
            <a href="#">
              <h3>제목2</h3>
              <div>
                <img src="/resources/img/99A85F3C5C0DC6AD29.jpeg" alt="" />
              </div>
            </a>
          </div>
          <div>
            <a href="#">
              <h3>제목3</h3>
              <div>
                <img src="/resources/img/singapore_merlion.jpg" alt="" />
              </div>
            </a>
          </div>
        </div>
      </article>
    </section>
    <footer>
      <div>푸터자리</div>
    </footer>

    <script src="/resources/js/index.js"></script>
  </body>
</html>
