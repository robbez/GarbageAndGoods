<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GarbageAndGoods</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="css/mainStyle.css">
</head>
<body>
	<%@include file="checkLogin.jsp"%>

	<nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
	<div class="container navbar-left" id="navLinks">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<a href="index.jsp" class="navbar-brand">Garbage And Goods</a>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse">

			<ul class="nav navbar-nav">
				<li><a href="index.jsp">HOME</a></li>
				<li><a href="#">BROWSE</a></li>
			</ul>
		</div>
	</div>



	<ul class="nav navbar-nav navbar-right" id="loginInfo"><%= loggedDropDown%></ul>



	</nav>

	<div class="jumbotron">
		<div class="ontainer text-center">
			<h1>Garbage & Goods</h1>
			<p>Welcome to the best movie store!</p>

			<form method="post" action="searchResults.jsp" class="searchBox">
				<span id="searchBtn" class="glyphicon glyphicon-search"></span> <input
					type="search" class="form-control" placeholder="Search"
					id="searchInput" name="searchInput">
			</form>
		</div>
	</div>

	<div id="mainContent">

		<div class="movie-item" id="latestMovies">

			<h2>Latest Releases</h2>

			<div id="featuredMoviesCarousel" class="carousel slide"
				data-interval="0" data-ride="carousel">
				<!-- Carousel indicators -->
				<ol class="carousel-indicators">
					<li data-target="#featuredMoviesCarousel" data-slide-to="0"
						class="active"></li>
					<li data-target="#featuredMoviesCarousel" data-slide-to="1"></li>
					<li data-target="#featuredMoviesCarousel" data-slide-to="2"></li>
				</ol>
				<!-- Carousel items -->
				<div class="carousel-inner">
					<div class="active item">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Carousel nav -->
				<a class="carousel-control left" href="#featuredMoviesCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="carousel-control right" href="#featuredMoviesCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>

		<div class="movie-item" id="topSellerMovies">

			<h2>Top Sellers</h2>

			<div id="newestCarousel" class="carousel slide" data-interval="0"
				data-ride="carousel">
				<!-- Carousel indicators -->
				<ol class="carousel-indicators">
					<li data-target="#newestCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#newestCarousel" data-slide-to="1"></li>
					<li data-target="#newestCarousel" data-slide-to="2"></li>
				</ol>
				<!-- Carousel items -->
				<div class="carousel-inner">
					<div class="active item">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-caption">
							<div class="row">
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" class="thumbnail"> <img class="img"
										src=""
										alt="">
										<p></p>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Carousel nav -->
				<a class="carousel-control left" href="#newestCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="carousel-control right" href="#newestCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>

	<footer class="blog-footer">
	<p>Copyright @ Garbage&Goods 2015</p>
	<p>
		<a href="#">Back to top</a>
	</p>
	</footer>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/dbRetrieve.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
</body>
</html>