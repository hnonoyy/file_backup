<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태그라이브러리 지시어</title>
</head>
<body>
<%@ include file="./nav.jsp" %>
	<x:today align="center"/>
	<h3>taglib directive</h3>
	<p>
		태그라이브러리 지시어는 사용자 정의 태그를 JSP 페이지에서 사용하고자 할 때 쓰인다.
	</p>
</body>
</html>