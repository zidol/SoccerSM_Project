<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드삭제</title>
</head>
<body>
<h2>member테이블의 레코드 삭제</h2>
<form action="deleteTestPro.jsp" method="post">
	아이디 : <input type="text" name="id" maxlength="50"><br>
	패스워드 : <input type="password" name="passwd" maxlength="16"><br>
	<input type="submit" value="입력완료">
</form>
</body>
</html>