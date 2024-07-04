<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean valid = false;
	int n=0;
	int k=0;
	int price = 0;
	
	if(request.getParameter("n") == null|| request.getParameter("k") == null){
		valid = false;
	}else{
		valid = true;
		n = Integer.parseInt(request.getParameter("n"));
		k = Integer.parseInt(request.getParameter("k"));
		
		price = n * 12000 + k * 2000 - (n / 10 * 2000);
		String result = String.format("%,d", price);
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양꼬치 계산 풀이</title>
</head>
<body>
	<a href="../overview.jsp">메인으로 돌아가기</a>
	<% if(valid) { %>
	<div style="text-align: center;">
		<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyiogWsJHYRVtG0B1dR8-Zju5od9BeZN1Qgg&s' width='200' height='200'/>;
	</div>
	<p style ='text-align:center; font-size:120%;'><b><br/> 
	양꼬치🍢<%=n %>인분 <br/> 음료수 🥂 <%=k %>병</b></p>
	<p  style='color:#ca3131; text-align:center; font-size:150%;'><b> 
	계산금액 : 총 <%=price %>원</b></p>
	<%}else { %>
	<p>
	양꼬치를 먹은 양과 음료수를 마신 양은 필수로 전달되어야 합니다.
	</p>
	<% }%>
	
	<a href="./lamb.jsp" > 다시 풀어보기</a>
</body>
</html>