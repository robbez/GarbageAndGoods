<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("userame");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/garbagegoods",
            "newuser", "12345");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from customer where customerID='" + userid + "' and customerPassword='" + pwd + "'");
	Cookie user = new Cookie("userName", userid);
    if (rs.next()) {
        session.setAttribute("userid", userid);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    } else {
        out.println("Invalid password <a href='Index.jsp'>try again</a>");
    }
%>