<%@page import="model.Rank"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Rank> ranks = (List<Rank>)application.getAttribute("ranks");
	int position = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자야구 랭킹순위</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>숫자야구</h1>
		<h3>랭킹순위</h3>
		
		<%for(Rank one : ranks) {
			position++;
			if(position > 5) {
				break;
			}
			%>
			<p>
				<b>#<%=position %></b>
				<%=one.ip()%> 
				<small>(
				시도횟수 : <%=one.turn() %>			
				걸린시간 : <%=one.elapsed() %>ms
				)</small>
			</p>
		<%} %>
	</div>
</body>
</html>