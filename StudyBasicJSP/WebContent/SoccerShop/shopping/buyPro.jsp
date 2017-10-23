<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.shopping.CartDataBean" %>
<%@ page import="soccershop.shopping.CartDBBean" %>
<%@ page import="soccershop.shopping.BuyDBBean" %>
<%@ page import="soccershop.master.SoccerShopDBBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy page</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%
String account = request.getParameter("account");
String deliveryName= request.getParameter("deliveryName");
String deliveryTel = request.getParameter("deliveryTel");
String deliveryAddress = request.getParameter("deliveryAddress");
String buyer = (String)session.getAttribute("id");

CartDBBean cartProcess = CartDBBean.getInstance();
List<CartDataBean> cartLists = cartProcess.getCart(buyer);

BuyDBBean buyProcess = BuyDBBean.getInstance();
buyProcess.insertBuy(cartLists, buyer, account, deliveryName, deliveryTel, deliveryAddress);

response.sendRedirect("buyList.jsp");
%>
</html>

