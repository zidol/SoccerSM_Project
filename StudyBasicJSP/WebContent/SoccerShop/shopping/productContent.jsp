<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.master.SoccerShopDataBean" %>
<%@ page import="soccershop.master.SoccerShopDBBean" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer Shopping Mall</title>
 <!-- Bootstrap core CSS -->
    <link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body <%-- bgcolor="<%=bodyback_c%>" --%>>
<%
String product_kind = request.getParameter("product_kind");
String product_id = request.getParameter("product_id");
String id = "";
int buy_price = 0;

try {
	if(session.getAttribute("id")==null){
		id="not";
%>		
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">SoccerMall</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          	<li class="nav-item">
          		<a class="nav-link" href="./login.jsp?product_id=<%=product_id %>&product_kind=<%=product_kind%>">로그인</a>
          	</li>            
          </ul>
        </div>
      </div>
    </nav>
<%	} else {
	id=(String)session.getAttribute("id");%>
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
<%}

} catch(Exception e) {}
SoccerShopDataBean productList = null;
String product_kindName="";

SoccerShopDBBean productProcess = SoccerShopDBBean.getInstance();

productList = productProcess.getProduct(Integer.parseInt(product_id));

if(product_kind.equals("100"))
	product_kindName = "축구화";
else if(product_kind.equals("200"))
	product_kindName = "유니폼";
else if(product_kind.equals("300"))
	product_kindName = "트레이닝복";
else if(product_kind.equals("400"))
	product_kindName = "축구공";
else if(product_kind.equals("500"))
	product_kindName = "악세사리";
%>
<br>
<form name="inform" method="post" action="cartInsert.jsp">
	<table align="center" border="1">
		<tr height="30">
			<td rowspan="6" width="150">
			<img style="margin-left: 10px;" src="../../imageFile/<%=productList.getProduct_image() %>"
			border="0" width="150" height="200">
			</td>
			<td width="500"> <font size="+1">
				<b><%=productList.getProduct_title() %></b></font>
			</td></tr>
		<tr><td width="500">생산지 : <%=productList.getArea()%></td></tr>
		<tr><td width="500">제조사 : <%=productList.getBrand() %></td></tr>
		<tr><td width="500">출시일 : <%=productList.getLaunch_date() %></td></tr>
		<tr><td width="500">정가 : 
			<%=NumberFormat.getInstance().format(productList.getProduct_price()) %>원 <br>
			<%buy_price = (int)(productList.getProduct_price()*((double)(100-productList.getDiscount_rate())/100)); %>
			판매가: <b><font color="red">
			<%=NumberFormat.getInstance().format((int)(buy_price)) %></font></b>
			</td>
		<tr><td width="500">수량 : <input type="text" size="5" name="buy_count" value="1">개
		<%
			if(id.equals("not")){
				if(productList.getProduct_count() == 0){
		%><b>일시 품절</b>
			<%}else { %>
				<br><b><font color="red">로그인하시면 구매가능합니다.</font></b>
			<%	}
			} else {
					if(productList.getProduct_count()==0) {
			%><b>일시 품절</b>
			<%}else{ %>
			<input type="hidden" name="product_id" value="<%=product_id %>">
			<input type="hidden" name="product_image" value="<%=productList.getProduct_image() %>">
			<input type="hidden" name="product_title" value="<%=productList.getProduct_title() %>">
			<input type="hidden" name="buy_price" value="<%=buy_price%>">
			<input type="hidden" name="product_kind" value="<%=product_kind %>"><br>
			<input type="submit" value="장바구니에 담기">
			<% }
			}%>
			<input type="button" value="목록으로"
			onclick="javascript:window.location='list.jsp?product_kind=<%=product_kind%>'">
			<input type="button" value="메인으로"
			onclick="javascript:window.location='index.jsp'">
			</td>
		</tr>
		<tr>
			<td width="375" colspan="2" align="left">
				<br><%=productList.getProduct_content().replaceAll("\r\n", "<br>")%>
				<img style="margin-left: 10px;" src="../../imageFile/<%=productList.getProduct_contimage() %>"
			border="0">
			</td>
	</table>
</form>
</body>
</html>