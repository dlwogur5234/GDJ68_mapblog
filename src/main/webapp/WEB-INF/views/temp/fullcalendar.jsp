<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/fullcalendar/main.js'></script>
<!--     <script type="text/javascript">
    	var arr = new Array();
        <c:forEach items="${myList}" var="d">
    		arr.push({
    			title:"${d.title}"
    			start:"${d.meetingDate}"
    		});
        </c:forEach>
    </script> -->
  </head>
  <body>
    <div id='calendar'></div>
    <script src="/resources/fullcalendar/cal.js"></script>
  </body>
</html>