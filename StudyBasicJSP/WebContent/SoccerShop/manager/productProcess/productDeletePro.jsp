<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.master.SoccerShopDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제 페이지</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<%
int product_id = Integer.parseInt(request.getParameter("product_id"));
String product_kind = request.getParameter("product_kind");
SoccerShopDBBean productProcess = SoccerShopDBBean.getInstance();
productProcess.deleteProduct(product_id);
response.sendRedirect("productList.jsp?product_kind=" + product_kind);
%>
</body>
</html>
