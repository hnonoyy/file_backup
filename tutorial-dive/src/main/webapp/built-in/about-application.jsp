<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/built-in/error.jsp" %>
<%
	int code = application.hashCode();
	String id = Integer.toString(code, 16);
	//application.log("로그테스트"); //println처럼 서버에서 뜬다(log파일에 생성됨)
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application :: built-in Object</title>
</head>
<body>
<%@ include file="/nav.jsp" %>
	<h2>ServletContext application</h2>
	<p><%=id %></p>
	<p> 
		application 이라는 내장객체는 ServletContext 객체로, 
		웹 어플리케이션 전반에 걸친 정보 및 설정을 확인하거나 변경하고자 할 때 사용되는 객체이다.
		이 application 객체는 서바가 이 웹 어플리케이션에 부여되는 객체이다.(만들어지는건 서버가 켜지면서)
	</p>
	<p>
		JSP에서는 빌트인 객체로 잡혀있지만, 확보할 수 있는 방법은 그것말고도 몇가지가 있다.
	</p>
	<ul>
		<li>request.getServletContext() : <%=application == request.getServletContext() %></li>
		<li>session.getServletContext() : <%=application == session.getServletContext() %></li>
	</ul>
	<p>
		application 객체를 이용해서 프로젝트의 설정 자체를 변경하는 작업은 보통 하지 않고,
		특정 메서드만 주로 사용하게 된다.
	</p>
	<h4>로깅 관련 메서드</h4>
	<ul>
		<li>log(String message) : 로그 남길 때 사용</li>
		<li>log(String message, Throwable t) : 예외 정보와 함께 로그를 남길 때 사용</li>
	</ul>
	<h4>서버 관련 메서드</h4>
	<ul>
		<li>getServerInfo() : <%=application.getServerInfo() %> : WAS 이름과 버전</li>
		<li>getContextPath() : <%=application.getContextPath() %> : 웹 어플리케이션의 컨텍스트 경로 반환 </li>
	</ul>
	<h4>컨텍스트 초기 파라미터 관련 메서드</h4>
	<ul>
		<li>getInitParameter(String name) : <%=application.getInitParameter("title") %></li> 
		<li><del>getInitParameterNames(String name) : 모든 컨텍스트 초기 파라미터의 이름을 반환 (Enumeration)</del></li> 
	</ul>
	<h4>저장소 관련 메서드</h4>
	<ul>
		<li>setAttribute(String name, Object object) :데이터 저장</li>
		<li>getAttribute(String name) :데이터 읽기</li>
		<li>removeAttribute(String name) :데이터 삭제</li>
	</ul>
	<p>
		session과 다른 점은 숫자야구라고 생각했을 때 랭킹시스템이 있을 때 session은 나 혼자만 보는 느낌..?
		application은 그 프로젝트 전체적으로 확인..? 대신 서버꺼지면 날아가서 DB나 file에 올려야함
	</p>
	<%
	
	%>

</body>
</html>