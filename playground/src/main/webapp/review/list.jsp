<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%
	List<Review> reviews = new ArrayList<>();

	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	
	PreparedStatement stmt = conn.prepareStatement("SELECT * FROM REVIEWS");
	
	ResultSet rs = stmt.executeQuery();
	
	
	while(rs.next()){
		//new Review(rs.getString(1), rs.getString(2), rs.getInt(1));
		String writer = rs.getString("writer");
		String message = rs.getString("message");
		int score = rs.getInt("score");
		Review one = new Review(writer,message,score); // 요령이 생기면 객체로 안 만들고 맵으로 처리하는 경우도 
		reviews.add(one);
	}
	conn.close();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<h2>방명록</h2>
	<p>
		이 곳을 방문했던 사람들이 남긴 메세지들입니다
	</p>
	<ul>
		<% for(Review o : reviews){ %>
			<li><%=o.message() %> (<b style="color: orange;"><%=o.score() %></b>점) <small style="color: silver;"> -<%=o.writer() %>-</small></li>
			
		<%} %>
	</ul>
</body>
</html>