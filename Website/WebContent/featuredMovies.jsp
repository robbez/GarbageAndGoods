<%@ page import="java.sql.*, java.util.*, org.json.simple.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/garbagegoods", "newuser",
			"12345");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("SELECT MovieID, Title, coverImage FROM Movie ORDER BY releaseDate desc LIMIT 12");
	
	String movieID, movieTitle, coverURL;
	
	List<Map> movieItems= new ArrayList<Map>();
	
	while(rs.next()){
		
		Map item = new HashMap();		
		movieID = rs.getString(1);
		movieTitle = rs.getString(2);
		coverURL = rs.getString(3);
		
		item.put("movieID", movieID);
		item.put("movieTitle", movieTitle);
		item.put("coverURL", coverURL);
		
		movieItems.add(item);
		
	}
	
	String jsonObject = JSONValue.toJSONString(movieItems);
	out.print(jsonObject);
	
	movieItems.clear();
	rs = st.executeQuery("select m.movieID, m.Title, m.coverImage from purchase as p inner join movie as m on p.movieID = m.movieID where datediff(current_date(), p.purchaseDate) < 32 group by m.movieID order by count(m.movieID) desc limit 12");
	
	
	while(rs.next()){
		
		Map item = new HashMap();		
		movieID = rs.getString(1);
		movieTitle = rs.getString(2);
		coverURL = rs.getString(3);
		
		item.put("movieID", movieID);
		item.put("movieTitle", movieTitle);
		item.put("coverURL", coverURL);
		
		movieItems.add(item);
		
	}
	
	
	jsonObject = JSONValue.toJSONString(movieItems);
	out.print("|||" + jsonObject);
	
	
%>