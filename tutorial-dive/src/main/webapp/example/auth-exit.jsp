<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.getSession().removeAttribute("auth");
	session.removeAttribute("auth");
	
	System.out.println(request.getSession() == session);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<p>
		인증해제 되었습니다.
	</p>
	<a href="<%=request.getContextPath()%>/example/auth.jsp">
		<button style=" background-color:transparent; border: none; " type="button"  > 재로그인하기 </button>
	</a>
</body>
</html>