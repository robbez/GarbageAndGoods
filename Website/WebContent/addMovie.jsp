<%@page import="java.util.*"%>
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
<link rel="stylesheet" href="css/addMovie.css">
</head>
<body>
	<%@include file="checkLogin.jsp"%>
	<%@ page import="java.sql.*"%>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
				"12345");
		Statement st = con.createStatement();
		
		


		ResultSet rs = st
				.executeQuery("select count(purchaseID) from purchase where datediff(current_date(), purchaseDate) < 32");

		String result1 = "";
		String result2 = "";

		if (rs.next()) {
			result1 = rs.getString(1);
		}

		rs = st.executeQuery("select sum(totalPrice) from purchase where datediff(current_date(), purchaseDate) < 32");
		if (rs.next()) {
			result2 = rs.getString(1);
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



	<ul class="nav navbar-nav navbar-right" id="loginInfo"><%=loggedDropDown%></ul>



	</nav>
	<div id="mainContent">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<form class="form-horizontal" method="post"
						action="insertMovie.jsp" role="form">
						<fieldset>

							<!-- Form Name -->
							<legend>Movie Details</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">MovieID</label>
								<div class="col-sm-10">
									<input type="text" placeholder="movie id" class="form-control"
										name="movieID">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Genre</label>
								<div class="col-sm-10">
									<select name ="genre" id ="genre" class="form-control">
									</select>
								</div>
							</div>



							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Title</label>
								<div class="col-sm-10">
									<input type="text" placeholder="title" class="form-control"
										name="movieName">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Release
									Date</label>
								<div class="col-sm-10">
									<input type="text" placeholder="(YYYY/MM/DD)"
										class="form-control" name="movieDate">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Price</label>
								<div class="col-sm-10">
									<input type="text" placeholder="price" class="form-control"
										name="price">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Duration</label>
								<div class="col-sm-10">
									<input type="text" placeholder="00:00:00" class="form-control"
										name="duration">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Synopsis</label>
								<div class="col-sm-10">
									<input type="text" placeholder="comments..."
										class="form-control" name="synopsis">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Cover
									Image</label>
								<div class="col-sm-10">
									<input type="text" placeholder="image name"
										class="form-control" name="coverImage">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Inventory</label>
								<div class="col-sm-10">
									<input type="text" placeholder="number of items"
										class="form-control" name="inventory">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="textinput">Rating</label>
								<div class="col-sm-10">
									<input type="text" placeholder="0-10" class="form-control"
										name="rating">
								</div>
							</div>


							<div class=" col-md-9">
								<div class="pull-right">
									<button type="submit" class="btn btn-primary">Save</button>
								</div>
							</div>
				</div>

				</fieldset>
				</form>



			</div>

		</div>
		<div class="row">
			<table class="table table-list-search">
				<thead>
					<tr>
						<th>Total Sales for Past Month</th>
						<th>Total Revenue for Past Month</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=result1%></td>
						<td><%=result2%></td>

					</tr>
				</tbody>
			</table>
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
	<script type="text/javascript">
	$(document).ready(function() {
		retrieveHelper("getGenres.jsp", function(data) {
			data = $.parseJSON(data);
			$.each(data, function (index) {
				console.log(data[index].value);
				$("#genre").append("<option genID=\"" + data[index].id + "\">"+data[index].value+"</option>");
			});
		});
	});
	</script>
</body>
</html>