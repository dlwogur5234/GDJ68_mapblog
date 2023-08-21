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
 	<c:import url="./temp/header.jsp"></c:import>
    <article class="notice" id="slider">
      <div class="slides">
        <a href="#"
          ><img src="/resources/img/KakaoTalk_20230821_141558692_01.jpg" alt="" class="imgslide"
        /></a>
        <a href="#"
          ><img src="/resources/img/KakaoTalk_20230821_141558692_02.jpg" alt="" class="imgslide"
        /></a>
        <a href="#"
          ><img src="/resources/img/KakaoTalk_20230821_141558692.jpg" alt="" class="imgslide"
        /></a>
      </div>

      <div class="slider-controls">
        <button onclick="prevSlide()" class="prevBtn">&#8249;</button>
        <button onclick="nextSlide()" class="nextBtn">&#8250;</button>
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
   <c:import url="./temp/footer.jsp"></c:import>

    <script src="/resources/js/index.js"></script>
  </body>
</html>
