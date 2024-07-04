<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();
	// System.out.println(uri);
	String extractUri = uri.substring(request.getContextPath().length());
	System.out.println(extractUri);
%>
<p>
	<% if(extractUri.equals("/overview.jsp")) { %>
		<b>Overview</b>
	<% }else { %>
		<a href="<%=request.getContextPath()%>/overview.jsp">Overview</a>
	<% } %>
	 | 
	 
	<% if(extractUri.equals("/built-in/about-out.jsp")){ %>
	 	<b>out</b>
	<% } else { %>
	 	<a href="<%=request.getContextPath()%>/built-in/about-out.jsp">out</a> 
	<% } %>	
	|
	<% if(uri.endsWith("/built-in/about-request.jsp")){ %>
		<b>request</b>	
	<% } else {%>
		<a href="<%=request.getContextPath()%>/built-in/about-request.jsp">request</a>
	<% } %>
	
	|
	<% if(uri.endsWith("/built-in/about-response.jsp")){ %>
		<b>response</b>	
	<% } else {%>
		<a href="<%=request.getContextPath()%>/built-in/about-response.jsp">response</a>
	<% } %>
	|
	<% if(uri.endsWith("/built-in/about-session.jsp")){ %>
		<b>session</b>	
	<% } else {%>
		<a href="<%=request.getContextPath()%>/built-in/about-session.jsp">session</a>
	<% } %>
	|
	<% if(uri.endsWith("/built-in/about-session-2.jsp")){ %>
		<b>session02</b>	
	<% } else {%>
		<a href="<%=request.getContextPath()%>/built-in/about-session-2.jsp">session02</a>
	<% } %>
	|
	<% if(uri.endsWith("/built-in/about-application.jsp")){ %>
		<b>application</b>	
	<% } else {%>
		<a href="<%=request.getContextPath()%>/built-in/about-application.jsp">application</a>
	<% } %>
	
</p>











