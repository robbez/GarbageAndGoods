<%@page import="java.io.Console"%>
<%@page import="javax.rmi.CORBA.UtilDelegate"%>
<%@ page import="java.sql.*"%>
<%
	int purchaseID = 0;
	String customerID = request.getParameter("custID");
	String movieID = request.getParameter("movieID");
	double price = 0.0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
	"12345");
	Statement st = con.createStatement();
	java.util.Calendar cal = java.util.Calendar.getInstance();
	java.util.Date utilDate = cal.getTime();
	Date sqlDate = new Date(utilDate.getTime());
	ResultSet rs =
	st.executeQuery("Select purchaseID From purchase");
	
	int maxID = 0;
	
	while(rs.next()){
		purchaseID = Integer.parseInt(rs.getString(1));
		if(maxID < purchaseID)
	maxID = purchaseID;
	}
	purchaseID = maxID + 1;
	rs =
	st.executeQuery("Select purchasePrice From movie where movieID = '" + movieID + "'");
	
	if(rs.next()){
		price = Double.parseDouble(rs.getString(1));
	}
	
	out.print(price);
	out.print(customerID);
	out.print(movieID);
	out.print(purchaseID);
	
	int i = st
	.executeUpdate("insert into purchase(purchaseID, movieID, customerID, totalPrice, purchaseDate) values (\""
			+ purchaseID
			+ "\", \""
			+ movieID
			+ "\", \""
			+ customerID
			+ "\", '"
			+ price
			+ "', '"
			+ sqlDate
			+ "')");
	if (i < 0) {
		//session.setAttribute("userid", user);
		response.sendRedirect("error.jsp");
		// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	} else {
		i = st.executeUpdate("UPDATE movie SET inventory = inventory-1  WHERE movieID = '" + movieID + "'");
		if (i < 0){
	response.sendRedirect("error.jsp");
		} else {
	
			response.sendRedirect("Success.jsp");

		}

	}
%>