<%@tag import="java.time.LocalDate"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="align" type="java.lang.String" %>
<%
	LocalDate date = LocalDate.now();
	align = align == null? "left" : align;
%>
<p style="text-align: <%=align%>">
	<%= date %>
</p>