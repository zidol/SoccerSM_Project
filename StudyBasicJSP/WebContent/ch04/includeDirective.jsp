<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include디렉티브연습</title>
</head>
<body>
<h2>include디렉티브 연습</h2>
<%
String name = "Kim";
%>
<%@ include file="top.jsp" %>
포함하는 페이지 includeDirective.jsp의 내용입니다.
<%@ include file="bottom.jsp" %>
</body>
</html>