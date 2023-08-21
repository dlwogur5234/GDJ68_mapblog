<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   
    <title>QnaList</title>
</head>
<c:import url="../temp/header.jsp"></c:import>
<body>
    <table>
        <thead>
            <thead>
                <th>번호</th>
                <th>제목</th>
                <th>일자</th>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="q">
                	<tr>
                        <td>${q.qnaNum}</td>
                        <td>${q.qnaTitle}</td>
                        <td>${q.qnaDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </thead>

    </table>
    
    <a href="./add" >공지추가</a>
</body>
</html>