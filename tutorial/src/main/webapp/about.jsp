<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	java.time.LocalDate data = java.time.LocalDate.now();
	//scriptlet
	int a = (int) (Math.random() * 6);
	System.out.println("a=" + a);
	request.getRemoteAddr();
	request.getQueryString();
	String title = request.getParameter("title");
	System.out.println("title="+title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Application</title>
</head>
<body>
	<h1>JSP(Java Server Page)</h1>
	<p style="text-align: center;">
		📆 <%= data.toString() %>
	</p>
	<p>
		JSP는 Java Server Page의 약자로, 자바를 사용하여 동적 웹 페이지를 개발할 때 사용하는 기술이다.
	</p>
	<p>
		JSP는 HTML 코드 안에 자바 코드를 삽입할 수 있는 특징을 가지고 있다. 
		스크립트릿을 이용해서 데이터를 처리한다거나, 표현식을 이용해서 값을 출력할 수 있다.
	</p>
</body>
</html>