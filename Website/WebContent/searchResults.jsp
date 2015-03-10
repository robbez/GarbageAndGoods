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
		String pageNum = request.getParameter("page");
		
		int pagenumber;
		
		if(pageNum != null){
			pagenumber = Integer.parseInt(pageNum);
		} else {
			pagenumber = 0;
		}
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
		"12345");

		Statement st = con.createStatement();

		String movieSearchQuery = "select movieID, title, coverImage, synopsis from movie where title like '%"
		+ keyWord + "%'";
		String figureSearchQuery = "select figureID, figureName, figureImage, bibliography from figure where figureName like '%"
		+ keyWord + "%'";

		int resultCount = 0;
		List<Map> movieItems = new ArrayList<Map>();

		ResultSet listOfMoives = st.executeQuery(movieSearchQuery);
		while (listOfMoives.next()) {
			Map item = new HashMap();
			resultCount++;
			item.put("movieID", listOfMoives.getString(1));
			item.put("movieTitle", listOfMoives.getString(2));
			item.put("coverURL", listOfMoives.getString(3));
			item.put("synopsis", listOfMoives.getString(4));

			movieItems.add(item);
		}

		String foundMovieJSON = JSONValue.toJSONString(movieItems);

		movieItems.clear();

		ResultSet listOfFigure = st.executeQuery(figureSearchQuery);
		while (listOfFigure.next()) {
			Map item = new HashMap();
			resultCount++;
			item.put("figureID", listOfFigure.getString(1));
			item.put("figureName", listOfFigure.getString(2));
			item.put("figureImage", listOfFigure.getString(3));
			item.put("bibliography", listOfFigure.getString(4));

			movieItems.add(item);
		}

		String foundFigureJSON = JSONValue.toJSONString(movieItems);
		
		int totalPages = (resultCount % 5 == 0) ? resultCount / 5 : resultCount / 5 + 1;
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

	</nav>

	<div id="mainContent">
		<div class="container">

			<hgroup class="mb20">
			<h1>Search Results (Page <%=pagenumber+1%> of <%=totalPages %>)</h1>
			<h2 class="lead">
				<strong class="text-danger"><%=resultCount%></strong> results were
				found for the search for <strong class="text-danger">"<%=keyWord%>"</strong>
			</h2>
			</hgroup>

			<section class="col-xs-12 col-sm-6 col-md-12"> </section>
		</div>

		<div class="text-center">
			<ul class="pagination pagination-large">
			</ul>
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
	<script type="text/javascript" src="js/searchResults.js"></script>

	<script type="text/javascript">
		var moviedata =
	<%=foundMovieJSON%>
		;
		var figuredata =
	<%=foundFigureJSON%>
		;
		var minIndex =
	<%=pagenumber%>
		* 5;

		var index = minIndex;
		for (; index < moviedata.length && index < minIndex + 5; index++) {
			var newArticle = "<article \
				class=\"search-result row\"> \
			<div class=\"col-xs-12 col-sm-12 col-md-3\"> \
				<a href=\"movieItem.jsp?movieID=" + moviedata[index].movieID + "\" title='"+ moviedata[index].movieTitle+ "' class=\"thumbnail\"><img \
					src=\'res/img/movies/" + moviedata[index].coverURL + ".jpg'" + "alt="+moviedata[index].movieTitle+" /></a> \
			</div> \
			<div class=\"col-xs-12 col-sm-12 col-md-2\"> \
			</div> \
			<div class=\"col-xs-12 col-sm-12 col-md-7 excerpet\"> \
				<h3> \
					<a href=\"#\" title=" + moviedata[index].movieTitle + ">"
					+ moviedata[index].movieTitle
					+ "</a> \
				</h3> \
				<p>"
					+ moviedata[index].synopsis
					+ "</p> \
			</div> \
			<span class=\"clearfix borda\"></span> </article>";

			$("section").append(newArticle);
		}

		
		var usedItems = index;
		index = (minIndex > moviedata.length) ? minIndex - moviedata.length : 0;
		var comparison = (minIndex > moviedata.length) ? index + 5 : minIndex + 5 - usedItems ;

		for (; index < figuredata.length
				&& index < comparison; index++) {
			var newArticle = "<article \
				class=\"search-result row\"> \
			<div class=\"col-xs-12 col-sm-12 col-md-3\"> \
				<a href=\"#\" title='"+ figuredata[index].figureName+ "' class=\"thumbnail\"><img \
					src=\'res/img/figures/" + figuredata[index].figureImage + ".jpg'" + "alt="+figuredata[index].figureName+" /></a> \
			</div> \
			<div class=\"col-xs-12 col-sm-12 col-md-2\"> \
			</div> \
			<div class=\"col-xs-12 col-sm-12 col-md-7 excerpet\"> \
				<h3> \
					<a href=\"#\" title=" + figuredata[index].figureName + ">"
					+ figuredata[index].figureName
					+ "</a> \
				</h3> \
				<p>"
					+ figuredata[index].bibliography
					+ "</p> \
			</div> \
			<span class=\"clearfix borda\"></span> </article>";

			$("section").append(newArticle);
		}

		var currPage = <%=pagenumber%>;
		var totalPages = <%=totalPages%>;

		var leftelement = "<li";
		var rightelement = "<li";

		if (currPage == 0) {
			leftelement += " class = \"disabled\"" + "><a href=\"#\" rel=\"prev\">«</a></li>";
		} else {
			
			leftelement += "><a href=\"searchResults.jsp?searchInput=<%=keyWord%>&page=" + (currPage-1)  + "\" rel=\"prev\">«</a></li>";
		}
		
		if (currPage == totalPages - 1) {
			rightelement += " class = \"disabled\"" + "><a href=\"#\" rel=\"prev\">»</a></li>";
		} else {
			rightelement += "><a href=\"searchResults.jsp?searchInput=<%=keyWord%>&page=" + (currPage+1)  + "\" rel=\"prev\">»</a></li>";
		}
		
		
		$(".text-center ul").append(leftelement);
		$(".text-center ul").append(rightelement);

		console.log(totalPages);
	</script>


</body>
</html>