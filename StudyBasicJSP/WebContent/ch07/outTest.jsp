<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out내장객체</title>
</head>
<body>
<h2>out 내장객체 - out.println</h2>

<%
String name="Kingdora";
out.println("출력되는 내용은 <b>" + name + "</b>입니다.");
%>

<h2>위와 같은 내용 출력</h2>
출력되는 내용은<b><%=name %></b> 입니다.
</body>
</html>