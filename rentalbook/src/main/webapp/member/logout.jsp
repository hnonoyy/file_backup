<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("auth", false);
	session.setAttribute("auth_user_id", null);

 	//session.setAttribute("auth", false);
	session.invalidate(); // 이 사용자의 세션을 강제 종료
	response.sendRedirect(application.getContextPath()+"/index.jsp");

	
%>
