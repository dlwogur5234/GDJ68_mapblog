<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src='/resources/fullcalendar/main.js' ></script>

  </head>
  <body>
  	<input type="hidden" id="arr" value="${myList}">
    <div id='calendar'></div>
    <script src="/resources/fullcalendar/cal.js" ></script>
  </body>
</html>