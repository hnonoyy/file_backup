<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
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
		UserDao userDao = new UserDao();
		User found = userDao.findByUserId(uId);
		
		if(found != null){
			result = found.password().equals(uPwd) ? true : false;
		}
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