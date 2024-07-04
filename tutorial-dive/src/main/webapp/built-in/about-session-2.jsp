<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String value = (String)request.getSession().getAttribute("visited");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session :: built-in Objects</title>
</head>
<body>
<%@ include file="/nav.jsp" %>
	<h2>클라이언트 세션 확용</h2>
	<p>
		클라이언트들은 자기 의지와 상관없이 무조건 세션을 할당받게 돼있다.
		이 세션을 활용해서 사용자별로 개별 상태를 관리할 수 있게 된다.
	</p>
	<p>
		사용자 세션에 무언가를 기록을 시켜두고 싶으면 setAttribute(String key, Object value) 메서드를 사용하면 되고
		사용자 세션에 무언가를 가지고 있는지 확인하고 싶으면 getAttribute(String key) 메서드를 사용하면 된다.
		<small>(세션에는 숫자도 저장해야 될 수도 있고, 문자열도 저장해야 될 수도 있기 떄문에 
		제너릭을 String, Object 로 처리해둠. 그렇기 떄문에 get 을 할 떄 캐스팅을 해서 추출)</small>
	</p>
	<p>
		이 요청을 보낸 사용자의 세션에 저장된 visited 값 : <%=value %>
	</p>
</body>
</html>