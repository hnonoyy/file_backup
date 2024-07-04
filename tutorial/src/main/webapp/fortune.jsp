<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int number = 1+(int)(Math.random()*9);
	String[] colors = "빨강,주황,노랑,초록,파랑".split(",");
	String color = colors[(int)(Math.random()*colors.length)];
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 운세</title>
</head>
<body style="text-align: center;">
	<div>
	<img alt="오늘의 운세" src="https://media.bunjang.co.kr/product/181699861_1_1657437469_w360.jpg" width='400' height='350'>
	</div>
	<% if(Math.random()>0.5) {%>
		<h2 style='color:#ffe6a8;'>오늘은 기회와 도전이 가득한 날!</h2>
	<%} else {%>
		<h2 style='color:#a6c3e3;'>오늘은 행복과 만남이 가득한 날!</h2>
	<%} %>
	<p>🍀 행운의 숫자는 <b> <%=number%> </b> 이고, 색깔은 <b><%=color%></b>색이니 참고하세요.</p>
	<p>✨🎉오늘 하루 기쁨의 순간들을 즐기세요✨🎉</p>
	<a href="gugudan.hy">구구단 배우기</a>
</body>
</html>