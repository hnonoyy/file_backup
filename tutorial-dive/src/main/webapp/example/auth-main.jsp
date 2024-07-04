<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String auth = (String)request.getSession().getAttribute("auth");
	if(auth==null){
		response.sendRedirect(request.getContextPath()+"/example/auth.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>
	<h2>관리자 모드</h2>
	<p>
		관리자님 어떤 설정을 하시겠습니까?
	</p>
</body>
</html>