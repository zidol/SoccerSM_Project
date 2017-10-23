<%@page import="java.sql.Timestamp"%>
<%@page import="soccershop.shopping.CustomerDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.shopping.CustomerDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String address = request.getParameter("address");
String tel = request.getParameter("tel");

CustomerDBBean regMember = CustomerDBBean.getInstance();
CustomerDataBean member = new CustomerDataBean();//인스턴스 생성

member.setId(id);
member.setPasswd(passwd);
member.setName(name);
member.setAddress(address);
member.setTel(tel);
member.setReg_date(new Timestamp(System.currentTimeMillis()));
regMember.insertMember(member);
response.sendRedirect("index.jsp");
%>
</body>
</html>