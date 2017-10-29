<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.master.SoccerShopDataBean" %>
<%@ page import="soccershop.master.SoccerShopDBBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer Shopping Mall</title>
<!-- <link href="../etc/main_list.css" rel="stylesheet" type="text/css"> -->
<!-- Bootstrap core CSS -->
    <link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body bgcolor="<%=bodyback_c%>">
<%String product_kind =request.getParameter("product_kind"); %>

<%
List<SoccerShopDataBean> productLists = null;
SoccerShopDataBean productList = null;
String product_kindName= "";

SoccerShopDBBean productProcess = SoccerShopDBBean.getInstance();
productLists = productProcess.getProducts(product_kind);   
if(product_kind.equals("100"))
	product_kindName="축구화";
else if (product_kind.equals("200"))
	product_kindName="유니폼";
else if (product_kind.equals("300"))
	product_kindName="트레이닝복";
else if (product_kind.equals("400"))
	product_kindName="축구공";
else if (product_kind.equals("500"))
	product_kindName="악세사리";
else if (product_kind.equals("all"))
	product_kindName="전체";
%>
<%-- <h3 ><b><%=product_kindName %> 분류목록</b></h3>
<a align="center" href="index.jsp">메인으로</a>
<br> --%>

<%

for(int i=0; i<productLists.size(); i++) {
	productList = (SoccerShopDataBean)productLists.get(i);%>


	<div class="col-lg-3 col-md-4 mb-5" >
              <div class="card h-100" >
                <a href="productContent.jsp?product_id=<%=productList.getProduct_id()%>&product_kind=<%=product_kind%>"><img align="center" src="../../imageFile/<%=productList.getProduct_image()%>" 
                width="140" height="180" alt=""></a>
                <div class="card-body">
                	<a href="productContent.jsp?product_id=<%=productList.getProduct_id()%>&product_kind=<%=product_kind%>"><%=productList.getProduct_title() %></a>
                 	<br>
                    	<span style="text-decoration:line-through;">
                    	정가 : <%=NumberFormat.getInstance().format(productList.getProduct_price()) %>원<br></span>
						판매가 : <b><font color="red"><%=NumberFormat.getInstance().format((int)(productList.getProduct_price()*((double)(100-productList.getDiscount_rate())/100))) %></font></b>원
                  		<p class="card-text">
                  		제조사 : <%=productList.getBrand() %><br>
                  		<%-- 생산지 : <%=productList.getArea()%> --%>
                 		 </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><%if(productList.getProduct_count()==0){ %>
				<b>일시품절</b>
				<%}else if (productList.getProduct_count()<=10){ %>
					<font class="blink" color="red"><b>인기 상품!!</b></font>
					<%}else if (productList.getProduct_count()<=5){ %>
					<font class="blink" color="red"><b>>재고 얼마 없음</b></font>
					<%}else{ %>
				<font class="blink" color="red"><b>신제품</b></font>
				<%} %></small>
                </div>
              </div>
            </div>


<%} %>


</body>
</html>