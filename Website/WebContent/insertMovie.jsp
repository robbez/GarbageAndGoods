<%@ page import="java.sql.*"%>
<%
	String movieID = request.getParameter("movieID");
	String movieName = request.getParameter("movieName");
	String price = request.getParameter("price");
	String duration = request.getParameter("duration");
	String synopsis = request.getParameter("synopsis");
	String releaseDate = request.getParameter("movieDate");
	String coverImage = request.getParameter("coverImage");
	String inventory = request.getParameter("inventory");
	String rating = request.getParameter("rating");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/garbagegoods",
            "newuser", "12345");
	Statement st = con.createStatement();

	int i = st
			.executeUpdate("insert into movie(movieID, title, releaseDate, purchasePrice, duration, synopsis, coverImage, inventory, reviewRating) values (\""
					+ movieID
					+ "\", \""
					+ movieName
					+ "\", '"
					+ releaseDate
					+ "', "
					+ price
					+ ", '"
					+ duration
					+ "', \""
					+ synopsis
					+ "\", \""
					+ coverImage
					+  "\", " + inventory + ", " + rating + ")");
	if (i > 0) {
		//session.setAttribute("userid", user);
		response.sendRedirect("index.jsp");
		// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	} else {
		response.sendRedirect("error.jsp");
	}
%>