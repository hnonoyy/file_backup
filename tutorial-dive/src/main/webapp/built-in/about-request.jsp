<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request :: Built-in Objects</title>
</head>
<body>
	<%@ include file="/nav.jsp" %>
	<h2>HttpServletRequest request</h2>
	<p>
		request 객체의 클라이언트 요청 정보를 담고 있는 굉장히 중요한 객체이다.
		이미 데이터 입력값 얻어낼 때 getParameter 메서드를 사용해보았는데, 이것 말고도
		굉장히 많은 메서드들을 가지고 있다. 중요하고 자주 사용되는 메서드들에 대해서 살펴보자.
	</p>
	<h3>기본 정보 메서드</h3>
	<%
		String method = request.getMethod(); 
		//사용자가 어떻게 들어왔는지 알 수 있다 보통은 링크를 타고 들어오는 요청, 직접 치는 것도 get form은 들어오는 방식을 바꿀수잇음
	
		String contextPath = request.getContextPath(); // 어디서 작동하는건지..! 경로를 만들 때 보통 절대경로를 설정해줘야하는데 contextPath를 꼭 설정해줘야한다.
		String requestURI = request.getRequestURI(); //사용자가 작동하는 page가 뜨는거
		StringBuffer requestRUL = request.getRequestURL(); 
		String x = requestRUL.toString();
		Locale locale = request.getLocale(); 
		String remoteAddr = request.getRemoteAddr();
		int remotePort =request.getRemotePort();
	%>
	<ul>
		<li>getMethod :  <%=method %></li>
		<li>getContextPath :  <%=contextPath %></li>
		<li>getRequestURI :  <%=requestURI %></li>
		<li>getRequestURL :  <%=requestRUL %></li>
		<li>getLocale :  <%=locale %></li>
		<li>getRemoteAddr :  <%=remoteAddr %></li>
		<li>getRemotePort :  <%=remotePort %></li>
	</ul>
	<h3>헤더 관련 메서드</h3>
	<p>
		브라우저는 사용자가 웹 요청을 보내면, 기본적인 정보를 같이 전달한다.
		이 정보값7들은 요청헤더에 설정되어서 넘어가게 전달된다.
		이 값들을 활용해서 사용하고 싶다면 헤더관련 메서드를 이용하면
	</p>
	<%
		String userAgent = request.getHeader("User-agent");
		var headerNames = request.getHeaderNames();
	%>
	<p>
		User-Agent 헤더값 : <%=userAgent %>
	</p>
	<ul>
		<% 
		while(headerNames.hasMoreElements()) {
			String name = headerNames.nextElement();
			out.println("<li>"+name+"</li>");
		} 
		%>
	</ul>
	<h3>파라미터 관련 메서드</h3>
	<p>
		파라미터 관련 메서드들은 클라이언트가 전달하는 데이터를 추출하기 위해서 사용하는 메서드들이다.
	</p>
	<ul>
		<li>queryString : 전달받은 쿼리스트링(?뒷부분의 문자열)추출</li>
		<li>getParameter : 특정이름의 파라미터 값을 추출 ==> 문자열</li>
		<li>getParameterValues : 특정이름의 파라미터값을 추출 ==> 문자열 배열</li>
		<li>getParameterNames : 모든 요청 파라미터 이름을 추출 ==> Enumeration</li>
		<li>getParamaeterMap : 모든 요청 파라미터를 맵 형태로 추출  ==> Map&lt;String, String[]&gt;</li>	
	</ul>
	<h3>기타 유용한 메서드</h3>
	<p>
		이 외에도 세션, 쿠키, 인증 정보를 추출하는 메서드들도 존재한다.
		이 메서드들은 로그인기능 등을 구현하면서 사용법을 익혀보자. 
	</p>
</body>
</html>






