<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%
String num = request.getParameter("num");

%>
<h2>입력한 숫자만큼 반복수행</h2>    
<table border="1">       
	<tr>
	<th>글번호</th>           
	<th>글제목</th>           
	<th>글내용</th>       
	</tr> 
<%
int number = Integer.parseInt(num);

while(number>0) {
%>	
<tr>
<td><%=number-- %></td>
<td><%="제목" + (number+1) %></td>
<td><%="내용" + (number+1) %></td>
</tr>
<%} %>
</table>
</body>
</html>