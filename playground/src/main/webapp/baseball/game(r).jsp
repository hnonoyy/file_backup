<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int[] target = (int[])session.getAttribute("target");
	if(target==null){
	response.sendRedirect(request.getContextPath()+"/baseball/ready.jsp");
}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>