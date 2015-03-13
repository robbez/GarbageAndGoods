<%@ page import="java.sql.*, java.util.*, org.json.simple.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
			"12345");
	Statement st = con.createStatement();

	ResultSet rs = st
			.executeQuery("select genreID, genreName from genre");
	List<Map> genres = new ArrayList<Map>();
	while(rs.next()){
		Map genreNameID = new HashMap();
		genreNameID.put("id", rs.getString(1));
		genreNameID.put("value", rs.getString(2));
		genres.add(genreNameID);
	}
	
	String jsonObject = JSONValue.toJSONString(genres);
	out.print(jsonObject);
%>