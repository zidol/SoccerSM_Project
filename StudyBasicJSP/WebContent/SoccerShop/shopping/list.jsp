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
<%-- <%String product_kind =request.getParameter("product_kind"); %> --%>
<br>
 <div class="container">
 <table align="center" >
<tr>
<td width="250" valign="top">

<jsp:include page="../module/left.jsp" flush="false"/>
</td>
<td  align="center" width="850">
<%-- <%
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
%> --%>
<%-- <h3 ><b><%=product_kindName %> 분류목록</b></h3>
<a align="center" href="index.jsp">메인으로</a>
<%
for(int i=0; i<productLists.size(); i++) {
	productList = (SoccerShopDataBean)productLists.get(i);%> --%>

<div class="row">
	<jsp:include page="./list_include.jsp" flush="false"/>
</div>

<%-- <%} %> --%>
</td>
</tr>
</table>
 </div>
 <footer class="py-5 bg-dark">
      <div class="container">
        <!-- <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p> -->
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
      <!-- /.container -->
    </footer>
<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>