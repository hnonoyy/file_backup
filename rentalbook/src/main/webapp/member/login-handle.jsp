<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.datasource.impl.OracleDataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 받아주고
	String uId = request.getParameter("u_id");
	String uPwd = request.getParameter("u_pwd");
	
	//2. 데이터베이스 조회 전에 디폴트 결과를 false로 설정 후 
	boolean result = false;
	
	if( !uId.isBlank() && !uPwd.isBlank()){ //3. 파라미터 값이 전달된 경우에 한해서
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("rentalbook");
		ods.setPassword("oracle");
		
		Connection conn = ods.getConnection();
		// 식별키로 조회하고
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM USERS WHERE USER_ID=?");
		stmt.setString(1, uId);
		
		ResultSet rs = stmt.executeQuery();
		// 식별용 컬럼 (Primary key) 으로 일치 검색하면, 있거나 없거나 둘 중 하나, if-else 확인만 하면 돼
		if(rs.next()){
			String dbPass = rs.getString("password"); // 그 데이터의 password 뽑아서
			if(dbPass.equals(uPwd)){ // 일치하는 경우만 true;
				result = true;
			}
		}
		conn.close();
		//-----------------------------------------------------------------------------------
	}
	if(result){
		session.setAttribute("auth", true);
		session.setAttribute("auth_user_id",uId); //
		response.sendRedirect(application.getContextPath()+"/index.jsp");
		return;
	}else{
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이전 | 동네도서관</title>
</head>
<body>
<script>
	window.alert("정보가 정확하지 않거나 접속권한이 없습니다.");
	location.href="<%=application.getContextPath()%>/member/login.jsp";
</script>
</body>
</html>
<%} %>