<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean header_auth = (boolean)session.getAttribute("auth");
	String header_authUserId = (String)session.getAttribute("auth_user_id");
	
	UserDao header_userDao = new UserDao();
	User header_authUser = header_userDao.findByUserId(header_authUserId);
%>      
<%-- header include --%>
<link rel="icon"  href="<%=application.getContextPath()%>/favicon.ico">
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css"/>
<div>
	<%-- banner /login & join shortcut / search --%>
	<div style="display: flex; align-items: center; justify-content: space-between;">
		<%-- banner --%>
		<div>
			<h1 style="font-weight: lighter;">📚동네도서관</h1>
		</div>
		<%--search --%>
		<div>
			<input type="text" placeholder="검색어를 입력하세요" class="srch-bar"/>		
		</div>
		<%--login & join shortcut --%>
		<%if(!header_auth) {%>
		<div>
			<a href="<%=application.getContextPath() %>/member/login.jsp" 
			class="no-deco-link ">로그인</a> |
			<a href="<%=application.getContextPath() %>/member/join.jsp" 
			class="no-deco-link ">회원가입</a>
		</div>
		<%}else{ %>
		<div>
			<a href="<%=application.getContextPath() %>/member/logout.jsp" 
			class="no-deco-link "><%=header_authUser.nickname() %>님 로그아웃</a> | <a 
			href="<%=application.getContextPath() %>/mylib/mypage.jsp" 
			class="no-deco-link " >마이페이지</a>
		</div>
		<%} %>
	</div>
	<%-- shortcut 링크 --%>
	<hr/>
	<div style="display: flex; align-items: center; justify-content: space-around; margin: 20px">
		<div><a href="" class="no-deco-link fs-large">도서관소개</a></div>
		<div><a href="<%=application.getContextPath() %>/book/book-list.jsp"  class="no-deco-link fs-large">도서 검색</a></div>
		<div><a href="<%=application.getContextPath() %>/feed/list.jsp"  class="no-deco-link fs-large">열린공간</a></div>
	</div>
	<hr/>
</div>
