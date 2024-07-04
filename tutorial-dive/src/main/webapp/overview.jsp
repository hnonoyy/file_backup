<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutorial Dive</title>
</head>
<body>
	<%@ include file="/nav.jsp" %>
	<h2>Tutorial Part 2</h2>
	<p>
		<b>tutorial</b> 프로젝트를 통해 전반적인 흐름, JSP 파일 작성 요령, 사용자의 데이터 처리 부분에 대해 살펴보았다.
	</p>
	<p>
		이번 <b>tutorial-dive</b> 프로젝트에서는 내장객체(Implicit Object)에 대해 살펴보고 이런 객체들을 통해
		보다 다양한 작업을 수행해보려한다.
	</p>
	<h3>내장객체(Built-in Object / Implicit Object)</h3>
	<p>
		내장객체는 JSP 환경에서 자동으로 사용할 수 있도록 사전에 정의된 객체들을 말한다.
		별도 생성 과정 없이 직접 사용할 수 있다. 총 8 (+1) 개의 내장객체가 존재한다.
	</p>
	<ul>
		<li>JspWriter out : 클라이언트로 출력을 처리하는데 사용된다.</li>
		
		<li>HttpServletRequest request ☆ : 클라이언트의 요청정보를 포함하고 있으며, 
			이를 통해 사용자 입력값, 쿠기, 요청 헤더 등을 다룰 수 있게 된다.</li>
		<li>HttpServletResponse response ☆ : 클라이언트에게 응답을 보낼 때 사용되며, 
			응답 타입 설정, 응답 헤더 설정 등을 할 수 있다.</li>
		<li>HttpSession session ☆ : 사용자가 웹 서버에 연결된 동안 유지되는 저장소로, 
			사용자별 개별 처리를 할 수 있다.</li>
		<li>ServletContext application ☆ : 어플리케이션의 전체 상태를 관리하며, 
			모든 사용자가 공유할 수 있는 리소스를 관리하는데 사용한다.</li>
		<li>ServletConfig config : 웹 어플리케이션의 초기 파라미터를 접근할 때 사용한다.</li>
		<li>PageContext pageContext : 현재 페이지의 정보와 동작을 관리하며, 
			다른 내장객체에 접근할 수 있는 방법을 제공한다.</li>
		<li>Object page : 현재 JSP 페이지의 인스턴스값을 담고 있다.</li>
		<li>Exception exception : errorPage에서만 존재하는 값으로 예외값을 가지고 있다.</li>
	</ul>
	
	
	<p>
	<a href="<%=request.getContextPath() %>/built-in/about-out.jsp">out</a>
	<a href="<%=request.getContextPath() %>/built-in/about-request.jsp">request</a>
	</p>
	<form action="<%=request.getContextPath() %>/built-in/about-request.jsp" method="post">
		<input type="text" name="query"/><button>전송</button>
	</form>
	
</body>
</html>