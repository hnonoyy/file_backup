<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String title = request.getParameter("title");
	String author =request.getParameter("author");
	String publisher =request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	int saleprice = Integer.parseInt(request.getParameter("saleprice"));
	String status =request.getParameter("status");
	double discount = (double)(price - saleprice) / price *100 ;
	
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	
	PreparedStatement stmt= 
			conn.prepareStatement("insert into books(title,author,publisher,price,saleprice,status,discount) values(?,?,?,?,?,?,?)");
	
	stmt.setString(1, title);
	stmt.setString(2, author);
	stmt.setString(3, publisher);
	stmt.setInt(4, price);
	stmt.setInt(5, saleprice);
	stmt.setString(6, status);
	stmt.setDouble(7, discount);
	
	int cnt = stmt.executeUpdate();
	
	conn.close();
%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고도서등록</title>
</head>
<body>
	
	<%if(cnt==1){ %>
		<h3 style="text-align: center;"> 도서가 등록됐습니다.🥰 </h3>
		<a href="<%= request.getContextPath()%>/books/book.jsp">다른 도서 등록하기</a>
	<%} else {%>
		<p>데이터 처리 중 문제가 발생했습니다. <br/> 다시 작성해주세요😥 </p>	
		<a href="<%= request.getContextPath()%>/books/book.jsp">도서 등록하기</a>
	<%} %>
</body>
</html>