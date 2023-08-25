<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  </head>
  <body>
    <h1 class="my-4">마이페이지</h1>
    <div>
      <p>아이디 : ${member.id}</p>
      <p>이름 : ${member.name}</p>
      <p>닉네임 : ${member.nickName}</p>
      <p>이메일 : ${member.email}</p>
      <p>폰번호 : ${member.phone}</p>
      <p>생일 : ${member.birth}</p>
      <p>개인 URL : ${member.url}</p>

      <p>
        <img alt="" src="../resources/upload/member/${memberFile.fileName}" />
      </p>

      <a href="./update">회원수정</a>
      <form action="./delete" id="fr2">
        <input type="button" id="dm" value="회원탈퇴" />
      </form>
      <form action="./updateImg" id="fr3">
        <input type="button" id="ic" value="프로필 사진 변경" />
      </form>
    </div>

    <div id="followList"></div>

    <script>
      const dm = document.getElementById("dm");
      const ic = document.getElementById("ic");
      const fr2 = document.getElementById("fr2");
      const fr3 = document.getElementById("fr3");

      dm.addEventListener("click", function () {
        if (confirm("회원 탈퇴하시겠습니까?")) {
          fr2.submit();
        }
      });

      ic.addEventListener("click", function () {
        fr3.submit();
      });
    </script>

    <script src="/resources/js/follow/followList.js"></script>
  </body>
</html>
