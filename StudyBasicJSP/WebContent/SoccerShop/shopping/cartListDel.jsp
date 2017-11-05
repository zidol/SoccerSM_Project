<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.shopping.CartDBBean" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SoccerShoppingMall</title>
</head>
<body>
<%
String list = request.getParameter("list");
String buyer = (String)session.getAttribute("id");
String product_kind = request.getParameter("product_kind");

if(session.getAttribute("id") == null) {
	response.sendRedirect("shopMain.jsp");
} else {
	CartDBBean productProcess = CartDBBean.getInstance();
	if(list.equals("all"))
		productProcess.deleteAll(buyer);
	else
		productProcess.deleteList(Integer.parseInt(list));
	
	response.sendRedirect("cartList.jsp?product_kind=" + product_kind);
}
%>
</body>
</html>

