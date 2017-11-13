<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="soccershop.master.SoccerShopDataBean"%>
<%@ page import="soccershop.master.SoccerShopDBBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ include file="../etc/color.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer Shopping Mall</title>
<!-- <link href="../etc/main_list.css" rel="stylesheet" type="text/css"> -->
<!-- Bootstrap core CSS -->
<link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="bootstrap/css/shop-item.css" rel="stylesheet">
</head>
<body bgcolor="<%=bodyback_c%>">
	<%
		String product_kind = request.getParameter("product_kind");
	%>

	<%
		int pageSize = 8;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		List<SoccerShopDataBean> productLists = null;
		SoccerShopDataBean productList = null;
		String product_kindName = "";
		SoccerShopDBBean productProcess = SoccerShopDBBean.getInstance();
		productLists = productProcess.getProducts(product_kind, startRow, endRow);

		count = productProcess.getProductCount();
		if (count > 0) {
			productLists = productProcess.getProducts(product_kind, startRow, endRow);
		}

		number = count - (currentPage - 1) * pageSize;
		if (product_kind.equals("100"))
			product_kindName = "축구화";
		else if (product_kind.equals("200"))
			product_kindName = "유니폼";
		else if (product_kind.equals("300"))
			product_kindName = "트레이닝복";
		else if (product_kind.equals("400"))
			product_kindName = "축구공";
		else if (product_kind.equals("500"))
			product_kindName = "악세사리";
		else if (product_kind.equals("all"))
			product_kindName = "전체";
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">SoccerMall</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li><jsp:include page="../module/top.jsp" flush="false" /></li>

				</ul>
			</div>
		</div>
	</nav>
	<br>
	<div class="container">
		<div class="row">


			<div class="col-lg-3">
				<jsp:include page="../module/left.jsp" flush="false" />
			</div>
			<div class="col-lg-9">
				<div class="row">
					<%-- <jsp:include page="./list_include.jsp" flush="false" /> --%>
					<%
						for (int i = 0; i < productLists.size(); i++) {
							productList = (SoccerShopDataBean) productLists.get(i);
					%>
					<div class="col-lg-3 col-md-4 mb-5">
						<div class="card h-100">
							<a
								href="productContent.jsp?product_id=<%=productList.getProduct_id()%>&product_kind=<%=product_kind%>"><img
								align="center"
								src="../../imageFile/<%=productList.getProduct_image()%>"
								width="140" height="180" alt=""></a>
							<div class="card-body">
								<a
									href="productContent.jsp?product_id=<%=productList.getProduct_id()%>&product_kind=<%=product_kind%>"><%=productList.getProduct_title()%></a>
								<br> <span style="text-decoration: line-through;">
									정가 : <%=NumberFormat.getInstance().format(productList.getProduct_price())%>원<br>
								</span> 판매가 : <b><font color="red"><%=NumberFormat.getInstance().format((int) (productList.getProduct_price()
						* ((double) (100 - productList.getDiscount_rate()) / 100)))%></font></b>원
								<p class="card-text">
									제조사 :
									<%=productList.getBrand()%><br>
									<%-- 생산지 : <%=productList.getArea()%> --%>
								</p>
							</div>
							<div class="card-footer">
								<small class="text-muted"> <%
							 	if (productList.getProduct_count() == 0) {
							 %>
								<b>일시품절</b> <%
							 	} else if (productList.getProduct_count() <= 10) {
							 %> <font
								class="blink" color="red"><b>인기 상품!!</b></font> <%
							 	} else if (productList.getProduct_count() <= 5) {
							 %>
								<font class="blink" color="red"><b>>재고 얼마 없음</b></font> <%
							 	} else {
							 %>
								<font class="blink" color="red"><b>신제품</b></font> <%
							 	}
							 %>
								</small>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<%
					if (product_kind.equals("all")) { /* number = count - (currentPage - 1) * pageSize; */
				%>
				<%
					} else {
						count = productProcess.getProductCount(product_kind);
						number = count - (currentPage - 1) * pageSize;
					}
				%>
				<div class="pagei" align="center">
					<%
						if (count > 0) {
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							int startPage = 1;
							// 시작페이지 번호 설정, pageblock이 10이면 1, 11, 21
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
					<a
						href="list.jsp?product_kind=<%=product_kind%>&pageNum=<%=startPage - 10%>">[이전]</a>
					<%
						}
							for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="list.jsp?product_kind=<%=product_kind%>&pageNum=<%=i%>">[<%=i%>]
					</a>
					<%
						}
							if (endPage < pageCount) {
					%>
					<a
						href="list.jsp?product_kind=<%=product_kind%>&pageNum=<%=startPage + 10%>">[다음]</a>
					<%
						}
						}
					%>
				</div>

			</div>
		</div>
	</div>

	<footer class="py-5 bg-dark">
		<div class="container">
			<jsp:include page="../module/bottom.jsp" flush="false" />
		</div>
		<!-- /.container -->
	</footer>
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>