<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.shopping.BankDBBean" %>
<%@page import="soccershop.shopping.BankDataBean"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 수정 폼</title>
<!-- <link href="../etc/main_list.css?ver=1" rel="stylesheet" type="text/css">  -->
 <!-- Bootstrap core CSS -->
    <link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body>
<%
String buyer = (String)session.getAttribute("id");
String accountList = request.getParameter("accountList");

if(buyer == null) {
	response.sendRedirect("shopMain.jsp");
} else {
%>
<h3 align="center"><%=buyer %>님의 계좌 변경</h3>
<form method="post" action="updateAccountPro.jsp">
<table align="center" border="1">
	<tr>
		<td width="120" align="center">기존 계좌</td>
		<td width="300" align="center"><%=accountList %></td>
		<input type="hidden" name="accountList" value="<%=accountList%>">
	</tr>
	<tr>
		<td width="120" align="center">수정 계좌번호</td>
		<td width="300">
		<input type="text" name = "update_account">
		</td>
	</tr>
	<tr>
		<td width="120" align="center">수정 계좌은행</td>
		<td width="300">
		<input type="text" name = "update_bank">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인" >&nbsp;
			<input type="button" value="취소" 
			onclick="javascript:window.location='buyForm.jsp'">&nbsp;
		</td>
	</tr>
</table>
</form>
<%} %>
</body>
</html>