<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial-MVC</title>
</head>
<body>
	<c:url value="/index" />
	<h2>JSTL</h2>
	<p>
		Jsp Standard Tag Library 는 JSP로 화면을 만들때 사용되는 자바 코드를 태그화 시켜둔 라이브러리이다.
		크게 5개의 카테고리로 나눠져있다. 주로 사용하는건 세개 카테고리다.
	</p>
	<ul>
		<li>core tag : 흐름 제어, URL 처리, 변수 관리 등 기본적인 작업을 위한 태그들을 제공</li>
		<li>fmt tag : 날짜, 시간, 숫자의 형식화를 하기 위한 태그들을 제공</li>
		<li>functions tag : 문자열 데이터를 처리하는 함수들을 제공</li>
		<li><del>sql tag : 데이터베이스 작업을 위한 태그들을 제공</del></li>
		<li><del>xml tag : XML 데이터 작업을 위한 태그들을 제공</del></li>
	</ul>
</body>
</html>