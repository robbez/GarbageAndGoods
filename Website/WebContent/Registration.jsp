<%@ page import="java.sql.*"%>
<%
	String user = request.getParameter("userName");
	String pwd = request.getParameter("password");
	String fname = request.getParameter("inputName");
	
	String year = request.getParameter("txt_year");
	String month = request.getParameter("txt_month");
	String day = request.getParameter("txt_day");
	
	String dob = year + "/" + month + "/" + day;
	String email = request.getParameter("inputEmail");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
			"12345");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select * from customer where customerID='"
			+ user + "'");
	if (!rs.next()) {
		int i = st
				.executeUpdate("insert into customer(customerName, dateOfBirth, customerEmail, customerID, customerPassword) values ( \""
						+ fname
						+ "\", '"
						+ dob
						+ "', \""
						+ email
						+ "\", \"" + user + "\", \"" + pwd + "\")");
		if (i > 0) {
			//session.setAttribute("userid", user);
			response.sendRedirect("sucess.jsp");
			// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
		} else {
			response.sendRedirect("index.jsp");
		}
	}
	else {
        out.println("Invalid username <a href='reg.jsp'>try again</a>");
	}
%>