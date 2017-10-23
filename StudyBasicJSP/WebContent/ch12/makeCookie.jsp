<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
<h2>쿠키를 생성하는 페이지</h2>
<%
String cookieName = "id";
Cookie cookie = new Cookie(cookieName, "hongkd");
cookie.setMaxAge(60);
response.addCookie(cookie);
%>
"<%=cookieName%>"쿠키가 생성되었습니다.<br>
<form action="useCookie.jsp" method="post">
	<input type="submit" value="생성된 쿠키 확인">
</form>
</body>
</html>