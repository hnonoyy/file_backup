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
		각 영역에 세팅된 데이터 외에도 자주 출력이 일어나는 것들은 미리 설정이 돼있다.
	</p>
	<h3>Parameter</h3>
	<ul>
		<li>${param.mode}</li>
		<li>${param['mode']}</li>
	</ul>
	<h3>paramValues</h3>
	<ul>
		<li>${paramValues['data-n'][0]}</li>
		<li>${paramValues['data-n'][1]}</li>
	</ul>
	<h3>pageContext</h3>
	<ul>
		<li>${pageContext.servletContext.contextPath }</li>
		<li>${pageContext.session.id }</li>
	</ul>
	<h3>화면을 만드는데 로직이 필요하다면?</h3>
	<p>
		컨트롤러에서 데이터가 세팅되어서 넘어오더라도, 화면을 만들다 보면 
		최소한 if/ if-else, for 등을 사용할 수 밖에 없다.
		이 때 사용하려고 만들어둔 태그들이 존재한다. 
		=> JSTL(Jsp Standard Tag Library)을 제공한다.
	</p>
	
</body>
</html>