<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼각형의 완성조건</title>
</head>
<body>
	<h2>삼각형</h2>
	<p>
		세변으로 삼각형이 구성되려면, 각 변은 남은 두 변의 합보다 작아야 합니다.
	</p>
	<form action="<%= request.getContextPath()%>/example/triangle-result.jsp">
		<input type="number" name="line"/>
		<input type="number" name="line"/>
		<input type="number" name="line"/>
		<button type="submit">검증</button>
	</form>
</body>
</html>