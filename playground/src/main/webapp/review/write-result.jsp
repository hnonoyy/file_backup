<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = request.getParameter("writer");
	String message =request.getParameter("message");
	int socre = Integer.parseInt(request.getParameter("score")) ;
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();

	PreparedStatement stmt= conn.prepareStatement("insert into reviews(writer,message,score) values(?,?,?)");
	
	stmt.setString(1, writer);
	stmt.setString(2, message);
	stmt.setInt(3, socre);
	
	int cnt = stmt.executeUpdate();
	
	conn.close();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
</head>
<body>
	<%if(cnt==1){ %>
		<p> 리뷰가 등록됐습니다.🥰 </p>
	<%} else {%>
		<p>데이터 처리 중 문제가 발생했습니다. <br/> 다시 작성해주세요😥 </p>	
	<%} %>
</body>
</html>