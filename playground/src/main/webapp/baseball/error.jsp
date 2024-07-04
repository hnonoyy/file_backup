<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자야구</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>숫 자 야 구</h1>
		<p>
			데이터 처리 중에 오류가 발생했습니다. 
			<a href="<%=request.getContextPath()%>/baseball/game.jsp">잠시 후 다시 시도해주세요.</a>
		</p>
		<%=exception %>
	</div>
</body>
</html>