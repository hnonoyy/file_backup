<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="oracle.jdbc.pool.OracleDataSource"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	/* 클라이언트가 이 경로로 요청이 들어오면 Database에 연결해서
	insert 명령문을 수행할 수 있게 하는 작업을 진행하려 한다.
	*/
	
	String ip = "9.9.9.9";
	int turn = (int)(Math.random()*9)+1;
	double elapsed = Math.random()*100;
	
	OracleDataSource ods = new OracleDataSource();
	ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
	ods.setUser("playground");
	ods.setPassword("oracle");
	
	Connection conn = ods.getConnection();
	// 여기까지 익셉션이 안터지면 연결이 됐다는 것.
	System.out.println("Connected!"); // 확인용 출력
	
	//보내야할 명령문을 패킷화 해야함
	// PreparedStatement stmt = conn.prepareStatement("insert into ranks(ip, turn, elapsed) values ('"+ip+"', "+turn+", "+elapsed+")");
	PreparedStatement stmt = conn.prepareStatement("insert into ranks(ip, turn, elapsed) values (?,?,?)");
	stmt.setString(1, ip);
	stmt.setInt(2, turn);
	stmt.setDouble(3, elapsed);
	
	System.out.println("ready to send!!!!"); // 보낼 수 있는 준비완료
	
	// statement 객체가 만들어지면 execute??????() 계열의 메서드를 사용하면 된다.
	// 수행하고자 하는 작업에 따라서 ????? 부분이 달라진다.
	int r = stmt.executeUpdate(); //insert 작업의 경우 executeUpdate() 데이터가 총 몇 개가 조작됐는지 나옴
	
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC - insert</title>
</head>
<body>
	<h2>Insert Sample</h2>
	<% if(r==1){ %>
		<p>data insert success</p>
	<%} else{%>
		<p>data insert failed..</p>
	<%} %>
</body>
</html>