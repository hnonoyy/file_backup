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
	<h2>Core Category</h2>
	<p>Core 계열의 태그는 반복, 조건처리, 변수 선언, 그리고 URL 관리등의 일반적인 작업을 수행하기 위해 설계된
		태그이다.</p>
	<h4>c:if 태그</h4>
	<div>
		if 처리가 필요할 때 사용한다 .
		<c:if test="${result }">
			<span>OKAY?</span>
		</c:if>
	</div>
	<h4>c:choose, c:when , c:otherwise</h4>
	<div>
		if-else 처리가 필요할 때 사용한다. ${code ==0 }, ${code ==1 }, ${code ==2 }
		<c:choose>
			<c:when test="${code ==0 }">
				<p>잘했군잘했어</p>
			</c:when>
			<c:when test="${code ==1 }">
				<p>쏘쏘...?</p>
			</c:when>
			<c:otherwise>
				<p>에궁..</p>
			</c:otherwise>
		</c:choose>
	</div>
	<h4>c:forEach</h4>
	<c:forEach var="i" begin="1" end="5" step="2">
		<p>
			<b>${i }</b> 반복처리를 하고자 할 때 사용한다. 일반 for 형태로 사용도 가능하고, enhanced for
			방식으로도 사용할 수 있다. step은 생략 가능 default가 1, 무조건 양수임(begin,end 둘다 0 이상)
		</p>
	</c:forEach>
	<div>
		<select>
			<c:forEach var="year" begin="0" end="74">
				<option>${2024 - year }</option>
			</c:forEach>
		</select> <select>
			<c:forEach var="month" begin="1" end="12">
				<option>${month }</option>
			</c:forEach>
		</select>
	</div>
	<ul>
		<c:forEach var="i" begin="0" end="${categoryLength-1 }">
			<li>${category[i] }</li>
		</c:forEach>
	</ul>
	<ul>
		<c:forEach var="one" items="${category }">
			<li>${one }</li>
		</c:forEach>
	</ul>
	<ul>
		<c:forEach var="one" items="${students }">
			<li>${one.name }(${one.bn }/${one.major }/${one.age })</li>
		</c:forEach>
	</ul>

</body>
</html>