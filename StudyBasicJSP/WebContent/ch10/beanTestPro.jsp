<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈 사용예제- 이름을 받는</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="testBean" class="ch10.bean.TestBean">
	<jsp:setProperty name="testBean" property="name"  param="username" />
</jsp:useBean>

<h2>자바빈을 사용하는 JSP페이지</h2>
입력된 이름은 <b><jsp:getProperty name="testBean" property="name"/></b>
</body>
</html>