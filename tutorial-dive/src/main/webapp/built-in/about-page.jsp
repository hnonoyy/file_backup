<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page || <%=application.getInitParameter("title") %></title>
</head>
<body>
	<h2>Object page</h2>
	<p>
		page 객체는 this 값이 설정되어있는 객체이다. <%= page == this %> 
	</p>
	<p>
		WAS가 만들어내는 jsp를 서블릿으로 변환하는 과정에서 필요해서
		객체값을 담아두는 용도로 변수를 잡아둔 것으로, 어플리케이션 개발자
		입장에서는 사용할 일이 없다.
	</p>
</body>
</html>