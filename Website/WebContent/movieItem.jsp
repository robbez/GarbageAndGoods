<%@ page import="java.sql.*, java.util.*, org.json.simple.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
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
<link rel="stylesheet" href="css/movieItem.css">
</head>
<body>
	<%@include file="checkLogin.jsp"%>
	<%
		String movieID = request.getParameter("movieID");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
				"12345");

		Statement st = con.createStatement();

		String movieSearchQuery = "select title, coverImage, synopsis, releaseDate, purchasePrice, duration, reviewRating, inventory from movie where movieID = '"+
		movieID + "'"  ;

		ResultSet listOfMoives = st.executeQuery(movieSearchQuery);
		
		String movieTitle = "";
		String movieImgURL = "";
		String movieDescription = "";
		String movieReleaseDate = "";
		String moviePrice = "";
		String movieDuration = "";
		String movieRating = "";
		int movieInventory = 0;
		
		if (listOfMoives.next()) {
			movieTitle = listOfMoives.getString(1);
			movieImgURL = "res/img/movies/" + listOfMoives.getString(2) + ".jpg";
			movieDescription = listOfMoives.getString(3);
			movieReleaseDate = listOfMoives.getString(4);
			moviePrice = listOfMoives.getString(5);
			movieDuration = listOfMoives.getString(6);
			movieRating = listOfMoives.getString(7);
			movieInventory = Integer.parseInt(listOfMoives.getString(8));
		}
		
		String stock;
		String stockClass;
		
		if(movieInventory == 0){
			 stock = "Out of Stock";
			 stockClass = "product-no-stock";
		} else {
			 stock = "In Stock";
			 stockClass = "product-stock";
		}
		
		String purchaseButtonStatus = "";
		
		if(!signedIn || movieInventory == 0){
			purchaseButtonStatus = "disabled=\"disabled\"";
		}
		
	%>

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

	<div id="mainContent">
		<div class="container-fluid">
			<div class="content-wrapper">
				<div class="item-container">
					<div class="container">
						<div class="col-md-12">
							<div class="product">
									<img id="item-display"
										src="<%= movieImgURL %>"
										alt="<%= movieTitle %>"></img>
							</div>

						</div>

						<div class="col-md-7">
							<div class="product-title"><%= movieTitle %></div>
							<div class="product-desc"><%= movieDescription %></div>
							<div class="product-rating">

							</div>
							<hr>
							<div class="product-price">$ <%= moviePrice %></div>
							<div class="<%=stockClass%>"><%=stock %></div>
							<hr>
							<div class="btn-group cart">
								<button type="button" class="btn btn-success" <%= purchaseButtonStatus %>>Purchase Item</button>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="col-md-12 product-info">
						<ul id="myTab" class="nav nav-tabs nav_tabs">

							<li class="active"><a href="#service-one" data-toggle="tab">DESCRIPTION</a></li>
							<li><a href="#service-two" data-toggle="tab">PRODUCT
									INFO</a></li>
							<li><a href="#service-three" data-toggle="tab">REVIEWS</a></li>

						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="service-one">

								<section class="container product-info"> 
									<%= movieDescription %>
								</section>

							</div>
							<div class="tab-pane fade" id="service-two">

								<section class="container product-info"> 
									<li>Realease Date: <%= movieReleaseDate %></li>
									<li>Duration: <%= movieDuration %></li>
									<li>Rating: <%= movieRating %></li>
								</section>

							</div>
							<div class="tab-pane fade" id="service-three"></div>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>



	<footer class="bs-footer">
	<div class="container">
		<p>Copyright @ Garbage&Goods 2015</p>
		<p>
			<a href="#">Back to top</a>
		</p>
	</div>
	</footer>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="js/jquery.validate.min.js"></script>

	<script type="text/javascript">
		
	</script>


</body>
</html>