<%@page import="java.sql.Date"%>
<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.concurrent.atomic.AtomicReferenceFieldUpdater"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String writerId = (String)session.getAttribute("auth_user_id");
	String title = request.getParameter("title");
	String body = request.getParameter("body");
	
	//(int no, String writerId, String title, String body, Date writedAt, int readCnt)
	Feed one = new Feed(0, writerId, title, body, new Date(System.currentTimeMillis()), 0);
	FeedDao feedDao = new FeedDao();
	
	boolean r = feedDao.save(one);
	if(r){
		response.sendRedirect(application.getContextPath()+"/feed/list.jsp");
	}else{
%>		
	<script>
		window.alert("의견을 남기는 데 오류가 발생하였습니다.");
		history.go(-1);
	</script>
<% }%>
