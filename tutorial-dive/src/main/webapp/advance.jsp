<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>advance :: <%=application.getInitParameter("title") %></title>
</head>
<body>
	<h2>Listener</h2>
	<p>
		웹 어플리케이션을 만들 때 가장 이해를 잘 해야되는 객체는
		request, response, session, application 객체 이렇게 4개이다.
	</p>
	<p>
		이 객체들을 다를 때 부족한 부분들은 listener 라는 걸 이용해서 보완할 수 있다. (이벤트감지)
	</p>
	<p>
		listener 를 사용하면 application 이 만들어질때, 혹은 session이 만들어질 때, 혹은
		request가 들어올 때마다 등등 특정 상황이 발생했을 때 자동으로 어떤 작업이 일어날 
	</p>
</body>
</html>