<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial-MVC</title>
</head>
<body>
	<a href="${contextPath }/index">INDEX</a>
	<h2>Core Category</h2>
	<p>Core 계열의 태그는 반복, 조건처리, 변수 선언, 그리고 URL 관리등의 일반적인 작업을 수행하기 위해 설계된
		태그이다.
	</p>
	<h3>c:out</h3>
	<div>
		변수의 값을 안전하게 출력하는 태그이다. 
		꺽쇠와 같은 특수문자를 escape 처리하여 보안취약점을 방지해준다.
		<c:out value="${message }"/>
		<c:out value="${body }"/>
		<c:out value="${writerId }" default="탈퇴유저"/>
		${writerId == null ? '탈퇴유저' : writerId }
	</div>
	<h3>c:set</h3>
	<c:set var="n" value="1"/>
	<p>
		변수를 설정하고자 할 때 사용하는 태그 ${n }
	</p>
	<h3>c:url, c:param</h3>
	<p>
		URL 처리에 사용되는 태그이고, 파라미터 설정도 용이하다.
	</p>
	<ul>
		<c:forEach var="one" items="${students }">
			<c:url var="link" value="/student/view">
				<c:param name="bn" value="${one.bn }"/>
				<c:param name="sort" value="desc"/>
			</c:url>
			<li><a href="${contextPath }/student/view?bn=${one.bn}">${one.name }</a></li>
			<li><a href="${link }">${one.name }</a></li>
		</c:forEach>
	</ul>
</body>
</html>