<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<link href="../bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../bootstrap/css/shop-item.css" rel="stylesheet">
<title>toppage</title>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
try {
	if(session.getAttribute("id")==null) {%>	
	<form method="post" action="../shopping/loginPro.jsp">
		<div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
        
          	<li class="nav-item active">
              	<font color="#868e96">아이디  : </font> <input type="text" name="id" size="20" maxlength="50">&nbsp;
            </li>
            
            <li class="nav-item active">
              	<font color="#868e96">비밀번호  : </font> <input type="password" name="passwd" size="20" maxlength="16">
				<input type="submit" value="로그인">
            </li>
             <li class="nav-item">
          		<a class="nav-link" href="../shopping/list.jsp?product_kind=all">전체목록보기</a>
          	</li>
          	 <li class="nav-item">
          		<a class="nav-link" href="./registrationform/registration.html">회원 가입</a>
          	</li>
          <!--  <li class="nav-item">
      		 <font color="red" class="nav-link" >*반드시 로그인을 하셔야 쇼핑몰을 하실 수 있습니다.*</font>
          </li> -->
		</ul>
		</div>
	</form>
	
	<%}else if(session.getAttribute("id").equals("soccermanager@shop.com")){ %>
	
	<div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          <li class="nav-item">
          <b class="nav-link"><%=session.getAttribute("id") %>님은 관리자 이십니다.</b> 
          </li>
          <li class="nav-item">
              <a class="nav-link" href="../manager/managerMain.jsp">관리자 페이지</a>
            </li>
          <li class="nav-item">
				<a class="nav-link" href="../shopping/logout.jsp">로그아웃</a>
            </li>
          </ul>
    </div>
		
		<!-- <input type="button" value="로그아웃"
		onclick="javascript:window.location='../shopping/logout.jsp'"> -->
	<%} else { %>
		<div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">

            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../shopping/list.jsp?product_kind=all">전체보기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../shopping/cartList.jsp?product_kind=all">장바구니</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../shopping/buyList.jsp">구매목록 보기</a>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li> -->
            <li class="nav-item">
              <!-- <input type="button" value="로그아웃"
		onclick="javascript:window.location='../shopping/logout.jsp'"> -->
				<a class="nav-link" href="../shopping/logout.jsp">로그아웃</a>
            </li>
          </ul>
        </div>
		
	
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>