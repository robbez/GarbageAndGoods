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
<link rel="stylesheet" href="css/searchResults.css">
</head>
<body>
	<%
		String keyWord = request.getParameter("searchInput");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
				"12345");

		Statement st = con.createStatement();

		String movieSearchQuery = "select movieID, title, coverImage from movie where title like '%"
				+ keyWord + "%'";
		String figureSearchQuery = "select figureID, figureName, figureImage from figure where figureName like '%"
				+ keyWord + "%'";

		List<Map> movieItems = new ArrayList<Map>();

		ResultSet listOfMoives = st.executeQuery(movieSearchQuery);
		while (listOfMoives.next()) {
			Map item = new HashMap();

			item.put("movieID", listOfMoives.getString(1));
			item.put("movieTitle", listOfMoives.getString(2));
			item.put("coverURL", listOfMoives.getString(3));

			movieItems.add(item);
		}

		String jsonObject = JSONValue.toJSONString(movieItems);
		out.print(jsonObject);

		movieItems.clear();

		ResultSet listOfFigure = st.executeQuery(figureSearchQuery);
		while (listOfFigure.next()) {
			Map item = new HashMap();

			item.put("figureID", listOfFigure.getString(1));
			item.put("figureName", listOfFigure.getString(2));
			item.put("figureImg", listOfFigure.getString(3));

			movieItems.add(item);
		}

		jsonObject = JSONValue.toJSONString(movieItems);
		out.print("|||" + jsonObject);
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
				<li><a href="#">NIGGA</a></li>
				<li><a href="#">ABDUL</a></li>
				<li><a href="#">MAX</a></li>
				<li><a href="#">PLINTUS</a></li>
			</ul>
		</div>
	</div>

	</nav>
	
	<div id="mainContent">
		
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
	<script type="text/javascript" src="js/searchResults.js"></script>


</body>
</html>