<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String authUserId = (String)session.getAttribute("auth_user_id");
	int no = Integer.parseInt(request.getParameter("no"));
	
	FeedDao feedDao = new FeedDao();
	
	Feed found = feedDao.findByNo(no);
	boolean result;
	
	
	if(found == null || found.writerId() == null || !found.writerId().equals(authUserId)) {
		result= false;
	}else {
		result= feedDao.deleteWriteView(no);
	}
	
	if(result){ %>
	<script>
		window.alert("정상적으로 글이 삭제되었습니다.");
		location.href="<%=application.getContextPath()%>/feed/list.jsp";
	</script>
<% }else{ %>
		<script>
		window.alert("삭제가 되지않았습니다.\n 존재하지않는 글이거나 삭제 권한이 없습니다.")
		</script>
<% }%>
