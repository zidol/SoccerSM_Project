<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값을 입력받는 폼</title>
</head>
<body>
<h2>좋아하는 숫자를 입력하세요</h2>
<form method= "post" action="ex10_03Pro.jsp">
	아이디 : <input type="text" name="id"><br>
	패스워드 : <input type="password" name="passwd"><br>
	좋아하는 숫자 : <input type="text" name="number"><br>
	<input type="submit" value="입력완료">
</form>
</body>
</html>