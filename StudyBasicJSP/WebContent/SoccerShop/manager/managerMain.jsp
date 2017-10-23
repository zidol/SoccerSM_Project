<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
</head>
<body>
<%
String id = "";
try {
	id = (String)session.getAttribute("id");
	
	if(id==null || id.equals("") ) {
		response.sendRedirect("../shopping/index.jsp");
	} else {
%>
<form method="post" action="../shopping/logout.jsp">
	<b>관리작업중..</b>
	<br>
	<input type="submit" value="로그아웃">
</form>
<table>
	<tr><td align="center" bgcolor="<%=bar%>">상품관련 작업</td></tr>
	<tr>
		<td>
		<a href='productProcess/productRegisterForm.jsp'>상품등록</a>
		</td>
	</tr>
	<tr>
		<td>
		<a href='productProcess/productList.jsp?product_kind=all'>상품수정/삭제</a>
		</td>
	</tr>
</table><br><br>
<table>
	<tr> <td align="center" bgcolor="<%=bar%>">구매된 상품관련작업</td>
	</tr>
	<tr><td>
	<a href='orderedProduct/orderedList.jsp'>전체구매 목록확인</a>
	</td>
	</tr>
</table>
<%
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	
</body>
</html>