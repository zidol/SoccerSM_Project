<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%
String id = "Kindora";
String hobby = "만화보기";
%>

포워딩하는 페이지 forwardTest2.jsp입니다.<br>
<jsp:forward page="forwardToTest2.jsp">
	<jsp:param value="<%=id %>" name="id"/>
	<jsp:param value="<%=hobby %>" name="hobby"/>
</jsp:forward>
</body>
</html>