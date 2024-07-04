<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Book> books = new ArrayList<>();	

	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	
	PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOOKS ORDER BY PRICE");
	
	ResultSet rs = stmt.executeQuery();
	
	while(rs.next()){
		String title = rs.getString("title");
		String author =rs.getString("author");
		String publisher =rs.getString("publisher");
		int price = rs.getInt("price");
		int saleprice = rs.getInt("saleprice");
		String status =rs.getString("status");
		double discount = rs.getDouble("discount");
		Book one = new Book(title,author,publisher,price,saleprice,status,discount);
		books.add(one);
	}
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 도서 목록 </title>
</head>
<body>
	<h2>도서 목록</h2>
	<p> 등록된 중고도서 목록입니다.(낮은 가격 순)</p>
	<hr>
		<%for(Book o : books){ %>
			<p style="border-style:dashed; border-color: gray; padding: 10px; width: 500px;">
			제목 <%=o.title()%>(<%=o.author() %>/<%=o.publisher() %>)<br/>
			원가 <%=String.format("%,d",o.price())%>원 판매가 <%=String.format("%,d",o.saleprice()) %>원 
			<small>(정가대비 <b style="color: #ff4e6b"> <%=o.discount() %></b>% 할인)</small> <br/> 
			상품 상태 <b><%=o.status() %></b>
			</p>
		<%} %>
</body>
</html>