<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String authUserId = (String)session.getAttribute("auth_user_id");
	
	String title = request.getParameter("title");
	String body = request.getParameter("body");
	int no = Integer.parseInt(request.getParameter("no"));
	
	Feed feeds = new Feed(no, null, title, body, null, 0);
	FeedDao feedDao = new FeedDao();
	
	boolean result;
	if(!feedDao.findByNo(no).writerId().equals(authUserId)) {
		result = false;
	}else {
		result = feedDao.updateWrite(feeds);
	}
	
	
	if(result){
	
	%>
	<script>
		window.alert("정보가 수정되었습니다.");
		location.href="<%=application.getContextPath()%>/feed/view.jsp?no=<%=no%>";
	</script>
	<%}else{%>
	<script>
		window.alert("정보를 수정할 수 없습니다.");
		// location.href="<%=application.getContextPath()%>/feed/update.jsp?no=<%=no%>";
		history.go(-1);
	</script>
	<%}%>