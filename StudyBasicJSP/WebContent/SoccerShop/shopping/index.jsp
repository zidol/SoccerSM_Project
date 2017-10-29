<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Item - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/vendor/bootstrap/css/bootstrap.min.css?ver=1" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/shop-item.css?ver=1" rel="stylesheet">
	<style type="text/css">
		#manu-train{
			opacity: 0.4;
		}
	</style>
  </head>

  <body>

    <!-- Navigation -->
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

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <h1 class="my-4">SoccerMall</h1>
          <div class="list-group">
            <a href="../shopping/list.jsp?product_kind=all" class="list-group-item">전체보기</a>
            <a href="../shopping/list.jsp?product_kind=100" class="list-group-item ">축구화</a>
            <a href="../shopping/list.jsp?product_kind=200" class="list-group-item">유니폼</a>
             <a href="../shopping/list.jsp?product_kind=300" class="list-group-item">트레이닝복</a>
              <a href="../shopping/list.jsp?product_kind=400" class="list-group-item">축구공</a>
               <a href="../shopping/list.jsp?product_kind=500" class="list-group-item">악세사리</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <a href="productContent.jsp?product_id=1&product_kind=100"><img class="d-block img-fluid" 
                width="900" height="350" src="../manager/images/maindv05.jpg" alt="First slide"></a>
              </div>
              <div class="carousel-item">
                <a href="productContent.jsp?product_id=51&product_kind=100"><img class="d-block img-fluid" 
                src="../manager/images/maindv02.jpg" alt="Second slide"></a>
              </div>
              <div class="carousel-item">
                <a href="productContent.jsp?product_id=52&product_kind=100"><img class="d-block img-fluid" src="../manager/images/maindv01.jpg" alt="Third slide"></a>
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <div class="row">
			<jsp:include page="introList.jsp" flush="false"/>
          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <!-- <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p> -->
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>