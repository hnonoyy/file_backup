<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%	
	String sort = request.getParameter("sort");
	List<Book> books = new ArrayList<>();	

	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	
	String sql = "SELECT * FROM BOOKS";
	if (sort == null || sort.equals("ta")) {
		sql += " ORDER BY TITLE ASC";
	} else if (sort.equals("spd")) {
		sql += " ORDER BY SALEPRICE DESC";
	} else if (sort.equals("spa")) {
		sql += " ORDER BY SALEPRICE ASC";
	} else if(sort.equals("dc")){
		sql += " ORDER BY DISCOUNT DESC";
	} else if(sort.equals("da")){
		sql += " ORDER BY DISCOUNT";
	} else if(sort.equals("aa")){
		sql += " ORDER BY AUTHOR ASC ";
	}else {
		sql += " ORDER BY TITLE ASC";
	}
	PreparedStatement stmt = conn.prepareStatement(sql);
	

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
<style>
	button{
		border : 1px solid #008CBA;
		background-color: transparent;
		padding: 8px 8px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		color :#008CBA;
		margin: 4px 2px;
		transition-duration: 0.4s;
		cursor: pointer;
		border-radius: 10px;
	}
	.button2:hover {
  		background-color: #008CBA;
  		color: white;
	}
</style>
</head>
<body>
	<h2>📖도서 목록📖</h2>
	<p> 등록된 중고도서 목록입니다.</p>
	<hr>
	<a href="<%=request.getContextPath()%>/books/book-list.jsp?sort=ta"><button class="button button2">책 가나다순</button></a>
	<a href="<%=request.getContextPath()%>/books/book-list.jsp?sort=aa"><button class="button button2">저자 가나다순</button></a>
	<a href="<%=request.getContextPath()%>/books/book-list.jsp?sort=spd"><button class="button button2">가격높은순</button></a>
	<a href="<%=request.getContextPath()%>/books/book-list.jsp?sort=spa"><button class="button button2">가격낮은순</button></a>
	<a href="<%=request.getContextPath()%>/books/book-list.jsp?sort=dc"><button class="button button2">할인율높은순</button></a>
	<a href="<%=request.getContextPath()%>/books/book-list.jsp?sort=da"><button class="button button2">할인율낮은순</button></a>
	
	<%for(Book o : books){ %>
			<p style="border-style:dotted; border-color: gray; padding: 10px; width: 500px;">
			제목 <%=o.title()%>(<%=o.author() %>/<%=o.publisher() %>)<br/>
			원가 <del style="color: gray;"><%=String.format("%,d",o.price())%>원</del> 판매가 <%=String.format("%,d",o.saleprice()) %>원 
			<small>(정가대비 <b style="color: #ff4e6b"> <%=o.discount() %></b>% 할인)</small> <br/> 
			상품 상태 <b><%=o.status() %></b>
			</p>
	<%} %>

</body>
</html>