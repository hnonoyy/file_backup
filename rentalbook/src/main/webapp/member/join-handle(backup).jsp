<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="member/join-error.jsp" %>
<%
	String userId = request.getParameter("user_id");
	String password = request.getParameter("password");
	String password_check = request.getParameter("password_check");
	String nickname = request.getParameter("nickname");
	String gender = request.getParameter("gender");
	
	//데이터 유효성 검사
	if(userId.isBlank() || password.isBlank() || password_check.isBlank() || !password.equals(password_check) || nickname.isBlank()){
		//무언가를 해야함
		return;
	}
	
	UserDao userDao = new UserDao();
	User found = userDao.findByUserId(userId);
	
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("rentalbook");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();	
	
	PreparedStatement stmt = conn.prepareStatement("INSERT INTO USERS VALUES (?,?,?,?,?)");
	stmt.setString(1, userId);
	stmt.setString(2, password);
	stmt.setString(3, nickname);
	stmt.setString(4, gender);
	stmt.setDate(5, new Date(System.currentTimeMillis()));
	
	int r = stmt.executeUpdate();

	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입결과 | 동네도서관</title>
</head>
<body>
	<div style="width : 840px; margin: auto; text-align: center;">
		<h2>회원가입처리결과</h2>
		
		<%if(r==1){ %>
			<p>
				<b><%= nickname %></b>님 회원가입을 축하합니다. <br/>
				이제 동네도서관을 이용할 수 있습니다.
			</p>
		<%}else{ %>
			
		<%} %>
	</div>
</body>
</html>