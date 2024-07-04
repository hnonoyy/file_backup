<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("mode")==null){
		
		pageContext.forward("/overview.jsp");
		return;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext ::<%=application.getInitParameter("title") %></title>
</head>
<body>
	<h2>PageContext pageContext</h2>
	<p>
		현재 페이지의 정보와 동작을 관리하며, 다른 내장객체에 접근할 수 있는 방법을 제공한다.
	</p>
	<ul>
		<li><%=pageContext.getOut() == out %></li>
		<li><%=pageContext.getSession() == session %></li>
		<li><%=pageContext.getRequest() == request %></li>
	</ul>
	<p>
		이 객체는 대부분이 필요없는 메서드인데, forward 라는 유용한 메서드가 있다.
		나중에 데이터처리코드와 화면만드는 코드를 분리시켜서 어플리케이션을 개발할 때 자주 쓰이게 된다.
	</p>
</body>
</html>