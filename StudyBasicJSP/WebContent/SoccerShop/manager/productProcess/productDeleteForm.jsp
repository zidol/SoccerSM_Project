<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
<link href="../../etc/main_list.css?ver=3" rel="stylesheet" type="text/css">
</head>
<body >
<p>상품 삭제</p>
<br>
<%
String id = "";
try {
	id =(String)session.getAttribute("id");
	if(id == null || id.equals("")) {
		response.sendRedirect("../logon/mangerLoginForm.jsp");
	} else {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String product_kind = request.getParameter("product_kind");
	
%>
	<form method="post" action="productDeletePro.jsp?product_id=<%=product_id %>&product_kind=<%=product_kind %>" 
	onsubmit="return deleteSave()" name="delForm">
		<table align="center">
			<tr>
				<td align="right" >
					<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp;
					<a href="productList.jsp?product_kind=<%=product_kind%>">목록으로</a>
			</tr>
			
			<tr>
				<td align="center" >
				<input type="submit" value="삭제">
			</tr>
		</table>
	</form>

<%}
}catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>