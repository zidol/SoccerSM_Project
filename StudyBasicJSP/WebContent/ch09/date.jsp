<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 시간 페이지</title>
</head>
<body>
<%
Date date = new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String strdate= simpleDate.format(date);
%>
보통의 jsp 페이지의 형태입니다.<br>

<%--고의로 에러를 발생시킨 라인으로 strdate변수명을 str로 틀리게 입력했다. --%>
오늘날짜는 <%=strdate %> 입니다.
</body>
</html>