<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int r = 2 + (int) (Math.random() * 8);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 학습 (<%=r%>단)
</title>
</head>
<body>
	<h2>구구단 학습</h2>
	<p>
		구구단은 기초적인 곱셈표로 효율적인 곱셈계산을 위한 기초입니다. <b><%=r%></b>단을 예로 살펴봅시다.
	</p>
	<h3><%=r%>단
	</h3>
	<ul>
	<% for (int i = 1; i <= 9; i++) { %>
		<li><%=r%>X<%=i%>=<%=r * i%></li>
	<%}	%>
	</ul>
</body>
</html>