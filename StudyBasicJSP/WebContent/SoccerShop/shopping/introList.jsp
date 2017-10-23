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
<!-- <link href="../etc/main_list.css?ver=2" rel="stylesheet" type="text/css"> -->
 <link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body <%-- bgcolor="<%=bodyback_c%>" --%>>
<!-- <h2>신제품 소개</h2> -->
<%
SoccerShopDataBean [] productLists = null;
int number = 0;
String product_kindName="";

SoccerShopDBBean productProcess = SoccerShopDBBean.getInstance();
for(int i=1; i<=5; i++) {
	productLists = productProcess.getProducts(i+"00", 4);
	
	if(productLists[0].getProduct_kind().equals("100")) {
		product_kindName = "축구화";
	} else if (productLists[0].getProduct_kind().equals("200")) {
		product_kindName = "유니폼";
	} else if (productLists[0].getProduct_kind().equals("300")) {
		product_kindName = "트레이닝복";
	} else if (productLists[0].getProduct_kind().equals("400")) {
		product_kindName = "축국공";
	} else if (productLists[0].getProduct_kind().equals("500")) {
		product_kindName = "악세사리";
	}
	
%>
<%-- <br> <font size="+1"><b><%=product_kindName%>분류의 신제품 목록:
<a href="list.jsp?product_kind=<%=productLists[0].getProduct_kind()%>">더보기</a>
</b></font> --%>
<%
for(int j=0; j<productLists.length; j++) {
%>
	<%-- <table>
		<tr height="30" bgcolor="<%=value_c%>">
			<td rowspan="4" width="100">
			<a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id()%>&product_kind=<%=productLists[0].getProduct_kind()%>">
			<img src="../../imageFile/<%=productLists[j].getProduct_image()%>"
			border="0" width="60" height="90"></a></td>
			<td width="350"> <font size="+1"><b>
			<a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id()%>&product_kind=<%=productLists[0].getProduct_kind()%>">
			<%=productLists[j].getProduct_title() %></a></b></font> </td>
			<td rowspan="4" width="100">
			<%if(productLists[j].getProduct_count()==0){ %>
				<b>일시품절</b>
				<%}else{ %>

				<font class="blink" color="red"><b>신제품!!</b></font>
				<%} %>
			</td>
		</tr>
		<tr height="30" bgcolor="<%=value_c%>">
			<td width="350">제조사 : <%=productLists[j].getBrand()%></td>
		</tr>
		<tr height="30" bgcolor="<%=value_c%>">
			<td width="350">생산지 : <%=productLists[j].getArea()%></td>
		</tr>
		<tr height="30" bgcolor="<%=value_c%>">
			<td width="350">정가
			:<%=NumberFormat.getInstance().format(productLists[j].getProduct_price()) %>원<br>
			판매가 : <b><font color="red"><%=NumberFormat.getInstance().format((int)(productLists[j].getProduct_price()*((double)(100-productLists[j].getDiscount_rate())/100))) %></font></b>원
			</td>
		</tr>
	</table>
	<br> --%>
	
	<div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id()%>&product_kind=<%=productLists[0].getProduct_kind()%>"><img class="card-img-top" src="../../imageFile/<%=productLists[j].getProduct_image()%>" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id()%>&product_kind=<%=productLists[0].getProduct_kind()%>"><%=productLists[j].getProduct_title() %></a>
                  </h4>
                  정가 : <%=NumberFormat.getInstance().format(productLists[j].getProduct_price()) %>원<br>
			판매가 : <b><font color="red"><%=NumberFormat.getInstance().format((int)(productLists[j].getProduct_price()*((double)(100-productLists[j].getDiscount_rate())/100))) %></font></b>원
                  <p class="card-text">제조사 : <%=productLists[j].getBrand()%><br>생산지 : <%=productLists[j].getArea()%>
                  </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><%if(productLists[j].getProduct_count()==0){ %>
				<b>일시품절</b>
				<%}else if (productLists[j].getProduct_count()<=5){ %>
					<font class="blink" color="red"><b>인기 상품!! 재고 얼마 없음</b></font>
					<%}else{ %>
				<font class="blink" color="red"><b>신제품</b></font>
				<%} %></small>
                </div>
              </div>
            </div>
<%
}
}
%>
</body>
</html>