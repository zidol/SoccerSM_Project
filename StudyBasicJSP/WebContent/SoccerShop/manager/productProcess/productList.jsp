<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="soccershop.master.SoccerShopDataBean" %>
<%@ page import="soccershop.master.SoccerShopDBBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 상품목록</title>
<link href="../../etc/main_list.css?ver=3" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">

<%!
int pageSize = 10;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
String id="";
try {
	id = (String)session.getAttribute("id");
	if(id==null || id.equals("")) {
		response.sendRedirect("../logon/managerLoginForm.jsp");
	} else {
%>
<%-- <%
List<SoccerShopDataBean> productList = null;
int number=0;
String product_kind="";

product_kind = request.getParameter("product_kind");

SoccerShopDBBean productProcess = SoccerShopDBBean.getInstance();
int count = productProcess.getProductCount();

if(count>0) {
	productList = productProcess.getProducts(product_kind);
}
%> --%>
<%		

		String pageNum = request.getParameter("pageNum");
		String product_kind = request.getParameter("product_kind");
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<SoccerShopDataBean> productList = null;

		SoccerShopDBBean dbPro = SoccerShopDBBean.getInstance();
		count = dbPro.getProductCount();
		if (count > 0) {
			productList = dbPro.getProducts(product_kind, startRow, endRow);
		}

		//number = count - (currentPage - 1) * pageSize;
	%>

<%
String product_kindName="";
if(product_kind.equals("all")) {
	product_kindName="전체";
} else if(product_kind.equals("100")) {
	product_kindName="축구화";
} else if(product_kind.equals("200")) {
	product_kindName="유니폼";
} else if(product_kind.equals("300")) {
	product_kindName="트레이닝복";
} else if(product_kind.equals("400")) {
	product_kindName="축구공";
} else if(product_kind.equals("500")) {
	product_kindName="악세사리";
} 
%>
<p align="center"><a  href="../managerMain.jsp" align="center">관리자 메인으로</a></p>
<p align="center"><%=product_kindName %> 분류의 목록:
<%if(product_kind.equals("all")){ number = count - (currentPage - 1) * pageSize;%>
<%=count %>개
<%}else{number = productList.size() - (currentPage - 1) * pageSize; %>
<%=productList.size() %>개
<%} %>
</p>
<table align="center">
	<tr>
		<td align="right" >
		<a href="productRegisterForm.jsp">상품 등록</a>
		<select name="jump" onchange="location.href=this.value">
		<option value="productList.jsp?product_kind=all" selected="selected">목록보기</option>
		<option value="productList.jsp?product_kind=all">전체목록</option>
		<option value="productList.jsp?product_kind=100">축구화</option>
		<option value="productList.jsp?product_kind=200">유니폼</option>
		<option value="productList.jsp?product_kind=300">트레이닝복</option>
		<option value="productList.jsp?product_kind=400">축구공</option>
		<option value="productList.jsp?product_kind=500">악세사리</option>
		</select>
		</td>
	</tr>
</table>
<%
 if(count==0) {

%>
<table align="center">
	<tr>
		<td >
		등록된 상품 이 없습니다.
	</tr>
</table>
<%}else { %>
<table align="center">
	<tr height="30" >
		<td align="center" width="30">번호</td>
		<td align="center" width="70">상품분류</td>
		<td align="center" width="100">상품명</td>
		<td align="center" width="50">가격</td>
		<td align="center" width="50">수량</td>
		<td align="center" width="70">생산지</td>
		<td align="center" width="100">제조사</td>
		<td align="center" width="100">출시일</td>
		<td align="center" width="150">상품이미지</td>
		<td align="center" width="150">상품내용이미지</td>
		<td align="center" width="50">할인율</td>
		<td align="center" width="70">등록일</td>
		<td align="center" width="50">수정</td>
		<td align="center" width="50">삭제</td>
	</tr>
	<%
	for(int i=0;i<productList.size(); i++) {
		SoccerShopDataBean product = (SoccerShopDataBean)productList.get(i);
	
	%>
	<tr height="30" align="center">
		<td width="30"><%=number-- %></td>
		<td width="50"><%=product.getProduct_kind() %></td>
		<td width="100"><%=product.getProduct_title()%></td>
		<td width="50"><%=product.getProduct_price()%></td>
		<td width="50">
		<%if(product.getProduct_count()==0){ %>
		<font color="red"><%="일시 품절" %></font>
		<%} else { %>
			<%=product.getProduct_count() %>
			<%} %>
		</td>
		<td width="70"><%=product.getArea()%></td>
		<td width="100"><%=product.getBrand() %></td>
		<td width="100"><%=product.getLaunch_date() %></td>
		<td width="50"><%=product.getProduct_image() %></td>
		<td width="50"><%=product.getProduct_contimage() %></td>
		<td width="50"><%=product.getDiscount_rate() %></td>
		<td width="50"><%=sdf.format(product.getReg_date()) %></td>
		<td width="50">
			<a href="productUpdateForm.jsp?product_id=<%=product.getProduct_id()%>&product_kind=<%=product.getProduct_kind()%>">수정</a></td>
		<td width="50">
			<a href="productDeleteForm.jsp?product_id=<%=product.getProduct_id()%>&product_kind=<%=product.getProduct_kind()%>">삭제</a></td>
	</tr>
	<%} %>
	</table>
	<%} %>
	<div class="pagei" align="center">
		<%
		if (count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = 1;
			// 시작페이지 번호 설정, pagebloc이 10dlaus 1, 11, 21
			if (currentPage % 10 != 0)
				startPage = (int) (currentPage / 10) * 10 + 1;
			else
				startPage = ((int) (currentPage / 10) - 1) * 10 + 1;

			int pageBlock = 10;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;

			if (startPage > 10) {
	%>
	<a  href="productList.jsp?product_kind=<%=product_kind %>&pageNum=<%=startPage - 10%>">[이전]</a>
	<%
		}
			for (int i = startPage; i <= endPage; i++) {
	%>
	<a  href="productList.jsp?product_kind=<%=product_kind %>&pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endPage < pageCount) {
	%>
	<a href="productList.jsp?product_kind=<%=product_kind %>&pageNum=<%=startPage + 10%>">[다음]</a>
	<%
	}
}
	%>
	</div>
	<br>
	
	<p align="center"><a href="../managerMain.jsp">관리자 메인으로</a></p>

<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>