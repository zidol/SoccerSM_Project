<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문 예제 - 메서드 선언</title>
</head>
<body>
<h2>선언문 예제 - 메서드 선언</h2>

<%!
String id  = "Kingdora";

public String getId() {
	return id;
}
%>

id 변수의 내용 : <%=id %><br>
getId() 메서드의 실행 결과 : <%=getId() %>
</body>
</html>