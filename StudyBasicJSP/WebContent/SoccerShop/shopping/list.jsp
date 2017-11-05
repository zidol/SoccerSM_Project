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
					<jsp:include page="./list_include.jsp" flush="false" />
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