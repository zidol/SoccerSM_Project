<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Script예제</title>
</head>
<body>
<h2>선언문, 스크립트릿, 표현식의 쓰임을 알아보는 예제</h2>
<%!
 String str = "전역변수 입니다.";
%>

<%!
String getStr() {
	return str;
}
%>
<%
String str2 = "지역 변수 입니다.";
%>

스크립트릿에서 선언한 변수 str2는 <%=str2 %><br>
선언문에서 선언한 변수  str1은 <%=getStr() %>
</body>
</html>