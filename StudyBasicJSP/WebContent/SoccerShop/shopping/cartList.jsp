<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.shopping.CartDataBean" %>
<%@ page import="soccershop.shopping.CartDBBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer Shopping Mall</title>
<!-- <link href="../etc/main_list.css?ver=2" rel="stylesheet" type="text/css"> -->
    <link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body <%-- bgcolor="<%=bodyback_c%>" --%>>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">SoccerMall</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          	<li>
          		<jsp:include page="../module/top.jsp" flush="false"/>
          	</li>
            
          </ul>
        </div>
      </div>
    </nav>
<%
String product_kind = request.getParameter("product_kind");
String buyer = (String)session.getAttribute("id");
List<CartDataBean> cartLists = null;
CartDataBean cartList = null;
int count = 0;
int number = 0;
int total = 0;
if(session.getAttribute("id")==null) {
	response.sendRedirect("index.jsp");
} else {
	CartDBBean productProcess = CartDBBean.getInstance();
	count = productProcess.getListCount(buyer);
	if(count==0) {
%>
<h3 align="center"><b>장바구니</b></h3>
<table align="center" border="1">
	<tr>
	<td>장바구니에 담긴 물품이 없습니다.<br>
	<input align="center" id="continueshop" type="button" value="쇼핑계속"
onclick="javascript:window.location='list.jsp?product_kind=all'">
	</td></tr>
	
</table>

<%
	}else {
		cartLists = productProcess.getCart(buyer);
%>
<h3 align="center" ><b>장바구니</b></h3>
<form name="inform" method="post" action="updateCart.jsp">
	<table align="center">
		<tr>
			<td width="50">번호</td>
			<td width="350">상품이름</td>
			<td width="100">판매가격</td>
			<td width="150">수량</td>
			<td width="150">금액</td>
		</tr>
		
		<%
		for(int i=0; i<cartLists.size(); i++) {
			cartList = (CartDataBean)cartLists.get(i);
		
		%>
		<tr>
			<td width="50"> <%=++number %></td>
			<td width="300" align="left">
				<img alt="" src="../../imageFile/<%=cartList.getProduct_image()%>" 
				border="0" width="30" height="50" align="middle">&nbsp;	
				<%=cartList.getProduct_title() %>
			</td>
			<td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price())%></td>
			<td width="150">
			<form method="post" action="updateCart.jsp">
				<input type="text" name = "buy_count" size="5" value="<%=cartList.getBuy_count()%>">
				<input type="hidden" name = "cart_id" value="<%=cartList.getCart_id() %>">
				<input type="hidden" name = "product_kind" value="<%=product_kind %>">
				<input type="submit" value="수정">
			</form>
			</td>
			<td align="center" width="150">
			<%total += cartList.getBuy_count()*cartList.getBuy_price(); %>
			<%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
			<input type="button" value ="삭제"
			onclick="javascript:window.location='cartListDel.jsp?list=<%=cartList.getCart_id() %>&product_kind=<%=product_kind %>'">
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5" align="right" style="padding-right: 40px"> 
			<hr style="border: 1px solid;">
			<font color="red" size="2"><b>총금액 : <%=NumberFormat.getIntegerInstance().format(total) %></b></font>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="5">
				<input type="button" value="구매하기"
				onclick="javascript:window.location='buyForm.jsp'">
				<input type="button" value="쇼핑계속"
				onclick="javascript:window.location='list.jsp?product_kind=<%=product_kind %>'">
				<input type="button" value="장바구니 비우기"
onclick="javascript:window.location='cartListDel.jsp?list=all&productkind=<%=product_kind %>'">
			</td>
		</tr>		
	</table>
</form>
<%		
	}
}
%>

</body>
</html>