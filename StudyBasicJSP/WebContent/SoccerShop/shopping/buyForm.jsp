<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.shopping.CartDataBean" %>
<%@ page import="soccershop.shopping.CartDBBean" %>
<%@ page import="soccershop.shopping.CustomerDataBean" %>
<%@ page import="soccershop.shopping.CustomerDBBean" %>
<%@ page import="soccershop.shopping.BuyDBBean" %>
<%@ page import="soccershop.shopping.BankDBBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file = "../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SoccerShopping Mall</title>
<!-- <link href="../etc/main_list.css?ver=1" rel="stylesheet" type="text/css">  -->
 <link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body>
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
String buyer = (String) session.getAttribute("id");
List<CartDataBean> cartLists = null;
List<String> accountLists = null;
CartDataBean cartList = null;
CustomerDataBean member = null;
int number = 0;
int total = 0;
if(session.getAttribute("id")==null) {
	response.sendRedirect("shopMain.jsp");
} else {
	CartDBBean productProcess = CartDBBean.getInstance();
	cartLists = productProcess.getCart(buyer);
	
	CustomerDBBean memberProcess = CustomerDBBean.getInstance();
	member = memberProcess.getMember(buyer);
	
	BankDBBean buyProcess = BankDBBean.getInstance();
	accountLists = buyProcess.getAccount(buyer);
%>
<h3 align="center"><b>구매 목록</b></h3>
<form name="inform" method="post" action="updateCart.jsp">
	<table align="center" border="1">
		<tr>
			<td width="50">번호</td>
			<td width="300">상품이름</td>
			<td width="100">판매가격</td>
			<td width="150">수량</td>
			<td width="150">금액</td>
		</tr>
		<%
			for(int i=0; i<cartLists.size(); i++) {
				cartList = cartLists.get(i);
			
		%>
		<tr>
			<td width="50"> <%=++number %></td>
			<td width="300" align="left">
				<img src="../../imageFile/<%=cartList.getProduct_image()%>"
				border="0" width="30" height="50" alt="middle">
				<%=cartList.getProduct_title() %>
			</td>
			<td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price()) %></td>
			<td width="150"> <%=cartList.getBuy_count()%></td>
			<td width="150">
			 <%total += cartList.getBuy_count()*cartList.getBuy_price();%>
			 <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
			</td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="5" align="right" style="padding-right: 50px"><b>총구매금액 :
			<%=NumberFormat.getInstance().format(total) %></b></td>
		</tr>
	</table>
</form>
<%
}
%>
<br>
<script type="text/javascript">
	function selectAccount(name) {
		var accountList = document.getElementById("accountList").value;
		javascript:window.location = name + "?accountList=" + accountList;
		
	}
</script>
<form method="post" action="buyPro.jsp" name="buyinput">
	<table align="center" border="1">
		<tr align="center">
			<td colspan="2"> <font size="+1"><b>주문자 정보</b></font></td>
		</tr>
		<tr>
			<td width="200" align="left">성명 </td>
			<td width="400" align="left"><%=member.getName() %></td>
		</tr>
		<tr>
			<td width="200" align="left">전화번호 </td>
			<td width="400" align="left"><%=member.getTel() %></td>
		</tr>
		<tr>
			<td width="200" align="left">주소 </td>
			<td width="400" align="left"><%=member.getAddress() %></td>
		</tr>
		<tr>
			<td width="200" align="left">결제계좌 </td>
			<td width="400" align="left">
			<select name="account" id="accountList">
			<%
			String accountList = "";
			for(int i=0; i<accountLists.size(); i++){
				 accountList = accountLists.get(i);
			%>
				<option value="<%=accountList %>"><%=accountList%></option>
				
				<%} %>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="계좌등록" 
				onclick="javascript:window.location='insertAccoutForm.jsp'">&nbsp;
				<input type="button" value="계좌수정" 
				onclick="selectAccount('updateAccountForm.jsp')">&nbsp;
				<input type="button" value="계좌삭제" 
				onclick="selectAccount('deleteAccountForm.jsp')">&nbsp;
			</td>
		</tr>
	</table>
	<br>
	<table align="center" border="1"> 
		<tr>
			<td colspan="2" align="center"> <font size="+1"><b>배송지 정보</b></font>
			</td>
		</tr>
		<tr>
			<td width="200" align="left">성명</td>
			<td width="400" align="left">
				<input type="text" name="deliveryName" value="<%=member.getName()%>">
			</td>
		</tr>
		<tr>
			<td width="200" align="left">전화번호</td>
			<td width="400" align="left">
				<input type="text" name="deliveryTel" value="<%=member.getTel()%>">
			</td>
		</tr>
		<tr>
			<td width="200" align="left">주소</td>
			<td width="400" align="left">
				<input type="text" name="deliveryAddress" value="<%=member.getAddress()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="확인">
				<input type="button" value="취소"
				onclick="javascript:window.location='index.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>