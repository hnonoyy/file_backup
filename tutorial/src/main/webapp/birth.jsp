<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for loop in JSP</title>
</head>
<body>
	<h2>JSP에서 for문을 이용하기</h2>
	<p>
		JSP 로 if 처리 혹은 for 반복처리는 작성하는데 익숙해질 필요가 있다. 
	</p>
	<h4>당신의 생년월일을 선택해주세요</h4>
	
	<select>
		<% for(int i=2024;i>=1900;i--){ %>
			<option><%=i %></option>
		<%} %>
		
	</select>
	년
	<select>
		<% for(int i=1;i<=12;i++){ %>
			<option><%=i %></option>
		<%} %>
	</select>
	월
	<select>
		<% for(int i=1;i<=31;i++){ %>
			<option><%=i %></option>
		<%} %>
	</select>
	일
	<button>동의 및 전송</button>
</body>
</html>