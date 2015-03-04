
<%@page import="java.sql.Connection"%>
<%@page import="data.dbConnect.DBConnectionPool"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String url = "jdbc:mysql://localhost:3306/CSS490D";
		String username = "newuser";
		String passwd = "12345";
		
		DBConnectionPool connPool = new DBConnectionPool(url, username, passwd);
		Connection conn = connPool.getConnection();
		if(conn != null)
		{
			out.println("Success");
		} else {
			out.println("Failed");
		}
	%>
</body>
</html>
