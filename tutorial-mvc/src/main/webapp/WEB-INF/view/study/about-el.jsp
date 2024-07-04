<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial-MVC</title>
</head>
<body>
	<h2>EL Usage</h2>
	<p>
		데이터 출력을 할 때 세팅된 객체가 Map이거나 VO형 객체면 내부 속성을 접근할 수 있다.
	</p>
	<ul>
		<li>${pages.total } | ${pages.get('total') } | ${pages['total'] } </li>
		<li>${pages.start } | ${pages.get('start') }</li>
		<li>${pages.end } | ${pages.get('end') }</li>
	</ul>
	<p>
		EL tag 내에서 객체의 메서드를 호출하는 건 비권장 사항이다.
	</p>
	<ul>
		<li>${soldier.sn } | ${soldier.getSn() } get계열을 작동시키는것 get이 없으면 터짐</li>
		<li>${soldier.name } | ${soldier.getName() }</li>
		<li>${soldier.type } | ${soldier.getType() }</li>
	</ul>
	<ul>
		<li>${student.bn }</li>
		<li>${student.name } | ${student['name'] }</li>
		<li>${student.major }</li>
	</ul>
	<p>
		데이터 출력을 할 때 세팅된 객체가 배열이나 List형 객체여도 출력을 지원한다.
	</p>
	<ul>
		<li>${category[0] }</li>
		<li>${students[0].name }</li>
	</ul>
</body>
</html>